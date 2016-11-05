class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @edit_story_lists = current_user.stories
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
    @story.topics.build
  end

  def create
    story = Story.new(story_params)
    if story.save
      redirect_to root_path
    else
      redirect_to root_path
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

  private
    def story_params
      params.require(:story).permit(:title, :intro, :user_id, :status, topics_attributes: [:id, :image, :caption, :heading, :content])
    end

    def correct_user
      @story = Story.find(params[:id])
      redirect_to root_url unless current_user == @story.user
    end
end
