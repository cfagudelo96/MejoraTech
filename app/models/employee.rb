class Employee < ApplicationRecord
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable,
         :trackable, :validatable

  has_many :complaints

  def to_s
    "#{name} (C.C. #{identification})"
  end
end
