puts "🌱 Seeding data..."

10.times do 
    
    user = User.create(
        name: Faker::Internet.username,
        email: Faker::Internet.email(name: 'Nancy'),
        password_hash: Faker::Internet.password
    )

    rand(1..5).times do
        Project.create(
            title: Faker::Company.industry,
            description: Faker::Company.catch_phrase,
            user_id: user.id
        )
    end

    rand(1..10).times do
        Skill.create(
        name: Faker::Company.profession,
        user_id: user.id,
        createdAt: Time.now
    )
    end
end


    

    # # create between 1 and 5 reviews for each product
    # rand(1..5).times do
    #     Review.create(
    #         star_rating: rand(1..5),
    #         comment: Faker::Quote.matz,
    #         product_id: product.id,
    #         user_id: user.id
    #     )
    # end


puts "Done 🌱 Seeding"