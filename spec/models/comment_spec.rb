RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }

  # 有効な値を入力し有効であること
  describe "has a valid value" do
    # コメント文が140文字の時、有効であること
    context "when content is 140" do
      it "has a valid name" do
        comment.content = "a" * 140
        expect(comment).to be_valid
      end
    end
  end

  # 有効でない値を入力し有効でないこと
  describe "has a invalid value" do
    # コメント文が141文字の時、有効でないこと
    context "when content is 141" do
      it "has a valid name" do
        comment.content = "a" * 141
        expect(comment).to be_invalid
      end
    end

    # コメントが存在しない場合、有効でないこと
    context "when description is blank" do
      it "is invalid without content" do
        comment.content = nil
        comment.valid?
        expect(comment.errors[:content]).to include("を入力してください")
      end
    end
  end
end
