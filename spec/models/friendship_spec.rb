require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { User.new }
  let(:sender) { User.create(username: 'Sender test') }
  let(:user_1) { User.create(username: 'User test 1') }

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
end