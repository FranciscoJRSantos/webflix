class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # GET /
  def index
    redirect_to dashboard_path unless current_user.nil?
  end

  # GET /dashboard
  def dashboard
    @contents = Content.includes(:user_content).all
    if search_params.empty?
      @contents = Content.includes(:user_content).order('RANDOM()').limit(@contents.length / 2)
    else
      @contents = Content.includes(:user_content)
                         .search(search_params[:title],
                                 search_params[:director],
                                 search_params[:first_year],
                                 search_params[:second_year],
                                 search_params[:category])
                         .order("year #{search_params[:order]}")
    end
    @categories = @contents.group_by { |content| content.category }
  end

  private

  def search_params
    attrs = %w[title director first_year second_year category order]
    params.permit(attrs)
  end
end
