class SettingsController < ApplicationController
    def index
        @optionValues = OptionValue.all
        @optionTypes = OptionType.all
        @variants = Variant.all
    end 

    def show
        
    end

    def update
    end




end
