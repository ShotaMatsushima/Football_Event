RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:event) { create(:event, user: user) }

  describe "GET /create" do
    it "returns http success" do
      sign_in user
      get event_path(event.id)
      # コメントのオブジェジェクトが1つ増えること
      expect { post event_comments_path(event.id), params: { comment: { content: "テストです" } } }.to change(Comment, :count).by(1)

      # 正しいレスポンスが返ってくること
      expect(response).to have_http_status(302)
    end
  end
end
