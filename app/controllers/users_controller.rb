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
    #@userにsocialが存在しなかったらbuildしてあげる
    if @user.social.nil?
      @user.build_social
    end

    #TODO industry_typeモデルをつくる
    @industry_type = ['水産・農林業', '鉱業', '建設業', '製造業', '電気・ガス業', '倉庫・運輸関連業', '情報通信', '商業（卸売業、小売業）', '金融・保険業', '不動産業', '飲食店・宿泊業', '医療・福祉', '教育・学習支援業', 'サービス業', '官公庁・地方自治体', '財団法人・社団法人', 'NPO・NGO']
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
        company_attributes: [:id, :custom_url, :contact_person_name, :contact_person_kana, :name, :kana,
          :ceo_name, :homepage_url, :industry_type, :profile, :vision, :recruit_url, :about_url, :establish_y, :establish_m, :establish_d],
        address_attributes: [:id, :zipcode1, :zipcode2, :prefecture, :address1, :address2, :telnumber],
        social_attributes: [:id, :facebook, :twitter, :youtube, :instagram, :wantedly],
        )
    end
end
