class UserContent < ApplicationRecord
  belongs_to :content
  belongs_to :user

  scope :by_id, ->(query) { where(user_id: query[:user_id], content_id: query[:content_id]) }

  validates :user_id, uniqueness: { scope: :content_id }
end
