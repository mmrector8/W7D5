# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :moderator_id, presence: true

    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User,
        inverse_of: :subs

    has_many :post_subs,
        dependent: :destroy
        
    has_many :posts,
        through: :post_subs,
        source: :post

end
