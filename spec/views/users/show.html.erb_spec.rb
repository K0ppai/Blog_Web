require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Koppai', photo: 'https://picsum.photos/id/23/200', bio: 'Micronaut')
    @post1 = Post.create(author: @user, title: 'Post 1', text: 'This is how')
    visit user_path(@user)
    Post.create(author: @user, title: 'Post 2', text: 'This is how')
    visit user_path(@user)
    Post.create(author: @user, title: 'Post 3', text: 'This is how')
    visit user_path(@user)
  end

  it "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/200']")
  end

  it "I can see the user's username" do
    expect(page).to have_content('Koppai')
  end

  it 'I can see the number of posts' do
    expect(page).to have_content("Number of posts: #{@user.post_counter}")
  end

  it "I can see the user's bio" do
    expect(page).to have_content('Micronaut')
  end

  it "I can see the user's first 3 posts." do
    expect(page).to have_selector('.post', count: 3)
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
  end

  it "I can see a button that lets me view all of a user's posts." do
    expect(page).to have_selector('#all-posts-btn')
    expect(page).to have_content('See all posts')
  end

  it "When I click a user's post, it redirects me to that post's show page" do
    click_on('Post 1')
    expect(current_path).to eq(user_post_path(user_id: @user, id: @post1))
  end

  it "When I click to see all posts, it redirects me to the user's post's index page" do
    click_on(id: 'all-posts-btn')
    expect(current_path).to eq(user_posts_path(user_id: @user))
  end
end
