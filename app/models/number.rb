class Number < ActiveHash::Base
  self.data = [
    { id: 1, name: 'リングの数' },
    { id: 2, name: '1つ' },
    { id: 3, name: '2つ' },
    { id: 4, name: '3つ' },
    { id: 5, name: '4つ' },
    { id: 6, name: '5つ以上' }
  ]

  include ActiveHash::Associations
  has_many :courts

  end