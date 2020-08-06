class WelcomeController < ApplicationController
  def show
    @user_name = params[:user_name]
  end
end
