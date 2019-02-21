class WelcomeController < ApplicationController

  def index
    @teamName = "French Toast"
  end

  def about_us
  	@greeting = "The Z Center"
  end
end
