class Employee < ApplicationRecord
  def to_s
    "#{name} (C.C. #{identification})"
  end
end
