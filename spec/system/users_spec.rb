RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  # 新規登録のシステムテスト
  describe "new user page" do
    scenario "be able to create new user" do
      visit new_user_registration_path
      add_value_field
      click_button '新規登録する'
      # 新規登録できたフラッシュメッセージが表示されていること
      expect(page).to have_content "アカウント登録が完了しました。"
    end
  end

  # ユーザー編集ページのシステムテスト
  describe "user edit page" do
    before do
      sign_in user
      visit edit_user_registration_path
    end

    # ユーザーのプロフィール編集ができること
    scenario "be able to edit user" do
      fill_in 'user[name]', with: 'shotamatsushima'
      fill_in 'user[email]', with: 'shotatest@gmail.com'
      select 'Southampton', from: 'user[favorite_team]'
      select '三重県', from: 'user[user_address]'
      click_button '情報を更新する'

      # プロフィール編集できたフラッシュメッセージが表示されていること
      expect(page).to have_content "アカウント情報を変更しました。"

      visit edit_user_registration_path

      # 変更した内容がフィールドにあること
      expect(page).to have_field 'user[name]', with: 'shotamatsushima'
      expect(page).to have_field 'user[email]', with: 'shotatest@gmail.com'
      expect(page).to have_field 'user[favorite_team]', with: 'Southampton'
      expect(page).to have_field 'user[user_address]', with: '三重県'
    end
  end
end
