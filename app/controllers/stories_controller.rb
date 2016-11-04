class StoriesController < ApplicationController
  def index
    @story = Story.find(29)
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
      params.require(:story).permit(:title, :intro, :user_id, topics_attributes: [:image, :caption, :heading, :content])
    end
end
