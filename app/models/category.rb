class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '屋内' },
    { id: 3, name: '屋外' }
  ]

  include ActiveHash::Associations
  has_many :courts

  end