require 'rails_helper'

RSpec.describe PurchaseReceiver, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @purchase_receiver = FactoryBot.build(:purchase_receiver, item_id: item.id, user_id: user.id)
    sleep 0.1
  end

  
  context '内容に問題ない場合' do
    it "tokenがあれば保存ができること" do
      expect(@purchase_receiver).to be_valid
    end

    it "建物名が空でも保存ができること" do
      @purchase_receiver.building_name = ""
      expect(@purchase_receiver).to be_valid
    end

  end

  context '内容に問題がある場合' do
    it "postal_codeが空では保存ができないこと" do
      @purchase_receiver.postal_code = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("郵便番号を入力してください")
    end

    it "ship_from_idが「0」では登録できないこと" do
      @purchase_receiver.ship_from_id = 0
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("発送元の地域を入力してください")
    end

    it "cityが空では保存ができないこと" do
      @purchase_receiver.city = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("市区町村を入力してください")
    end

    it "addressが空では保存ができないこと" do
      @purchase_receiver.address = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("番地を入力してください")
    end

    it "phone_numberが空では保存ができないこと" do
      @purchase_receiver.phone_number = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("電話番号を入力してください")
    end

    it "tokenが空では登録できないこと" do
      @purchase_receiver.token = nil
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("クレジットカード情報を入力してください")
    end

    it "postal_codeにハイフンがないと保存ができないこと" do
      @purchase_receiver.postal_code = "1234567"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("郵便番号は無効です。ハイフンを入れてください。")
    end

    it "phone_numberが数値でないと保存ができないこと" do
      @purchase_receiver.phone_number = "aaaa"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("電話番号は無効です。")
    end

    it 'phone_numberが11桁以内でないと保存できないこと' do
      @purchase_receiver.phone_number = "090123456789"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include('電話番号は無効です。')
    end

    it 'phone_numberが英数字混合では保存できないこと' do
      @purchase_receiver.phone_number = '300dollars'
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include('電話番号は無効です。')
    end

    it "user_idが空では購入ができないこと" do
      @purchase_receiver.user_id = nil
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Userを入力してください")
    end

    it "item_idが空では購入ができないこと" do
      @purchase_receiver.item_id = nil
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Itemを入力してください")
    end

  end
end
