class Micropost < ApplicationRecord
  validates :content, length: { maximum: 20, minimum: 6 }
end
