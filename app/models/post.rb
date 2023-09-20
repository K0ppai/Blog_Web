class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :comments
  has_many :likes

  def update_user_post_counter
    author.post_counter += 1
    author.save
  end
end