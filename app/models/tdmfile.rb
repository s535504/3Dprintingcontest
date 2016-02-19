class Tdmfile < ActiveRecord::Base
  belongs_to :register
  mount_uploader :igsfile, IgsUploader
  mount_uploader :picture1, PictureUploader
  mount_uploader :picture2, PictureUploader
  mount_uploader :picture3, PictureUploader
  validates :register_id, presence: true
  validates :igsfile, presence: true
  validate :file_size

  private

    def file_size
      if igsfile.size > 5.megabytes
        errors.add(:igsfile)
      end
      if picture1.size > 0.8.megabytes
        errors.add(:picture1)
      end
      if picture2.size > 0.8.megabytes
        errors.add(:picture2)
      end
      if picture3.size > 0.8.megabytes
        errors.add(:picture3)
      end
    end
end
