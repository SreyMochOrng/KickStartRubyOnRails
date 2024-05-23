class RenameOptionToValueInOptionValues < ActiveRecord::Migration[7.1]
  def change
    rename_column :option_values, :option, :value
  end
end
