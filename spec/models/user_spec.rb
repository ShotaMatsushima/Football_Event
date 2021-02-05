require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  # 有効な値を入力し有効であること
  describe "has a valid value" do
    # 有効なファクトリであること
    it "has a valid factory" do
      expect(user).to be_valid
    end

    # 名前が49文字の時、有効であること
    context "when name is 50" do
      it "has a valid name" do
        user.name = "a" * 50
        expect(user).to be_valid
      end
    end

    # Eメールが255文字の時、有効であること
    context "when email is 255" do
      it "has a valid email" do
        user.email = "a" * 243 + "@example.com"
        expect(user).to be_valid
      end
    end

    # パスワードが6文字の時、有効であること
    context "when password is 6" do
      it "has a valid email" do
        user.password = "a" * 6
        expect(user).to be_valid
      end
    end
  end

  # 有効でない値を入力し有効でないこと
  describe "has a invalid value" do
    # 名前が51文字の時、有効でないこと
    context "when name is 51" do
      it "has a valid name" do
        user.name = "a" * 51
        expect(user).to be_invalid
      end
    end

    # Eメールが256文字の時、有効でないこと
    context "when email is 256" do
      it "has a valid email" do
        user.email = "a" * 244 + "@example.com"
        expect(user).to be_invalid
      end
    end

    # パスワードが5文字の時、有効でないこと
    context "when password is 5" do
      it "has a valid password" do
        user.password = "a" * 5
        expect(user).to be_invalid
      end
    end

    # 名前が存在しない場合、有効でないこと
    context "when name is blank" do
      it "is invalid without name" do
        user.name = nil
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end
    end

    # Eメールが存在しない場合、有効でないこと
    context "when email is blank" do
      it "is invalid without email" do
        user.email = nil
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
    end

    # お気に入りチームが存在しない場合、有効でないこと
    context "when favorite_team is blank" do
      it "is invalid without favorite_team" do
        user.favorite_team = nil
        user.valid?
        expect(user.errors[:favorite_team]).to include("can't be blank")
      end
    end

    # 住所が存在しない場合、有効でないこと
    context "when address is blank" do
      it "is invalid without address" do
        user.address = nil
        user.valid?
        expect(user.errors[:address]).to include("can't be blank")
      end
    end

    # パスワードが存在しない場合、有効でないこと
    context "when password is blank" do
      it "is invalid without password" do
        user.password = nil
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
    end

    # 重複したメールアドレスなら無効な状態であること
    context "when same email is already create" do
      it "is invalid with a duplicate email address" do
        FactoryBot.create(:user, email: "shota@example.com")
        user.email = "shota@example.com"
        user.valid?
        expect(user.errors[:email]).to include("has already been taken")
      end
    end

    # Eメールのフォーマットが正しくない場合、有効でないこと
    context "when same email is already create" do
      it "is invalid with wrong format email" do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                                foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
        end
        expect(user).to be_invalid
      end
    end
  end
end
