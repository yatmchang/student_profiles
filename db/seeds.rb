100.times do
  user = User.create  first_name:       Faker::Name.first_name,
                      last_name:        Faker::Name.last_name,
                      email:            Faker::Internet.email,
                      password:         "123"
end

users = User.all
users.each do |user|
  user.profile.short_pitch = Faker::ChuckNorris.fact
  user.profile.long_pitch  = Faker::Lorem.paragraph
  user.profile.save
end
