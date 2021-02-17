RSpec.describe "Events", type: :request do
  let(:event) { create(:event) }
  let(:user) { create(:user) }

  describe "GET /index" do
    it "returns http success" do
      get "/events/index"
      expect(response).to have_http_status(:success)
    end
  end

  # newアクションのテスト
  describe "GET /new" do
    before do
      sign_in user
      get new_event_path
    end

    # 正しいレスポンスが返ってくること
    it "response success" do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

  describe "GET /show" do
      before do
        sign_in user
        get event_path(event.id)
      end

      it "returns http success" do
      # 正しいレスポンスが返ってくること
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template :show

      # インスタンス変数が同じであること
      expect(assigns(:event)).to eq event

      # 登録したユーザー情報が存在していること
      expect(response.body).to include event.event_name
      expect(response.body).to include event.description
      expect(response.body).to include event.event_address
      expect(response.body).to include event.event_at
      expect(response.body).to include event.event_team
      expect(response.body).to include event.capacity
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/events/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
