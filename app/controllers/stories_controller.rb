class StoriesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @story = Story.new
    
    #topicに保存できるよう一緒にビルドする
    if @story.topics.nil?
      @story.build_topic
    end
  end

  def create
  end
end
