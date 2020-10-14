require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @tweet = FactoryBot.build(:tweet)
  end

  describe '投稿機能' do
    context '投稿がうまくいくとき' do
      it "image,title,place,address,price,item,category_id,field_id,level_id,month_id,day_id,hour_idが存在すれば登録できる" do
        expect(@tweet).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it "画像が空だと登録できない" do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("画像を入力してください")
      end
      it "タイトルが空だと登録できない" do
        @tweet.title = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Titleを入力してください", "Titleは不正な値です")
      end
      it "タイトルが全角（漢字・ひらがな・カタカナ）で入力されていなければ登録できない" do
        @tweet.title = "1"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Titleは不正な値です")
      end
      it "会場が空だと登録できない" do
        @tweet.place = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Placeを入力してください", "Placeは不正な値です")
      end
      it "会場が全角（漢字・ひらがな・カタカナ）で入力されていなければ登録できない" do
        @tweet.place = "1"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Placeは不正な値です")
      end
      it "住所が空だと登録できない" do
        @tweet.address = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Addressを入力してください", "Addressは不正な値です")
      end
      it "住所が全角（漢字・ひらがな・カタカナ）で入力されていなければ登録できない" do
        @tweet.address = "1"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Addressは不正な値です")
      end
      it "参加費が空だと登録できない" do
        @tweet.price = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Priceを入力してください", "Priceは不正な値です")
      end
      it "参加費が半角数字で入力されていなければ登録できない" do
        @tweet.price = "１"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Priceは不正な値です")
      end
      it "持ち物が空だと登録できない" do
        @tweet.item = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Itemを入力してください", "Itemは不正な値です")
      end
      it "持ち物が全角（漢字・ひらがな・カタカナ）で入力されていなければ登録できない" do
        @tweet.item = "1"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Itemは不正な値です")
      end
      it "カテゴリーを選択しないと登録できない" do
        @tweet.category_id = "1"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end
      it "フィールドを選択しないと登録できない" do
        @tweet.field_id = "1"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Fieldは1以外の値にしてください")
      end
      it "レベルを選択しないと登録できない" do
        @tweet.level_id = "1"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Levelは1以外の値にしてください")
      end
      it "月を選択しないと登録できない" do
        @tweet.month_id = "1"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Monthは1以外の値にしてください")
      end
      it "日を選択しないと登録できない" do
        @tweet.day_id = "1"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Dayは1以外の値にしてください")
      end
      it "時間を選択しないと登録できない" do
        @tweet.hour_id = "1"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Hourは1以外の値にしてください")
      end
    end
  end







end
