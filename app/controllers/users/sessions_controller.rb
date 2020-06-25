module Users
  class SessionsController < Devise::SessionsController
    def respond_to_on_destroy
      respond_to do |format|
        format.all  { head :no_content }
        format.html { redirect_to new_user_session_url }
        format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
      end
    end
  end
end
