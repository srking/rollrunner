class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
      @user_orders = Order.where(:owner => current_user)
      @domain_orders = Order.where(:domain => current_user.domain).where.not(:owner => current_user)
  end

end
