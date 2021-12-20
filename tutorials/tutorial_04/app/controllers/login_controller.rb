class LoginController < ApplicationController
  def handle_login
    username = "admin"
    password = "admin@123"
    @login = false
    if(params["username"] == username && params["password"] == password)
      session[:username] = params["username"]
      @login = true
    elsif(params["username"] == "" || params["password"] == "")
      @error = "Please fill all fields!"
    else(params["username"] != username || params["passwor"] != password )
      @error = "Username or passwrod incorrect!"
    end
  end

  def handle_logout
    session[:username] = nil
    @login = false
    render :index
  end
end
