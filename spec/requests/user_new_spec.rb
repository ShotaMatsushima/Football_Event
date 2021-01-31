RSpec.describe "#new", type: :request do
  describe "GET new_user_registration_path" do
    before do
      get new_user_registration_path
    end

    # サクセスが返ってくること
    it "response success" do
      expect(response).to be_successful
    end
    # 200が返ってくること
    it "require response 200" do
      expect(response).to have_http_status(200)
    end

    # newテンプレートが返ってくること
    it "render new_template" do
      expect(response).to render_template :new
    end
  end
end
