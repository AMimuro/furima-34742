class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one :card, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email,    uniqueness: { case_sensitive: false }

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー－]+\z/ } do
      validates :first_name
      validates :family_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana
      validates :family_name_kana
    end
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: '半角英数字混合でなければ登録できない' }
end
