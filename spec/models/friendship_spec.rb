# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { User.new }
  let(:sender) { User.create(name: 'Sender test', email: 'sender@mail.com', password: '123456') }
  let(:user_1) { User.create(name: 'User test 1', email: 'user_1@mail.com', password: '123456') }
  let(:user_2) { User.create(name: 'User test 2', email: 'user_2@mail.com', password: '123456') }
  let(:user_3) { User.create(name: 'User test 3', email: 'user_3@mail.com', password: '123456') }
  let(:user_4) { User.create(name: 'User test 4', email: 'user_4@mail.com', password: '123456') }
  let(:new_friend_ship) { Friendship.new }

  context 'Friendship relation with Users:' do
    it 'store many friendships for receivers.' do
      f = Friendship.reflect_on_association(:receiver)
      expect(f.macro).to eq(:belongs_to)
    end

    it 'store many friendships for senders.' do
      f = Friendship.reflect_on_association(:sender)
      expect(f.macro).to eq(:belongs_to)
    end
  end

  context 'User pending friendships request' do
    before do
      friendship = Friendship.new
      friendship.sender_id = sender.id
      friendship.receiver_id = user_1.id
      friendship.status = 'pending'
      friendship.save
    end

    it 'show the user the number of friendships request he or she has pending' do
      expect(Friendship.pending_friendships_request_count(user_1.id)).to be 1
    end

    it 'show a list of pending friendships request for the user' do
      expect(Friendship.pending_friendships_request(user_1.id).first.sender.id).to be sender.id
    end
  end

  context 'Sending friendship requests' do
    before do
      friend = [user_1.id, user_2.id, user_3.id]
      status = %w[pending accepted rejected]
      3.times do |index|
        Friendship.create(sender_id: sender.id,
                          receiver_id: friend[index],
                          status: status[index])
      end
    end

    it 'can\'t send friendship request if he or she already send one' do
      expect(Friendship.friends?(sender.id, user_1.id)).to be 1
    end

    it 'can\'t send friendship request if they are already friends' do
      expect(Friendship.friends?(sender.id, user_2.id)).to be 1
    end

    it 'can\'t send friendship request if the receiver user have rejected a previous request' do
      expect(Friendship.friends?(sender.id, user_3.id)).to be 1
    end

    it 'can send friendship request if there is no previous request' do
      expect(Friendship.friends?(sender.id, user_4.id)).to be 0
    end
  end
end
