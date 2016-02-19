class Register < ActiveRecord::Base
  has_many :transactions, dependent: :destroy
  has_many :tdmfiles, dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :generate_no
  validates :name,  presence: { message: "請填寫姓名" }, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def generate_no
    loop do
      self.merchant_trade_no = "TDPC#{self.created_at.strftime("%Y%m%d")}#{SecureRandom.hex(3).upcase}"
      break unless Register.where(merchant_trade_no: self.merchant_trade_no).first
    end
  end

  def params
    transaction = transactions.find_by("params -> 'RtnCode' = '1' OR params -> 'TradeStatus' = '1'")
    if transaction.present?
      return transaction.params
    end
  end
end
