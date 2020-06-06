# frozen_string_literal: true

class FriendshipsController < ApplicationController
  include UserHelper

  def create
    receiver_id = params[:receiver].to_i
    Friendship.create(sender_id: current_user.id, receiver_id: receiver_id, status: 'pending')
    Friendship.create(sender_id: receiver_id, receiver_id: current_user.id, status: 'sent')
    respond_to do |format|
      format.html { redirect_to request_friendship_caller, notice: 'friendship request sended!' }
      format.js
    end
  end

  def update
    f = Friendship.find(params[:id])
    f1 = Friendship.where(sender_id: current_user.id, receiver_id: f.sender_id).first
    f.update(status: params[:status])
    f1.update(status: params[:status])
    respond_to do |format|
      format.html { redirect_to users_notifications_path, notice: "friendship request #{params[:status]}!" }
      format.js
    end
  end
end
