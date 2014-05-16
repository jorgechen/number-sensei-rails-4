class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end


  def show
    @user = User.find(params[:id])

    unless @user.blank?
      @experience = @user.experience
      @experience_to_level = @user.level_cap
      @experience_progress = @experience * 100 / @experience_to_level
    end

    if @user
      @challenge_attempts = @user.challenge_attempts.order('created_at DESC').where('created_at >= ?', 1.week.ago).first(5)
    end
  end

end
