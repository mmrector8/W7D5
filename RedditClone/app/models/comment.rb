class Comment < ApplicationRecord
  validates :body, :author_id, :post_id, presence: true

  belongs_to :author,
  foreign_key: :author_id,
  class_name: :User,
  inverse_of: :comments

  belongs_to :post,
  inverse_of: :comments

  belongs_to :parent_comment,
  foreign_key: :parent_comment_id,
  class_name: :Comment,
  optional: true

  has_many :child_comments,
  foreign_key: :parent_comment_id,
  class_name: :Comment,
  dependent: :destroy
end
