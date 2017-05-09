require 'random_data'

15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

50.times do
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by(
  title: 'This is a unique Post',
  body: 'This post is meant to serve as a unique seed for the database. It will
  first check to see if this post exists and if it doesnt it gets created.
  Should this post already exist it will not be duplicated.'
)

Comment.find_or_create_by(
  post: posts.sample,
  body: "This is a unique comment, enter any trolling comments that you would like."
)

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
