require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post')
  end

  context 'When creating a new Post' do
    it 'Title must not be blank' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'Title must not exceed 250 characters' do
      @post.title = 'a' * 251
      expect(@post).to_not be_valid
    end

    it 'CommentsCounter must be an integer greater than or equal to zero' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end

    it 'CommentsCounter must be an integer' do
      @post.comments_counter = 'abc'
      expect(@post).to_not be_valid
    end

    it 'LikesCounter must be an integer' do
      @post.likes_counter = 'abc'
      expect(@post).to_not be_valid
    end

    it 'LikesCounter must be an integer greater than or equal to zero' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end
  end

  context '#recent_comments' do
    it 'should return an array of length 5' do
      5.times { Comment.create(post: @post, author: @user, text: 'Hi Tom!') }
      result = @post.recent_comments
      expect(result.length).to be 5
    end
  end
end
