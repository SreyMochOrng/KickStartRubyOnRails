class HomeController < ApplicationController
  def index
    @users = User.all
    @products = Product.all
    @categories = Category.all

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
