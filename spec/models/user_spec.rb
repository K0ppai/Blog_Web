require "rails_helper"

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: "Tom", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.")
  end

  context "When creating a new User" do
    it "Name must not be blank" do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "PostsCounter must be an integer greater than or equal to zero" do
      @user.post_counter = -1
      expect(@user).to_not be_valid
    end
  end

  context "#recent_posts" do
    it "should return an array of length 3" do
      4.times { Post.create(author: @user, title: "Hello", text: "This is my first post") }
      result = @user.recent_posts
      expect(result.length).to be 3
    end
  end
end
