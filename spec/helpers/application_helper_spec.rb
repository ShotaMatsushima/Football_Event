RSpec.describe ApplicationHelper, type: :helper do
  let(:user) { create(:user) }

  # full_titleの引数がnilの時
  context "when page_title is nil" do
    it "full_title is BASE_TITLE" do
      expect(full_title(nil)).to eq BASE_TITLE
    end
  end

  # full_titleの引数が""の時
  context "when page_title is empty" do
    it "full_title is BASE_TITLE" do
      expect(full_title("")).to eq BASE_TITLE
    end
  end

  # full_titleの引数がuser.nameの時
  context "when page_title has something" do
    it "full_title is page_title | BASE_TITLE" do
      expect(full_title("#{user.name}")).to eq "#{user.name} - #{BASE_TITLE}"
    end
  end
end
