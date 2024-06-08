class Review < ApplicationRecord
  belongs_to :bookmark
  belongs_to :list

  validates :content, presence: true, length: { minimum: 6 }
end
