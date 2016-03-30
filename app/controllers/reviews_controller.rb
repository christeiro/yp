class ReviewsController < ApplicationController
  before_action :require_user
  def create
    @company = Company.find(params[:company_id])
    review = @company.reviews.build(content: params[:review][:content], company: @company, user: current_user)
    if review.save
      redirect_to @company
    else
      @reviews = @company.reviews.reload
      render 'companies/show'
    end
  end
end