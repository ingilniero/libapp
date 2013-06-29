class Book < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  belongs_to :reader

  mount_uploader :cover, CoverUploader

  def owned_by?(owner)
    owner && owner.id == reader.id
  end
end
