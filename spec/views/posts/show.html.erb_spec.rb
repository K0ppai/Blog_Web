require "rails_helper"

RSpec.describe "posts/show.html.erb", type: :feature do
  before :each do
    @user = User.create(name: "Koppai", photo: "https://picsum.photos/id/23/200", bio: "Micronaut")
    @user2 = User.create(name: "Batman", photo: "https://picsum.photos/id/23/200", bio: "Micronaut")
    @user3 = User.create(name: "Like", photo: "https://picsum.photos/id/23/200", bio: "Micronaut")
    @post = Post.create(author: @user, title: "Post 1", text: "This is how")
    Comment.create(author: @user, post: @post, text: "Comment1")
    Comment.create(author: @user2, post: @post, text: "Comment2")
    Comment.create(author: @user3, post: @post, text: "Comment3")
    visit user_post_path(user_id: @user, id: @post)
  end

  it "I can see the post's title" do
    expect(page).to have_content("Post 1")
  end

  it "I can see who wrote the post" do
    expect(page).to have_content('"Post 1" by Koppai')
  end

  it "I can see how many comments it has" do
    expect(page).to have_content("Comments:#{@post.comments_counter}")
  end

  it "I can see how many likes it has" do
    expect(page).to have_content("Likes: #{@post.likes_counter}")
  end

  it "I can see the post body" do
    expect(page).to have_content("#{@post.text}")
  end

  it "I can see the username of each commentator" do
    expect(page).to have_content("#{@user2.name}: Comment2", normalize_ws: true)
    expect(page).to have_content("#{@user3.name}: Comment3", normalize_ws: true)
  end

  it "I can see the comment each commentor left" do
    expect(page).to have_content("#{@user2.name}: Comment2", normalize_ws: true)
    expect(page).to have_content("#{@user3.name}: Comment3", normalize_ws: true)
  end
end
