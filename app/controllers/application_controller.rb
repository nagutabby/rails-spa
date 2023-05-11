class ApplicationController < ActionController::Base
  include Csrf
  include Flash

  inertia_share auth: -> {
    if user_signed_in?
      {
        user: current_user.email
      }
    end
  }

end
