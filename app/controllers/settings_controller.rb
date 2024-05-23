class SettingsController < ApplicationController
    def index
      @optionValues = OptionValue.all
      @optionTypes = OptionType.all
      @variants = Variant.all
      @variantOptionValues = VariantOptionValue.all
    end 
  
    def new 
      @optionValue = OptionValue.new
      @optionTypes = OptionType.all
    end 
  
    def create 
      @optionValue = OptionValue.new(option_type_id: option_type.id, value: params[:option_value])
  
      if @optionValue.save
        redirect_to settings_path, notice: 'Option value created successfully.'
      else 
        @optionTypes = OptionType.all
        flash[:alert] = 'Failed to create option value.'
        render :new, status: :unprocessable_entity
      end
    end 
  
    def show
    end
  
    def update
    end
  
    private
  
    def option_value_params
      params.require(:option_value).permit(:option_type_id, :option)
    end
  end
  