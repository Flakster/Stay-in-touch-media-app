# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  scope :pending_friendships_request, lambda { |user_id|
    joins(:sender)
      .where(receiver_id: user_id, status: 'pending')
      .select('users.id as sender_id, users.name as sender')
      .order('friendships.created_at asc')
  }

  scope :pending_friendships_request_count, lambda { |user_id|
    joins(:sender)
      .where(receiver_id: user_id, status: 'pending')
      .count
  }

  scope :friendship, lambda { |sender_id, receiver_id|
   where("(sender_id = #{sender_id} and receiver_id = #{receiver_id})
    or (sender_id = #{receiver_id} and receiver_id = #{sender_id})
    ")
  }
end
