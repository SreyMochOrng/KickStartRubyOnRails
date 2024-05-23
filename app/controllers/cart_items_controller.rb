class CartItemsController < ApplicationController
  before_action :set_cart
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    product = Product.find(params[:product_id])
    @cart_item = @cart.cart_items.find_or_initialize_by(product: product)
    @cart_item.quantity ||= 0  # Ensure quantity is not nil
    @cart_item.quantity += 1
    if @cart_item.save
      redirect_to cart_path(@cart), notice: 'Product added to cart.'
    else
      redirect_to cart_path(@cart), alert: 'Unable to add product to cart.'
    end
  end

  def update
    if params[:quantity].to_i > 0
      @cart_item.update(quantity: params[:quantity])
      redirect_to cart_path(@cart), notice: 'Cart updated successfully.'
    else
      destroy
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path(@cart), notice: 'Product removed from cart.'
  end

  private

  def set_cart
    @cart = Cart.find(params[:cart_id])
  end

  def set_cart_item
    @cart_item = @cart.cart_items.find(params[:id])
  end
end
