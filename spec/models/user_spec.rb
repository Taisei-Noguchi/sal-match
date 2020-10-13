require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、first_name、second_name、first_kana、second_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに＠が含まれないと登録できない" do
        @user.email = "aaaicloud.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください","パスワードは6文字以上で入力してください","パスワードは不正な値です","パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが５文字以下であれば登録できない" do
        @user.password = "test0"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "00000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameを入力してください", "First nameは不正な値です")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）で入力されていなければ登録できない" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameは不正な値です")
      end
      it "second_nameが空だと登録できない" do
        @user.second_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Second nameを入力してください", "Second nameは不正な値です")
      end
      it "second_nameが全角（漢字・ひらがな・カタカナ）で入力されていなければ登録できない" do
        @user.second_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Second nameは不正な値です")
      end
      it "first_kanaが空だと登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kanaを入力してください", "First kanaは不正な値です")
      end
      it "first_kanaが全角（カタカナ）で入力されていなければ登録できない" do
        @user.first_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kanaは不正な値です")
      end
      it "second_kanaが空だと登録できない" do
        @user.second_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Second kanaを入力してください", "Second kanaは不正な値です")
      end
      it "second_kanaが全角（カタカナ）で入力されていなければ登録できない" do
        @user.second_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Second kanaは不正な値です")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdayを入力してください")
      end
    end
  end
end