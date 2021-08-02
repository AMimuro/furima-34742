require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '商品画像、商品名、商品の説明、カテゴリー情報、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格についての情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '商品画像がないと出品できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品の名前がないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明がないと出品できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーの情報がないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it '商品の状態についての情報がないと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it '配送料の負担についての情報がないと出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it '配送元の地域についての情報がないと出品できない' do
        @item.ship_from_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it '発送までの日数についての情報がないと出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end

      it '販売価格についての情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
      end

      it '販売価格は全角数字では出品できない' do
        @item.price = '４００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

      it '販売価格は半角英数字混合では登録できない' do
        @item.price = '300dollars'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

      it '販売価格は半角英語だけでは登録できない' do
        @item.price = 'threemillion'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は一覧にありません')
      end

      it '販売価格は300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は一覧にありません')
      end

      it 'priceが9,999,999円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は一覧にありません')
      end

      it 'category_idが「0」では登録できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it 'status_idが「0」では登録できないこと' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it 'delivery_charge_idが「0」では登録できないこと' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it 'ship_from_idが「0」では登録できないこと' do
        @item.ship_from_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it 'shipping_day_idが「0」では登録できないこと' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end

      it 'userが紐づいていない場合は登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
