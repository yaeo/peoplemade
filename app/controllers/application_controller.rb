class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_company_nil?
    if current_user.company.nil?
      @msg = "hello world"
      redirect_to profile_url, notice: "🙇 ストーリー/商品の作成前に基本情報のご登録をお願いいたします 🙇"
    end
  end
end
