class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :is_company_nil?, only: [:new]

  def index
    @edit_product_lists = current_user.company.products
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    product = Product.new(product_params)
    if product.save
      flash[:notice] = "商品を登録しました。"
      redirect_to root_url
    else
      flash[:alert] = "商品の保存に失敗しました。"
      @product = Product.new(product_params)
      render action: "new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品を編集しました。"
      redirect_to root_url
    else
      flash[:alert] = "商品の編集に失敗しました。"
      @product = Product.find(params[:id])
      @product.images.build
      render action: "edit"
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_url
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :company_id, :url,
                                      :images_attributes => [:image, :image_cache])
    end
end
