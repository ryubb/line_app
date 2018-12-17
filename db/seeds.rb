User.create!(name: "test",
            email: "test@a.com",
            password: "foobar",
            password_confirmation: "foobar")

User.create!(name: "test2",
            email: "test2@a.com",
            password: "foobar",
            password_confirmation: "foobar")

100.times do |n|
  name  = Faker::Name.name
  email = "example-#{n}@railstutorial.org"
  password = "foobar"
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password
  )
end



50.times do
  rd = Random.rand(1..5)
  user = User.find(rd)
  user.timelines.create!(content: Faker::Lorem.sentence)
end




users = User.all
user  = users.first
from_user = users[2..70]
to_user = users[3..83]
from_user.each { |from_user| user.become_friend(from_user) }
to_user.each { |to_user| to_user.become_friend(user) }