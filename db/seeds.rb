require 'faker'

User.create!(
  name: "admin",
  email: "admin@gmail.com",
  password: "123456",
  birthday: "1/1/1997",
  sex: 1,
  role: 1
)

10.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Name.unique.first_name + "@gmail.com",
    password: "123456",
    birthday: "1/1/1997",
    sex: 1,
    role: 3
  )
end

10.times do |n|
  @category = Category.create!(
    title: Faker::SiliconValley.unique.company
  )

  @user = User.create!(
    name: Faker::Name.name,
    email: Faker::Name.unique.first_name + "@gmail.com",
    password: "123456",
    birthday: "1/1/1997",
    sex: 1,
    role: 2
  )

  CategoryManagement.create!(
    moderator_id: @user.id,
    category_id: @category.id
  )

  5.times do |m|
    @topic = @category.topics.create!(
      title: Faker::SiliconValley.invention,
      user_id: rand(1..10),
      content: Faker::Lorem.paragraphs[0],
      status: rand(1..3)
    )
    count_user = User.count
    rand(1..10).times do |i|
      @topic.votes.create!(
        user_id: rand(1..count_user),
        status: rand(-1..1)
      )
    end
    3.times do |j|
      @post = @topic.posts.create!(
        title: Faker::Lorem.unique.sentence,
        content: Faker::Lorem.paragraphs[0],
        status: rand(1..2)
      )
      rand(1..10).times do |k|
        @post.votes.create!(
          user_id: rand(1..count_user),
          status: rand(-1..1)
        )
      end
    end
  end
end
