class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    # ユーザーの新規登録とプロフィール更新時のストロングパラメーター
    def configure_permitted_parameters
      added_attrs = [:name, :email, :favorite_team, :user_address, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
