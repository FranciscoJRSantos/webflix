class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager, only: %i[new create]
  before_action :set_content, only: %i[show edit update destroy]

  def index
    @contents = Content.includes(:user_content).all
    if search_params.empty?
      @contents = Content.includes(:user_content).all.order('year DESC')
    else
      @contents = Content.includes(:user_content)
                         .search(search_params[:title],
                                 search_params[:director],
                                 search_params[:first_year],
                                 search_params[:second_year],
                                 search_params[:category])
                         .order("year #{search_params[:order]}")
    end
  end

  def show
  end

  def new
    @content = Content.new
  end

  def edit
  end

  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.create_content(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @content.update_content(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    attrs = %i[title director year category file_path]
    params.require(:content).permit(attrs)
  end

  def search_params
    attrs = %w[title director first_year second_year category order]
    params.permit(attrs)
  end

  def authorize_manager
    redirect_back(fallback_location: root_path) unless current_user.is_manager
  end
end
