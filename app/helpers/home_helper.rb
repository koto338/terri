module HomeHelper

    def user_iamge(user)
        if user.image.blank? 
          "https://placehold.jp/e4e4ed/e4e4ed/200x200.png"
        else 
          user.image
        end
    end
end
