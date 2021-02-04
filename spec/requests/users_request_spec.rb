RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe "#new Get new_user_registration_path" do
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

  describe "#edit GET edit_user_registration_path" do
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

  describe "#show GET user_path" do
    before do
      sign_in user
      get user_path(user.id)
    end

    # サクセスが返ってくること
    it "response success" do
      expect(response).to be_successful
    end

    # 200が返ってくること
    it "require response 200" do
      expect(response).to have_http_status(200)
    end

    # showテンプレートが返ってくること
    it "render new_template" do
      expect(response).to render_template :show
    end

    # インスタンス変数が同じであること
    it "assigns uaer" do
      expect(assigns(:user)).to eq user
    end

    # userのnameが存在すること
    it "include uaer name" do
      expect(response.body).to include user.name
    end

    # userのemailが存在すること
    it "include uaer email" do
      expect(response.body).to include user.email
    end

    # userのfavorite_teamが存在すること
    it "include uaer favorite_team" do
      expect(response.body).to include user.favorite_team
    end

    # userのaddressが存在すること
    it "include user address" do
      expect(response.body).to include user.address
    end
  end
end
