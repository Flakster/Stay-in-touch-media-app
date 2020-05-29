# frozen_string_literal: true

class FriendshipsController < ApplicationController
  include UserHelper

  def create
    receiver_id = params[:receiver].to_i
    Friendship.create(sender_id: current_user.id, receiver_id: receiver_id, status: 'pending')
    redirect_to request_friendship_caller
  end

  def update
    f = Friendship.find(params[:id])
    f.update(status: params[:status])
    redirect_to users_notifications_path
  end
end
