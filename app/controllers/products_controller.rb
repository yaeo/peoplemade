class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @edit_product_lists = current_user.company.products
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to root_url
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
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_url
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :company_id, :url,
                                      :images_attributes => [:image])
    end
end
