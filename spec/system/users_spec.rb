RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  # 新規登録のシステムテスト
  describe "new user page" do
    it "be able to create new user" do
      visit new_user_registration_path
      add_value_field

      # ユーザーのオブジェクトが1つ増えること
      expect { click_button 'Sign up' }.to change(User, :count).by(1)

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

    # 登録したユーザーの内容が編集ページのフィールドにあること
    it "have edit content" do
      expect(page).to have_field 'Name', with: user.name
      expect(page).to have_field 'Email', with: user.email
      expect(page).to have_field 'Favorite team', with: user.favorite_team
      expect(page).to have_field 'Address', with: user.address
    end

    # ユーザーのプロフィール編集ができること
    it "be able to edit user" do
      add_value_field
      fill_in 'Current password', with: 'password'

      # プロフィール編集してもユーザーのオブジェクトが増えないこと
      expect { click_button 'Update' }.to change(User, :count).by(0)

      # プロフィール編集できたフラッシュメッセージが表示されていること
      expect(page).to have_content "Your account has been updated successfully."

      # 変更した内容がフィールドにあること
      visit edit_user_registration_path
      expect(page).to have_field 'Name', with: 'shotamatsushima'
      expect(page).to have_field 'Email', with: 'shotatest@gmail.com'
      expect(page).to have_field 'Favorite team', with: 'Southampton'
      expect(page).to have_field 'Address', with: '三重県'
    end
  end

  # ユーザーページのシステムテスト
  describe "user my page" do
    before do
      sign_in user
      visit user_path(user.id)
    end

    # ユーザーの情報が表示されていること
    it "have user page content" do
      expect(page).to have_content user.name
      expect(page).to have_content user.email
      expect(page).to have_content user.favorite_team
      expect(page).to have_content user.address
    end
  end
end
