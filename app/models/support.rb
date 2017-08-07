class Support < ApplicationRecord
  belongs_to :complaint

  mount_uploader :support_file, SupportFileUploader

  validates :description, presence: true
  validates :support_file, presence: true

  def to_s
    support_file.file.filename
  end
end
