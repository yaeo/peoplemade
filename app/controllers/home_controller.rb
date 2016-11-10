class HomeController < ApplicationController
  def index
    @list_stories = Story.published
    @recommends_stories = Story.published.limit(3).order("updated_at DESC")
  end
end
