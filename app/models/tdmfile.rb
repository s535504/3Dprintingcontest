class Tdmfile < ActiveRecord::Base
  belongs_to :register
  validates :register_id, presence: true
  validates :igsfile, presence: true
end
