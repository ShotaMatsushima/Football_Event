RSpec.describe "#edit", type: :request do
  describe "GET edit_user_registration_path" do
    let(:user) { create(:user) }

    before do
      sign_in user
      get edit_user_registration_path(user.id)
    end

    # サクセスが返ってくること
    it "response success" do
      expect(response).to be_successful
    end

    # 200が返ってくること
    it "require response 200" do
      expect(response).to have_http_status(200)
    end

    # editテンプレートが返ってくること
    it "render new_template" do
      expect(response).to render_template :edit
    end
  end
end
