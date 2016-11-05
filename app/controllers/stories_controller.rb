class StoriesController < ApplicationController
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

  private
    def story_params
      params.require(:story).permit(:title, :intro, :user_id, :status, topics_attributes: [:image, :caption, :heading, :content])
    end
end
