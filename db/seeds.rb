5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(10,20)
  )
end

users = User.all

5.times do
  RegisteredApp.create(
    name: Faker::Lorem.word,
    url: Faker::Internet.url,
    user: users.sample
  )
end

reg_app = RegisteredApp.all

7.times do
  Event.create(
    name: Faker::Lorem.word,
    registered_app: reg_app.sample
  )
end

# 5.times do
#   User.last.registered_apps.create(
#     name: Faker::Lorem.word,
#     url: Faker::Internet.url,
#   )
# end

# 6.times do
#   User.last.registered_apps.first.events.create(
#     name: Faker::Lorem.word,
#   )
# end
