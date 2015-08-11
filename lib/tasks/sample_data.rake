namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_kpts
  end
end

def make_users
  User.create!(name: "example user",
               email: "example-0@example.com")
  50.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@example.com"
    User.create!(name: name,
                 email: email)
  end
end

def make_kpts
  users = User.all.limit(5)
  50.times do
    fake_content = Faker::Lorem.sentence
    users.each do |user|
      user.kpts.create!(keep: fake_content,
                        problem: fake_content,
                        try: fake_content)
    end
  end
end