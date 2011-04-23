class ApplicationController < ActionController::Base
  protect_from_forgery
  include TooltipHelper

  def after_sign_in_path_for(resource)
    p 'after_sign_in_path'
    p resource
    if resource.email == AppConfig.admin
       admin_dashboard_path
    else
      super
    end
  end
end
