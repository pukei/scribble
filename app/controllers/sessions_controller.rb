class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def share_screen
    @api_key = 45546502
    api_secret = '35a519d48c57296252f8f94e2bb207fde06152cb'
    opentok = OpenTok::OpenTok.new @api_key, api_secret
    if params[:session_id]
      @session_id = params[:session_id]
    else
      s = opentok.create_session
      @session_id = s.session_id
    end
    @token = opentok.generate_token @session_id
  end
end
