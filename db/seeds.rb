10.times do
  User.create(full_name: Faker::Friends.character, username: Faker::HarryPotter.character, email: Faker::Internet.email, password: "1234")
end

#
# 10.times do Faker::ChuckNorris.fact
# end
