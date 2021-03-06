RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  # 新規登録のシステムテスト
  describe "new user page" do
    scenario "be able to create new user" do
      visit new_user_registration_path
      add_value_field
      click_button 'Sign up'
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
      add_value_field
      fill_in 'user[current_password]', with: 'password'
      click_button 'Update'

      # プロフィール編集できたフラッシュメッセージが表示されていること
      expect(page).to have_content "アカウント情報を変更しました。"

      visit edit_user_registration_path

      # 変更した内容がフィールドにあること
      expect(page).to have_field 'Name', with: 'shotamatsushima'
      expect(page).to have_field 'user[email]', with: 'shotatest@gmail.com'
      expect(page).to have_field 'user[favorite_team]', with: 'Southampton'
      expect(page).to have_field 'user[user_address]', with: '三重県'
    end
  end
end
