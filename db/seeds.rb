User.create!(	name: "JOSHE_vende",
				email: "joseinformatico2015@gmail.com",
				password:"foobar",
				password_confirmation: "foobar",
				vendedor:true,
				admin: true,
				activated: true,
				activated_at: Time.zone.now)

User.create!(	name: "JOSHE_compra",
				email: "el_hebreo_mitico@hotmail.com",
				password:"foobar",
				password_confirmation: "foobar",
				comprador:true,
				admin: true,
				activated: true,
				activated_at: Time.zone.now)


99.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"

	User.create!(	name: name,
					email: email,
					password:password,
					password_confirmation: password,
					activated: true,
					comprador:true,
					activated_at: Time.zone.now)
	
end

# tomo los 6 primeros usuarios de la base de datos  
users = User.order(:created_at).take(6)

# creo los post para cada usuario
50.times do
content = Faker::Lorem.sentence(5)
users.each { |user| user.microposts.create!(content: content) }
end


# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
