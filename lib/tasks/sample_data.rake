namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_kpts
  end
end

def make_kpts
  50.times do |n|
    fake_content = Faker::Lorem.sentence
    Kpt.create!(keep: fake_content,
                problem: fake_content,
                try: fake_content)
  end
end