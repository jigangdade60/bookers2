class ApplicationController < ActionController::Base
  include Authentication


  helper_method :current_user

  allow_browser versions: :modern


   def authenticated?
    current_user.present?
   end
   

  private

  def current_user
    Current.session&.user
  end

   def after_logout_url
    root_path
  end

end