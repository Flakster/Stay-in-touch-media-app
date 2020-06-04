# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  scope :friendship, lambda { |sender_id, receiver_id|
    where(sender_id: sender_id)
      .where(receiver_id: receiver_id)
  }
end
