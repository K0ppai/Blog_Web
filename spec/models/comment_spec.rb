require "rails_helper"

RSpec.describe Comment, type: :model do
  before :each do
    @comment = Comment.new(text: "abc", post_id: 1)
  end

  context "When creating comments" do
    it "text shold not be blank" do
      @comment.text = ""
      expect(@comment).to_not be_valid
    end

    it "Id of the post should be an integer" do
      @comment.post_id = "asdf"
      expect(@comment).to_not be_valid
    end
  end
end
