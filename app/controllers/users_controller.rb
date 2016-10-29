class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, company_attributes: [:id, :custom_url])
    end
end
