module ApplicationHelper
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
