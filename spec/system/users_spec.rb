RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  # 新規登録のシステムテスト
  describe "new user page" do
    scenario "be able to create new user" do
      visit new_user_registration_path
      add_value_field
      click_button 'Sign up'
      # 新規登録できたフラッシュメッセージが表示されていること
      expect(page).to have_content "Welcome! You have signed up successfully."
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
      fill_in 'Current password', with: 'password'
      click_button 'Update'

      # プロフィール編集できたフラッシュメッセージが表示されていること
      expect(page).to have_content "Your account has been updated successfully."

      visit edit_user_registration_path

      # 変更した内容がフィールドにあること
      expect(page).to have_field 'Name', with: 'shotamatsushima'
      expect(page).to have_field 'Email', with: 'shotatest@gmail.com'
      expect(page).to have_field 'Favorite team', with: 'Southampton'
      expect(page).to have_field 'Address', with: '三重県'
    end
  end
end
