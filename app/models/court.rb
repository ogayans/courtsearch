class Court < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :number
  belongs_to :prefecture

  validates :text, :image, :local, presence: true
  validates :category_id, :number_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
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