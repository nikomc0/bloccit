require 'random_data'

50.times do
  Post.create!(
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

20.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
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
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
