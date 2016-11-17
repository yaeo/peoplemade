class CompaniesController < ApplicationController
  def show
    @company = Company.find_by(custom_url: params[:custom_url])
    @company_stories = @company.user.stories.published
    @products = @company.products
  end
end
