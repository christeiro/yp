class CompaniesController < ApplicationController
  def index
    @companies = Company.recent_companies
  end

  def show
    @company = Company.find(params[:id])
    @reviews = @company.reviews
  end
end