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
end
