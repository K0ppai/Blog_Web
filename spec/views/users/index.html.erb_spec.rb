require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Koppai', photo: 'https://picsum.photos/id/23/200', bio: 'Micronaut')
    @user2 = User.create(name: 'Luke', photo: 'https://picsum.photos/id/23/201', bio: 'Micronaut')
    @user3 = User.create(name: 'Blue', photo: 'https://picsum.photos/id/23/202', bio: 'Micronaut')
    Post.create(author: @user, title: 'Hello', text: 'ladadee')
    visit root_path
    Post.create(author: @user2, title: 'Hello', text: 'ladadee')
    visit root_path
    Post.create(author: @user2, title: 'Hello', text: 'ladadee')
    visit root_path
  end

  it 'I can see the username of all other users' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

  it 'I can see the profile picture for each user' do
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/200']")
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/201']")
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/202']")
  end

  it 'I can see the number of posts each user has written' do
    expect(page).to have_content("Number of posts: #{@user.post_counter}")
    expect(page).to have_content("Number of posts: #{@user2.post_counter}")
    expect(page).to have_content("Number of posts: #{@user3.post_counter}")
  end

  it "When I click on a user, I am redirected to that user's show page" do
    click_link @user.name
    expect(current_path).to eq(user_path(@user))
  end
end
