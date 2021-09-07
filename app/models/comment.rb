class Comment < ApplicationRecord
  belongs_to :court
  belongs_to :user

  validates :text, presence: true,
end
