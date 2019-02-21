class WelcomeController < ApplicationController

  def index
    @teamName = "French Toast"
  end
  
  def services
  end

  def about_us
  	@greeting = "The Z Center"
  end
end
