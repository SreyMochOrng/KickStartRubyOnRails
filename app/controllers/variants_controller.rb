class VariantsController < ApplicationController
    def index
        @variants = Variant.all
    end
    
    def new
        @variant = Variant.new
        @option_values = OptionValue.all
        @option_types = OptionType.all
    end
    
    def show
        @variant = Variant.find(params[:id])
    end
    
    def create
        @variant = Variant.new(variant_params)
        if @variant.save
        redirect_to variants_path
        else
        render :new
        end
    end
    
    def edit
        @variant = Variant.find(params[:id])
    end
    
    def update
        @variant = Variant.find(params[:id])
    
        if @variant.update(variant_params)
        redirect_to variants_path
        else
        render 'edit', status: :unprocessable_entity
        end
    end
    
    def destroy
        @variant = Variant.find(params[:id])
        @variant.destroy
    
        redirect_to variants_path
    end
    
    private
    def variant_params
        params.require(:variant).permit(:name, :price, :product_id)
    end
end
