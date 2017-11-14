module StaticPagesHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

	 def find_line?
		 !current_user.notifytoken.nil?
	 end

	 def defined_profile?
		 !current_user.profile.nil?
	 end
end
