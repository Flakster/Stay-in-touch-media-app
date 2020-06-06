# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendship_senders, -> { where status: 'pending' },
           foreign_key: :receiver_id, class_name: 'Friendship', dependent: :destroy
  has_many :senders, through: :friendship_senders, source: :sender

  has_many :friendship_receivers, -> { where status: 'pending' },
           foreign_key: :sender_id, class_name: 'Friendship', dependent: :destroy
  has_many :receivers, through: :friendship_receivers, source: :receiver

  has_many :friendship_friends, -> { where status: 'friends' },
           foreign_key: :sender_id, class_name: 'Friendship', dependent: :destroy
  has_many :friends, through: :friendship_friends, source: :receiver

  def friends_and_own_posts
    Post.where(user: [friends.select(:id)])
      .or(Post.where(user: [id]))
      .order(created_at: :desc)
  end
end
