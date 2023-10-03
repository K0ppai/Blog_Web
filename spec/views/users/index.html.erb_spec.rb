require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Koppai', photo: 'https://picsum.photos/id/23/200', bio: 'Micronaut')
    @post = Post.create(author: @user, title: 'Rails set up', text: 'This is how')
    visit root_path
  end

  scenario 'I can see the username' do
    expect(page).to have_content(@user.name)
  end

  scenario 'I can see the profile picture' do
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/200']")
  end

  scenario 'I can see the number of posts' do
    expect(page).to have_content("Number of posts: #{@user.post_counter}")
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    click_on @user.name
    expect(current_path).to eq(user_path(@user))
  end
end
