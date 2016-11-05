class CompaniesController < ApplicationController
  def show
    @company = Company.find_by(custom_url: params[:custom_url])
  end
end
