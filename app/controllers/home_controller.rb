class HomeController < ApplicationController
  def index
    @list_stories = Story.all
  end
end
