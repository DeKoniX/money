#encoding: utf-8
namespace :db do
  desc "Заполнение базы фейковыми данными"
  task populate: :environment do
    admin = User.create!(name: "DeKoniX",
                email: "dekonix@gmail.com",
                password: "hamster",
                password_confirmation: "hamster")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@ex.com"
      password = "password"
      User.create!(name: name,
                  email: email,
                  password: password,
                  password_confirmation: password)
    end
  end
end
