class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({"email" => params["email"]})

    # 2. if the user exists -> check if they know their password
    if @user != nil #or if @user.present instead of 'is not nil'
      # 3. if they know their password -> login is successful
      if BCrypt::Password.new(@user["password"]) == params["password"] #this checks the password

        # --- Begin user session. 
        cookies["name"] = "Cookie Monster"
        cookies["saying"] = "i like cookies"
        session["user_id"] = @user["id"] #securing user ID encrypted in the cookie jar. Creates an encrypted cookie! Won't be seen in the jar.
        #Now the cookie takes the "name" and holds it over different pages, and can access. Can set expiration times, or when browser closes.
        
        flash["notice"] = "Welcome."
        redirect_to "/companies" 
      # 4. if the user doesn't exist or they don't know their password -> login fails
      else
        flash["notice"] = "Wrong password."
        redirect_to "/login"
      end
    else
      flash["notice"] = "User does not exist."
      redirect_to "/login"
    end
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
