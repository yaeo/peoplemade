class HomeController < ApplicationController
  def index
    @list_stories = Story.published.order("created_at DESC")
    @recommends_stories = Story.published.limit(3).order("updated_at DESC")
  end
end
