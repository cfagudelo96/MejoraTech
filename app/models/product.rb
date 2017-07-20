class Product < ApplicationRecord
  has_many :complaints

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
