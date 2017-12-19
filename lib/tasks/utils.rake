namespace :utils do
  desc "Popular Banco de Dados"
  task seed: :environment do
  	
  	puts "Gerando Contatos"
	500.times do |i|
		Contact.create!(
			name: Faker::Name.name,
			email: Faker::Internet.email,
			kind: Kind.all.sample,
			rmk: Faker::Lorem.sentence([1,2,3,4,5,6,7].sample)
		)
	end
	puts "Gerando Contatos [ OK ]"

	puts "Gerando Endereços"
  	Contact.all.each do |contact|	
  		Address.create!(
  			street: Faker::Address.street_address,
  			city: Faker::Address.city,
  			state: Faker::Address.state_abbr,
  			contact: contact
  		)
  	end
  	puts "Gerando Endereços [ OK ]"

  	puts "Gerando telefones"
  	Contact.all.each do |contact|	
  	  Random.rand(1..5).times do |i|
  		Phone.create!(
  			phone: Faker::PhoneNumber.phone_number,	
  			contact: contact
  		)
  		end
  	  end
  	 puts "Gerando telefones [ OK ]"
  end

end
