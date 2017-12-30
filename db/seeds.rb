require 'random_data'

# Create Posts
50.times do
    
    Post.create!(
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
        title:"Aaaa Peats!", 
        body: "Look at these teats! You can't have yer puddins if yon't eat yer meats."
    )
    upost.comments.find_or_create_by!(body: "A very unique thing to say indeed.")


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"