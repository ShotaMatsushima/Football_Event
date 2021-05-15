RSpec.describe 'Events', type: :system do
  let(:user) { create(:user) }
  let(:event) { create(:event, user: user) }

  # イベント作成のシステムテスト
  describe "new event page" do
    scenario "be able to create new event", js: true do
      sign_in user
      visit new_event_path
      add_event_value_field
      click_button '検索'
      click_button 'イベントを作成する'
      # イベント作成できたフラッシュメッセージが表示されていること
      expect(page).to have_content "イベントを作成しました"
    end
  end

  # イベント編集ページのシステムテスト
  describe "event edit page" do
    # イベントの編集ができること
    scenario "be able to edit event", js: true do
      sign_in user
      visit edit_event_path(event.id)
      add_event_value_field
      click_button 'イベントを編集する'

      # イベントの編集できたフラッシュメッセージが表示されていること
      expect(page).to have_content "イベントを編集しました"

      # 変更した内容が表示にされていること
      expect(page).to have_content 'プレミアリーグのイベントです'
      expect(page).to have_content 'Liverpoolの試合です'
      expect(page).to have_content 'Southampton'
      expect(page).to have_content 5
    end
  end
end
