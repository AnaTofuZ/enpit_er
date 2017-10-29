module ProfilesHelper
	def profile_define(user)
		!user.profile.nil?
	end
end
