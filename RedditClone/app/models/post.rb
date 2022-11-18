# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :bigint           not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  validates :title, :sub_id, :author_id, presence: true

  belongs_to :sub,
    inverse_of: :posts

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User,
    inverse_of: :posts

end
