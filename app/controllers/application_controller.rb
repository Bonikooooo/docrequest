class ApplicationController < ActionController::Base
        
    def after_sign_in_path_for(_resource)
        if user_signed_in?
          pages_users_path
        else
            pages_admin_path
        end
    end
end

