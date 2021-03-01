RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  # devise_user showアクションのテスト
  describe "#new Get new_user_registration_path" do
    # 正しいレスポンスが返ってくること
    it "response success" do
      get new_user_registration_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
      expect { user }.to change(User, :count).by(1)
    end
  end

  # devise_user editアクションのテスト
  describe "#edit GET edit_user_registration_path" do
    # 正しいレスポンスが返ってくること
    it "response success" do
      sign_in user
      get edit_user_registration_path(user.id)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end

  # user showアクションのテスト
  describe "#show GET user_path" do
    # 正しいレスポンスが返ってくること
    it "response success" do
      sign_in user
      get user_path(user.id)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template :show

      # インスタンス変数が同じであること
      expect(assigns(:user)).to eq user

      # 登録したユーザー情報が存在していること
      expect(response.body).to include user.name
      expect(response.body).to include user.email
      expect(response.body).to include user.favorite_team
      expect(response.body).to include user.address
    end
  end
end
