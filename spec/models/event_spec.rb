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

    # 定員数が2人の時、有効であること
    context "when capacity is 2" do
      it "has a valid description" do
        event.capacity = 2
        expect(event).to be_valid
      end
    end

    # アップロードファイルが許可された形式の時、有効であること
    context "when image is allowed formats" do
      it "has a valid upload file" do
        event.image = fixture_file_upload('spec/fixtures/loading.gif')
        expect(event).to be_valid
      end
    end
  end

  # 有効でない値を入力し有効でないこと
  describe "has a invalid value" do
    # 名前が51文字の時、有効でないこと
    context "when event_name is 51" do
      it "has a invalid event_name" do
        event.event_name = "a" * 51
        expect(event).to be_invalid
      end
    end

    # 説明文が1001文字の時、有効でないこと
    context "when description is 1001" do
      it "has a invalid description" do
        event.description = "a" * 1001
        expect(event).to be_invalid
      end
    end

    # 定員数が1人の時、有効でないこと
    context "when capacity is 1" do
      it "has a invalid description" do
        event.capacity = 1
        expect(event).to be_invalid
      end
    end

    # アップロードファイルが許可していない時、有効でないこと
    context "when upload file is not allowed" do
      it "has a invalid upload file" do
        event.image = fixture_file_upload('spec/fixtures/erd.pdf')
        expect(event).to be_invalid
      end
    end

    # ユーザーidが存在しない場合、有効でないこと
    context "when user_id is blank" do
      it "is invalid without user_id" do
        event.user_id = nil
        event.valid?
        expect(event.errors[:user_id]).to include("を入力してください")
      end
    end

    # イベント名が存在しない場合、有効でないこと
    context "when event_name is blank" do
      it "is invalid without event_name" do
        event.event_name = nil
        event.valid?
        expect(event.errors[:event_name]).to include("を入力してください")
      end
    end

    # 説明文が存在しない場合、有効でないこと
    context "when description is blank" do
      it "is invalid without description" do
        event.description = nil
        event.valid?
        expect(event.errors[:description]).to include("を入力してください")
      end
    end

    # イベントのタイトルが存在しない場合、有効でないこと
    context "when title is blank" do
      it "is invalid without title" do
        event.title = nil
        event.valid?
        expect(event.errors[:title]).to include("を入力してください")
      end
    end

    # イベント開始日時が存在しない場合、有効でないこと
    context "when event_start_at is blank" do
      it "is invalid without event_at" do
        event.event_start_at = nil
        event.valid?
        expect(event.errors[:event_start_at]).to include("を入力してください")
      end
    end

    # イベント終了日時が存在しない場合、有効でないこと
    context "when event_end_at is blank" do
      it "is invalid without event_end_at" do
        event.event_end_at = nil
        event.valid?
        expect(event.errors[:event_end_at]).to include("を入力してください")
      end
    end

    # イベントチームが存在しない場合、有効でないこと
    context "when event_team is blank" do
      it "is invalid without event_team" do
        event.event_team = nil
        event.valid?
        expect(event.errors[:event_team]).to include("を入力してください")
      end
    end

    # イベント定員数が存在しない場合、有効でないこと
    context "when capacity is blank" do
      it "is invalid without capacity" do
        event.capacity = nil
        event.valid?
        expect(event.errors[:capacity]).to include("を入力してください")
      end
    end

    # イベント定員数が存在しない場合、有効でないこと
    context "when image is blank" do
      it "is invalid without image" do
        event.image = nil
        event.valid?
        expect(event.errors[:image]).to include("を入力してください")
      end
    end
  end
end
