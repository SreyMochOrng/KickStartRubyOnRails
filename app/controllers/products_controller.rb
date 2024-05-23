class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @categorieName = ProductCategory.find_by(product_id: @product.id).category.name
    @variants = Variant.where(product_id: @product.id)
    @variantOptionValues = VariantOptionValue.where(variant_id: @variants.ids)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      update_product_categories_for_new_product
      redirect_to products_path
    else
      @categories = Category.all
      render :new
    end
  end


  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
  
    if @product.update(product_params)
      update_product_categories
      redirect_to products_path
    else  
      @categories = Category.all
      render 'edit', status: :unprocessable_entity
    end
  end
  
  

  def destroy
    @product = Product.find(params[:id])
    @product.categories.clear

    @product.destroy

    redirect_to products_path
  end
  
  private
  def product_params
   params.require(:product).permit(:name, :price, :image, :description)
  end

  def update_product_categories
    @product.categories.clear  # Remove existing associations
    params[:product][:category_ids].each do |category_id|
      category = Category.find_by(id: category_id)
      @product.categories << category if category
    end
  end


  def update_product_categories_for_new_product
    if params[:product][:category_ids].present?  # Ensure correct parameter name
      params[:product][:category_ids].each do |category_id|
        category = Category.find_by(id: category_id)
        @product.categories << category if category
      end
    end
  end
  

end
