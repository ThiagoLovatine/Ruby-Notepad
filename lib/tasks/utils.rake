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
    contacts = Contact.all

    contacts.each do |x|  

      Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: x
      )

    end
    puts "Seeding |Address| [END]"

    puts "Seeding |Phone| [BEGIN]"
    contacts = Contact.all

    contacts.each do |x|  

      Phone.create!(
        phone: Faker::PhoneNumber.phone_number,
        contact: x
      )

    end
    puts "Seeding |Phone| [END]"

  end

end
