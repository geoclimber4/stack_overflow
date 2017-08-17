require 'faker'

10.times do
  User.create!(user_name: Faker::Pokemon.name, password: 'password', email: Faker::Internet.email)
end

10.times do
  Question.create!(title: Faker::Hipster.sentence, text: Faker::Hipster.paragraph, author_id: rand(1..10))
end

25.times do
  Answer.create!(text: Faker::Hipster.paragraph, author_id: rand(1..10), question_id: rand(1..10))
end

60.times do
  comment = Comment.new(text: Faker::ChuckNorris.fact, author_id: rand(1..10))
  comment.commentable = Answer.all.sample
  comment.save
end

60.times do
  comment = Comment.new(text: Faker::ChuckNorris.fact, author_id: rand(1..10))
  comment.commentable = Question.all.sample
  comment.save
end

50.times do
  vote = Vote.new(voter_id: User.all.sample.id, value: [-1, 1].sample)
  vote.votable = Question.all.sample
  vote.save
end

50.times do
  vote = Vote.new(voter_id: User.all.sample.id, value: [-1, 1].sample)
  vote.votable = Comment.all.sample
  vote.save
end

50.times do
  vote = Vote.new(voter_id: User.all.sample.id, value: [-1, 1].sample)
  vote.votable = Answer.all.sample
  vote.save
end
