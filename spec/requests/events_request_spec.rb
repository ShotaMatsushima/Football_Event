RSpec.describe "Events", type: :request do
  let(:user) { create(:user) }
  let(:event) { create(:event, user: user) }
  let(:event_params) { attributes_for(:event_params) }

  describe "GET /index" do
    it "returns http success" do
      sign_in user
      get root_path

      # 正しいレスポンスが返ってくること
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

  # newアクションのテスト
  describe "GET /new" do
    it "response success" do
      sign_in user
      get new_event_path

      # 正しいレスポンスが返ってくること
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

  describe "POST /create" do
    it "response success" do
      sign_in user

      # イベントのオブジェジェクトが1つ増えること
      expect { post events_path, params: { event: event_params } }.to change(Event, :count).by(1)

      # 正しいレスポンスが返ってくること
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      sign_in user
      get event_path(event.id)

      # 正しいレスポンスが返ってくること
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template :show

      # インスタンス変数が同じであること
      expect(assigns(:event)).to eq event

      # 登録したユーザー情報が存在していること
      expect(response.body).to include event.event_name
      expect(response.body).to include event.description
      expect(response.body).to include event.event_start_at.to_s
      expect(response.body).to include event.event_end_at.to_s
      expect(response.body).to include event.event_team
      expect(response.body).to include event.capacity.to_s
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      sign_in user
      get edit_event_path(event.id)

      # 正しいレスポンスが返ってくること
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end

  describe "PATCH /update" do
    it "returns http success" do
      sign_in user
      patch event_path(user.id)

      # 正しいレスポンスが返ってくること
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      sign_in user
      get event_path(event.id)

      # イベントが削除できること
      expect { delete event_path(event.id) }.to change(Event, :count).by(-1)

      # 正しいレスポンスが返ってくること
      expect(response).to have_http_status(302)
    end
  end
end
