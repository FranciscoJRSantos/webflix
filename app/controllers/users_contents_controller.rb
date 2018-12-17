class UsersContentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contents = UserContent.includes(:content).where(user_id: current_user.id)
    render 'user_content/index'
  end

  def add_watch_list
    content = Content.where(id: content_params)
    new_user_content = UserContent.new(user_id: current_user.id,
                                       content_id: content_params)
    new_user_content.save unless in_watch_list? || content.nil?
    redirect_back(fallback_location: root_path)
  end

  def remove_watch_list
    user_content = UserContent.by_id(user_id: current_user.id,
                                     content_id: content_params)
    !user_content.nil? && user_content.first.destroy
    redirect_back(fallback_location: root_path)
  end

  def add_favorite
    user_content = UserContent.by_id(user_id: current_user.id,
                                     content_id: content_params)
    user_content.first.update_attribute(:favorite, true) unless !in_watch_list?
    redirect_back(fallback_location: root_path)
  end

  def remove_favorite
    user_content = UserContent.by_id(user_id: current_user.id,
                                     content_id: content_params)
    user_content.first.update_attribute(:favorite, false) unless in_watch_list?
    redirect_back(fallback_location: root_path)
  end

  private

  def in_watch_list?
    user_content = UserContent.by_id(user_id: current_user.id,
                                     content_id: content_params)
    !user_content.empty?
  end

  def content_params
    params.require('id')
  end
end
