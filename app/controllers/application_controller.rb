class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
                                        keys: [:nickname, :last_name, :last_name_kana, :first_name, :first_name_kana,
                                               :date_of_birth])
    end
  end
end
