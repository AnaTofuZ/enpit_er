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

    def age(birthday)
      date_format = "%Y%m%d"
      (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i)/10000
    end

    def show_none_profile(prof)
      if prof.blank?
         return '----  '
      end
      prof
    end
end
