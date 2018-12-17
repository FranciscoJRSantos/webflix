class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :protect_profile, except: %i[new create]

  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.next_payment = Time.now

    sign_in(@user)

    if @user.save
      flash[:success] = 'User created successfully'
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    @favorites = UserContent.includes(:content).where(user_id: current_user.id, favorite: true)
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  # PATCH /users/:id
  def update
    @user = User.find(params[:id])

    sign_in(@user)

    if @user.update(user_params)
      flash[:success] = 'User updated successfully'
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  # DELETE /users/:id
  def destroy
    user = User.find(params[:id])

    if user.destroy
      flash[:success] = 'User deleted successfully'
    else
      flash[:danger] = 'User could not be deleted'
    end
    redirect_to dashboard_path
  end

  def change_role
    user = User.find(params[:id])
    user.change_role
    redirect_back(fallback_location: root_path)
  end

  private

  def user_params
    attrs = %i[email username password password_confirmation credit_card_number]
    params.require(:user).permit(attrs)
  end

  def protect_profile
    user = User.find_by(id: params[:id])
    redirect_back(fallback_location: root_path) unless !user.nil? && user.id == current_user.id
  end
end
