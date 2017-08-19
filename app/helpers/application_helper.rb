module ApplicationHelper
    def is_active_controller(controller_name, class_name = nil)
        if params[:controller] == controller_name
         class_name == nil ? "active" : class_name
        else
           nil
        end
    end
    def get_user
      user = User.find(session[:user_id])
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end

    def gravatar_for(user)
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: user.username, class:"img-circle circle-border m-b-md")
    end
end
