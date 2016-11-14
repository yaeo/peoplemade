class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to root_url
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
