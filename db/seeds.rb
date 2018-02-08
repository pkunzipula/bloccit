require 'random_data'

5.times do 
    User.create!(
        name: RandomData.random_name,
        email: RandomData.random_email,
        password: RandomData.random_sentence
    )
end
users = User.all

user = User.first
# user.update_attributes!(
#     email: 'jcapra76@gmail.com',
#     password: 'helloworld'
# )

15.times do
    Topic.create!(
        name: RandomData.random_sentence,
        description: RandomData.random_paragraph
    )
end

topics = Topic.all

19.times do
    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: false
    )
end

46.times do 
    Advertisement.create!(
        title: RandomData.random_sentence,
        copy: RandomData.random_paragraph,
        price: rand(3..99)
    )
end

92.times do
    SponsoredPost.create!(
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: rand(6..142)
    )
end

# Create Posts
50.times do
    
    Post.create!(
        topic: topics.sample,
        user: users.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end

posts = Post.all

# Create Comments
100.times do
    
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

#Create Unique Post
    upost = Post.find_or_create_by!(
        topic: topics.sample,
        user: users.sample,
        title:"Aaaa Peats!", 
        body: "Look at these teats! You can't have yer puddins if yon't eat yer meats."
    )
    upost.comments.find_or_create_by!(body: "A very unique thing to say indeed.")




puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions asked"
puts "#{SponsoredPost.count} sponsored posts created"