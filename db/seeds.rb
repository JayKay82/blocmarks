# Create custom user
me = User.new(
  name: 'Jan',
  email: 'jankroezen@me.com',
  password: 'password',
  password_confirmation: 'password'
)
me.skip_confirmation!
me.save!

# Create some random users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create some random topics
10.times do
  Topic.create(
    title: Faker::Lorem.sentence,
    user: users.sample
  )
end
topics = Topic.all

#Create some random bookmarks
50.times do
  Bookmark.create(
    url: Faker::Internet.url,
    topic: topics.sample,
    user: users.sample
  )
end


puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Bookmark.count} bookmarks created."
