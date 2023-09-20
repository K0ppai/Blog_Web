class Like < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :post, class_name: "Post", foreign_key: "post_id"

  def update_post_like_counter
    post.likes_counter += 1
    post.save
  end
end