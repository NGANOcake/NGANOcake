class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admins_orders_path
    else
      publics_my_page_path
    end
  end

  def after_sign_out_path_for(resource)
   if resource == :admin
     about_path
   elsif resource == :user
     root_path
   else
     root_path
   end
  end

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephon_number])
  end
end
