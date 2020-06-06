# frozen_string_literal: true

class UsersController < ApplicationController
  include UserHelper
  before_action :authenticate_user!

  def index
    @users = User.all
    request_friendship_caller_set(users_path)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    request_friendship_caller_set(user_path(@user.id))
  end

  def notifications
    @pending = current_user.senders
  end
end
