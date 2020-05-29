class FriendshipsController < ApplicationController
  include UserHelper

  def create
    receiver_id = params[:receiver].to_i
    Friendship.create(sender_id: current_user.id, receiver_id: receiver_id, status: 'pending')
    redirect_to request_friendship_caller
  end
end
