require 'rails_helper'

RSpec.describe PurchaseReceiver, type: :model do
  before do
    item = FactoryBot.build(:item)
    item.image = fixture_file_upload('public/images/test_image.png')
    item.save
    user = FactoryBot.create(:user)
    @purchase_receiver = FactoryBot.build(:purchase_receiver, item_id: item.id, user_id: user.id)
    sleep 0.1
  end

  
  context '内容に問題ない場合' do
    it "tokenがあれば保存ができること" do
      expect(@purchase_receiver).to be_valid
    end

    it "建物名が空でも保存ができること" do
      expect(@purchase_receiver).to be_valid
    end

  end

  context '内容に問題がある場合' do
    it "postal_codeが空では保存ができないこと" do
      @purchase_receiver.postal_code = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Postal code can't be blank")
    end

    it "ship_from_idが「0」では登録できないこと" do
      @purchase_receiver.ship_from_id = 0
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Ship from can't be blank")
    end

    it "cityが空では保存ができないこと" do
      @purchase_receiver.city = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("City can't be blank")
    end

    it "addressが空では保存ができないこと" do
      @purchase_receiver.address = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Address can't be blank")
    end

    it "phone_numberが空では保存ができないこと" do
      @purchase_receiver.phone_number = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Phone number can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @purchase_receiver.token = nil
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Token can't be blank")
    end

    it "postal_codeにハイフンがないと保存ができないこと" do
      @purchase_receiver.postal_code = "1234567"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "phone_numberが数値でないと保存ができないこと" do
      @purchase_receiver.phone_number = "aaaa"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Phone number is invalid.")
    end

    it 'phone_numberが11桁以内でないと保存できないこと' do
      @purchase_receiver.phone_number = "090123456789"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include('Phone number is invalid.')
    end

    it 'phone_numberが英数字混合では保存できないこと' do
      @purchase_receiver.phone_number = '300dollars'
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include('Phone number is invalid.')
    end

    it "cityが空では保存ができないこと" do
      @purchase_receiver.city = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("City can't be blank")
    end

    it "user_idが空では購入ができないこと" do
      @purchase_receiver.user_id = nil
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空では購入ができないこと" do
      @purchase_receiver.item_id = nil
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Item can't be blank")
    end

  end
end