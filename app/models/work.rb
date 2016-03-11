class Work < ActiveRecord::Base
  belongs_to :displayingwork
  mount_uploader :picture, PictureUploader
  validates :picture, presence: true
  validates :name, presence: true
  validates :workname, presence: true
end
