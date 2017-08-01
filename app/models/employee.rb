class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable,
         :trackable, :validatable, :registerable

  def to_s
    "#{name} (C.C. #{identification})"
  end
end
