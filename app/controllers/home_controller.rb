class HomeController < ApplicationController
  def index
    #メインピックアップストーリー用に最新と次最新のストーリーを取得
    @pickup_stories = Story.published.order("updated_at DESC").limit(2)
    #ストーリーの一覧表示用に3番目に新しいストーリーから取得
    @stories = Story.published.order("updated_at DESC")[2..-1]
    #商品の一覧表示用に全商品を取得
    @product_lists = Product.all
    #注目ストーリー用に3つストーリーを取得
    @recommend_stories = Story.published.order("RAND()").limit(3)
    #ストーリーを掲載した企業を取得する
    unique_story_ids = Story.select("user_id").distinct
    user_ids = unique_story_ids.map(&:user_id)
    @company_lists = Company.where(user_id: user_ids)
  end

  def about
    render file: 'public/about.html.haml'
  end
end
