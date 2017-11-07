# coding: utf-8
module ProfilesHelper
	def profile_define
		!current_user.profile.nil?
	end

	def show_place(place_id)
			case place_id.to_i
			when 1 then
				"琉大工学部"
			when 2 then
				"北口ローソン"
			when 3 then
				"キリ学"
			else
				puts "Error"
			end
	end
        def show_gender(sex)
            if sex == "male" then
                "男性"
            elsif sex == "female" then
                "女性"
            else
                "その他"
            end 
        end
end
