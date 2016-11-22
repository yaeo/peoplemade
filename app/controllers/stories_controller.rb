class StoriesController < ApplicationController
  before_action :authenticate_user!,  only: [:index, :new, :create, :edit, :update]
  before_action :is_company_nil?,     only: [:new]
  before_action :correct_user,        only: [:edit, :update, :destroy]
  before_action :is_published?,       only: [:show]
  before_action :is_deleted?,         only: [:edit]

  def index
    @edit_story_lists =  Story.where(user_id: current_user).where(status: 0)
                          .or(Story.where(user_id: current_user).where(status: 1))
                          .or(Story.where(user_id: current_user).where(status: 2))
  end

  def show
    @story = Story.find(params[:id])
    @products = @story.products
  end

  def new
    @story = Story.new
    @story.stories_products.build
  end

  def create
    story = Story.new(story_params)
    if story.save
      flash[:notice] = "ストーリーを作成しました。"
      redirect_to root_url
    else
      flash[:alert] = "ストーリーの保存に失敗しました。"
      @story = Story.new(story_params)
      @story.stories_products.build
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    @story.update(status: "deleted")
    redirect_to stories_url
  end

  private
    def story_params
      params.require(:story).permit(:content, :image, :image_cache, :title, :intro, :user_id, :status,
        { :product_ids => [] },
        topics_attributes: [:id, :image, :caption, :heading, :content])
    end

    def correct_user
      @story = Story.find(params[:id])
      redirect_to root_url unless current_user == @story.user
    end

    def is_published?
      @story = Story.find(params[:id])
      redirect_to root_url unless @story.published?
    end

    def is_deleted?
      @story = Story.find(params[:id])
      redirect_to root_url if @story.deleted?
    end
end
