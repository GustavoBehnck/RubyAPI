require 'faker'
namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts 'Cadastrando contatos'
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.days.ago, to: 18.days.ago)
      )
    end
    puts 'CADASTRADOS'
  end

end