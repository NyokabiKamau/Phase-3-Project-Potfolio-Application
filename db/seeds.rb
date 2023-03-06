puts "🌱 Seeding data..."

puts "Deleting old data..."
Project.destroy_all
Skill.destroy_all
User.destroy_all


1.times do 
    user = User.create(
        name: Faker::Internet.username,
        email: Faker::Internet.email(name: 'Nancy'),
        password_hash: Faker::Internet.password
    )

    rand(4..7).times do
        Project.create(
            title: Faker::Company.industry,
            description: Faker::Company.catch_phrase,
            user_id: user.id
        )
    end

    rand(4..10).times do
        Skill.create(
        name: Faker::Company.profession,
        user_id: user.id,
        createdAt: Time.now
    )
    end
end


puts "Done 🌱 Seeding"