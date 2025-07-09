module UsersHelper
    def gravatar_for(user, size: 80)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end

    def avatar(user)
        full_name = user.name
        avatar_url = "https://avatar.iran.liara.run/username?username=#{full_name}"
        image_tag(avatar_url, alt: user.name, class: "garavatar", width: 150, height: 150)
    end
end
