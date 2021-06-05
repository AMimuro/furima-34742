class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

      with_options presence: true do
        validates :nickname
        validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
        validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
        validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "first_name_kana Full-width katakana characters"}
        validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Family_name_kana kana Full-width katakana characters"}
        validates :birthday
      end

        validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,100}+\z/i, message: '半角英数字混合でなければ登録できない' }
       
 end
