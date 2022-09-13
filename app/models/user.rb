class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items       
with_options presence: true do
  validates :nickname
  with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龥々])+\z/}  do
  validates :first_name    
  validates :last_name    
  end
  validates :birth, format: { with: /\A\d{4}-\d{2}-\d{2}\z/}
  with_options format: {with: /\A[ァ-ヶー－]+\z/}  do           
  validates :first_name_kana
  validates :last_name_kana
 end
end
PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 


end
