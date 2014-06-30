class BadgesController < ApplicationController
  def index
    @badges = Merit::Badge.all
  end

  def show
    @badge = Merit::Badge.find(params[:id].to_i)
  end
end
