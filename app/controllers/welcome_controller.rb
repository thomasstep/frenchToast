class WelcomeController < ApplicationController

  def index
    @teamName = "French Toast"
  end

  def about_us
  	@greeting = "Introducing French Toast"
  end
end
