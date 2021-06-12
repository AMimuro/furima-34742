require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '商品出品機能' do
  context '商品出品できるとき' do

    it '商品画像、商品名、商品の説明、カテゴリー情報、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格についての情報があれば出品できる' do
      
    end

    it '販売価格が¥300~¥9,999,999の間なら出品できる' do
      
    end

  end

  context '商品出品できないとき'
  
    it '商品画像がないと出品できない' do
      
    end

    it '商品の説明がないと出品できない' do
      
    end

    it 'カテゴリーの情報がないと出品できない' do
      
    end

    it '商品の状態についての情報がないと出品できない' do
      
    end

    it '配送料の負担についての情報がないと出品できない' do
      
    end

    it '配送元の地域についての情報がないと出品できない' do
      
    end

    it '発送までの日数についての情報がないと出品できない' do
      
    end

    it '販売価格についての情報がないと出品できない' do
      
    end

    it '販売価格は半角英数字でないと出品できない' do
      
    end
end
