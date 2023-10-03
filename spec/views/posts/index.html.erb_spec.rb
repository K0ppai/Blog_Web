require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before :each do
    @user = User.create(name: "Koppai", photo: "https://picsum.photos/id/23/200", bio: "Micronaut")
    @post1 = Post.create(author: @user, title: "Post 1", text: "This is how")
    Post.create(author: @user, title: "Post 2", text: "This is post 2")
    Post.create(author: @user, title: "Post 3", text: "This is how")
    Comment.create(author: @user, post: @post1, text: 'Comment1')
    Comment.create(author: @user, post: @post1, text: 'Comment2')
    Comment.create(author: @user, post: @post1, text: 'Comment3')
    Comment.create(author: @user, post: @post1, text: 'Comment4')
    visit user_posts_path(user_id: @user)
  end

  it "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/200']")
  end

  it "I can see the user's username" do
    expect(page).to have_content("Koppai")
  end

  it "I can see the number of posts the user has written" do
    expect(page).to have_content("Number of posts: #{@user.post_counter}")
  end
  
  it "I can see a post's title" do
    expect(page).to have_content("Post 1")
  end
  
  it "I can see some of the post's body" do
    expect(page).to have_content('This is post 2')
  end
  
  it "I can see the first comments on a post" do
    expect(page).to have_content('Comment1')
    expect(page).to have_content('Comment2')
  end
  
  it "I can see how many comments a post has" do
    expect(page).to have_content("Comments:#{@post1.comments_counter}")
  end
  
  it "I can see how many likes a post has" do
    expect(page).to have_content("Likes: #{@post1.likes_counter}")
  end
  
  it "I can see a section for pagination if there are more posts than fit on the view" do
    expect(page).to have_content("Pagination")
  end
  
  it "When I click on a post, it redirects me to that post's show page" do
    click_on("Post 1")
    expect(current_path).to eq(user_post_path(user_id: @user, id: @post1))
  end
end
