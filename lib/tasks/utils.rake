namespace :utils do

  desc "TODO"
  task seed: :environment do

    puts "Seeding |Contact| [BEGIN]"
      50.times do |i|
          Contact.create!(
              name: Faker::Name.name,
              email: Faker::Internet.unique.email,
              type: Type.all.sample,
              rmk: Faker::Lorem.sentence(3)
          )
      end
    puts "Seeding |Contact| [END]"


    puts "Seeding |Address| [BEGIN]"
    Contact.all.each do |x|  
      Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: x
      )
    end
    puts "Seeding |Address| [END]"


    puts "Seeding |Phone| [BEGIN]"
    Contact.all.each do |x|  
      Random.rand(1..5).times do
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: x
        )
      end
    end
    puts "Seeding |Phone| [END]"

  end

end
