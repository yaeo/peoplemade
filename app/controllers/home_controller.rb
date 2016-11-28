class HomeController < ApplicationController
  def index
    #最新と次最新のストーリーを取得
    @pickup_stories = Story.published.order("updated_at DESC").limit(2)
    #3番目に新しいストーリーから取得
    @stories = Story.published.order("updated_at DESC")[2..-1]
    @product_lists = Product.all
    @recommend_stories = Story.published.limit(3).order("updated_at DESC")
    unique_story_ids = Story.select("user_id").uniq
    user_ids = unique_story_ids.map(&:user_id)
    @company_lists = Company.where(user_id: user_ids)

  end
end
