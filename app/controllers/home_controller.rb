class HomeController < ApplicationController
  def index
    @stories = Story.published.order("created_at DESC")
    @product_lists = Product.all
    @recommend_stories = Story.published.limit(3).order("updated_at DESC")
    unique_story_ids = Story.select("user_id").uniq
    user_ids = unique_story_ids.map(&:user_id)
    @company_lists = Company.where(user_id: user_ids)
    @pickup_stories = Story.published.order("updated_at DESC").limit(2)
  end
end
