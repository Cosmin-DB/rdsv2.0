class ApplicationController < ActionController::Base
 	
	before_action :authenticate_user!
  before_action :notifications
  protect_from_forgery with: :exception
  layout :layout_by_resource
  
  def notifications()
    if !devise_controller?
    @notifications=Notification.where(receiver_id: current_user.id)
    end
  end
  
	private
  def after_sign_in_path_for(resource)
    publications_path  
  end
		def layout_by_resource
		  if devise_controller?
		    "devise"
		  else
		    "application"
		  end
		end

		def reload
    redirect_back(fallback_location: root_path)
  end
end
