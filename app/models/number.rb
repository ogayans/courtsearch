class Number < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1つ' },
    { id: 3, name: '2つ' },
    { id: 1, name: '3つ' },
    { id: 2, name: '4つ' },
    { id: 3, name: '5つ以上' }
  ]

  include ActiveHash::Associations
  has_many :courts

  end