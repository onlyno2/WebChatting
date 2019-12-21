# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating users'
100.times do |i|
  puts "#{i}"
  User.create(
    name: "User#{i}",
    email: "User#{i}@example.com",
    password: '123456',
    password_confirmation: '123456'
  )
end

puts 'Creating posts'
users = User.all
users.each do |user|
  puts "Creating #{user.name} posts"
  3.times do |i|
    puts i
    post = Post.new(
      title: Faker::Lorem.sentence(word_count: 4, supplemental: false, random_words_to_add: 8),
      content: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 40)
    )
    puts "Adding #{post.title}"
    user.posts << post
  end
end
