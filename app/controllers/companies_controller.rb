class CompaniesController < ApplicationController
  def index
    @companies = Company.recent_companies
  end
end