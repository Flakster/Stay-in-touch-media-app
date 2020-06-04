# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |indx|
    User.create(name: "User #{indx + 1}", email: "user_#{indx + 1}@mail.com", password: '123456')
end

90.times do |index|
    Friendship.create(sender_id: index + 2, receiver_id: 1, status: 'pending')
    Friendship.create(sender_id: 1, receiver_id: index + 2, status: 'sent')
end