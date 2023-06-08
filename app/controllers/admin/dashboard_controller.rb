class Admin::DashboardController < ApplicationController
  
  include HttpAuthConcern
  
  def show
    @product = Product.count
    @category = Category.count
  end
end
