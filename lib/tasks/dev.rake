require 'faker'
namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts 'Cadastrando contatos'
    kinds = ['Amigo', 'Comercial', 'Conhecido']
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts 'CADASTRADOS'
########################################################################################
    puts 'Cadastrando contatos'
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.year.ago, to: 18.year.ago),
        kind: Kind.all.sample
      )
    end
    puts 'CADASTRADOS'
########################################################################################
    puts 'Cadastrando TELEFONES'
    Contact.all.each do |cont|
      Random.rand(5).times do 
        cont.phones.create!(
          number:Faker::PhoneNumber.cell_phone
        )
        cont.save!
      end
    end
    puts 'CADASTRADOS'
  end
end
