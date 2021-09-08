class Court < ApplicationRecord
  validates :text, :image, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    if search != ""
      Court.where('text LIKE(?)', "%#{search}%")
    else
      Court.all
    end
  end
end