class UsersController < ApplicationController
  def edit
    @user = current_user
    #@userにcompanyが存在しなかったらbuildしてあげる
    if @user.company.nil?
      @user.build_company
    end
    #@userにaddressが存在しなかったらbuildしてあげる
    if @user.address.nil?
      @user.build_address
    end
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
      params.require(:user).permit(:email,
        company_attributes: [:id, :custom_url, :contact_person_name, :contact_person_kana, :name, :kana, :ceo_name],
        address_attributes: [:id, :zipcode1]
        )
    end
end
