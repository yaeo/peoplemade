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

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :company_id, :url,
                                      :images_attributes => [:image])
    end
end
