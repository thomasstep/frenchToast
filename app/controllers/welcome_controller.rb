class WelcomeController < ApplicationController

  def index
    @teamName = "French Toast"
  end

  def services
  end

  def about_us
  	@greeting = "The Z Center"
  end

  def schedule
    @user_first_name = ""
    @user_last_name = ""
    @user_email = ""
    @user_phone = ""
    if user_signed_in?
      @user_first_name = current_user.first_name
      @user_last_name = current_user.last_name
      @user_email = current_user.email
      @user_phone = current_user.phone
    end
  end
end
