require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'コメント機能' do
    context '投稿がうまくいくとき' do
      it "コメントが存在すれば登録できる" do
        expect(@comment).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it "コメントが空だと登録できない" do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textを入力してください")
      end
    end
  end
end
