class HomeController < ApplicationController
  before_action :authenticate_user! 
  def index
    @users = User.all
    @products = Product.all
    @categories = Category.all
    @product_categories = ProductCategory.all
    @cart = current_user.cart || current_user.create_cart

  end

  def show 
    Product.find(params[:id])
  end

  def create 

  end

  def update 

  end

  def destroy
    
  end
end
