RSpec.describe Event, type: :model do
  let(:event) { create(:event) }

  # 有効な値を入力し有効であること
  describe "has a valid value" do
    # イベント名が50文字の時、有効であること
    context "when event_name is 50" do
      it "has a valid event_name" do
        event.event_name = "a" * 50
        expect(event).to be_valid
      end
    end

    # 説明文が1000文字の時、有効であること
    context "when description is 1000" do
      it "has a valid description" do
        event.description = "a" * 1000
        expect(event).to be_valid
      end
    end
  end

  # 有効でない値を入力し有効でないこと
  describe "has a invalid value" do
    # 名前が51文字の時、有効でないこと
    context "when event_name is 51" do
      it "has a valid event_name" do
        event.event_name = "a" * 51
        expect(event).to be_invalid
      end
    end

    # 説明文が1001文字の時、有効でないこと
    context "when description is 1001" do
      it "has a valid description" do
        event.description = "a" * 1001
        expect(event).to be_invalid
      end
    end

    # イベント名が存在しない場合、有効でないこと
    context "when event_name is blank" do
      it "is invalid without event_name" do
        event.event_name = nil
        event.valid?
        expect(event.errors[:event_name]).to include("can't be blank")
      end
    end

    # 説明文が存在しない場合、有効でないこと
    context "when description is blank" do
      it "is invalid without description" do
        event.description = nil
        event.valid?
        expect(event.errors[:description]).to include("can't be blank")
      end
    end

    # イベントの住所が存在しない場合、有効でないこと
    context "when event_address is blank" do
      it "is invalid without event_address" do
        event.event_address = nil
        event.valid?
        expect(event.errors[:event_address]).to include("can't be blank")
      end
    end

    # イベント日時が存在しない場合、有効でないこと
    context "when event_at is blank" do
      it "is invalid without event_at" do
        event.event_at = nil
        event.valid?
        expect(event.errors[:event_at]).to include("can't be blank")
      end
    end

    # イベントチームが存在しない場合、有効でないこと
    context "when event_team is blank" do
      it "is invalid without event_team" do
        event.event_team = nil
        event.valid?
        expect(event.errors[:event_team]).to include("can't be blank")
      end
    end

    # イベント定員数が存在しない場合、有効でないこと
    context "when capacity is blank" do
      it "is invalid without capacity" do
        event.capacity = nil
        event.valid?
        expect(event.errors[:capacity]).to include("can't be blank")
      end
    end
  end
end
