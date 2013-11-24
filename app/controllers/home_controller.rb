class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def clock
  end

  def seed
    if admin_signed_in?
      puts 'Admin verified!'

      SeedWorker.perform_async(params)
      render nothing: true, status: :ok #200
    else
      render nothing: true, status: :forbidden #403
    end
  end
end
