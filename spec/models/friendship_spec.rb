require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { User.new }
  let(:sender) { User.create(name: 'Sender test', email: 'sender@mail.com', password: '123456') }
  let(:user_1) { User.create(name: 'User test 1', email: 'user_1@mail.com', password: '123456') }

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
end