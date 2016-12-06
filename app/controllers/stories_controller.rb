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
      if story.status == "inreview"
          render action: "accept_inreview"
      else
        flash[:notice] = "ストーリーを下書き保存しました。"
        redirect_to root_url
      end
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
      if @story.status == "inreview" #申請だった場合、申請完了ページを表示する
        render action: "accept_inreview"
      else #下書きだった場合、トップに戻るを表示する
        flash[:notice] = "ストーリーを編集しました。"
        redirect_to root_url
      end
    else
      flash[:alert] = "ストーリーの編集に失敗しました。"
      render action: "edit"
    end
  end

  def destroy
    @story.update(status: "deleted")
    flash[:notice] = "ストーリーを削除しました。"
    redirect_to stories_url
  end

  def accept_inreview

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
