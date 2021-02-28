RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  let(:event) { create(:event, user: user) }

  # 新規登録のシステムテスト
  describe "new event page" do
    scenario "be able to create new event" do
      sign_in user
      visit new_event_path
      add_event_value_field
      click_button 'Create my account'

      # イベント作成できたフラッシュメッセージが表示されていること
      expect(page).to have_content "イベントを作成しました"
    end
  end

  # ユーザー編集ページのシステムテスト
  describe "event edit page" do
    before do
      sign_in user
      visit edit_event_path(event.id)
    end

    # ユーザーのプロフィール編集ができること
    scenario "be able to edit event" do
      sign_in user
      visit edit_event_path(event.id)
      add_event_value_field
      click_button 'update'

      # プロフィール編集できたフラッシュメッセージが表示されていること
      expect(page).to have_content "イベントを編集しました"

      # 変更した内容が表示にされていること
      expect(page).to have_content 'プレミアリーグのイベントです'
      expect(page).to have_content 'Liverpoolの試合です'
      expect(page).to have_content '三重県'
      expect(page).to have_content 'Southampton'
      expect(page).to have_content 5
    end
  end
end
