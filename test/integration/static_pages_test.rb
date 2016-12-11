require 'test_helper'

class StaticPagesTest < ActionDispatch::IntegrationTest

  test "can see about us page" do
    get '/about'
    assert_response :success
    assert_select "h1", "People Made[ピープルメイド]は、商品とそのバックグラウンドストーリーを投稿/共有できるポータルサイトです。隠れていた良質な商品とバイヤーの方たちが出会える場所を目指しています。"
  end
  
end
