class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, length: { maximum: 20, minimum: 6 }, presence: true

end
