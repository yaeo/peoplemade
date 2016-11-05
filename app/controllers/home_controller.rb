class HomeController < ApplicationController
  def index
    @list_stories = Story.published
  end
end
