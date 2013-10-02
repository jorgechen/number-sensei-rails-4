class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def clock
  end
end
