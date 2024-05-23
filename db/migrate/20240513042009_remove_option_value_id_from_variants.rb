class RemoveOptionValueIdFromVariants < ActiveRecord::Migration[7.1]
  def change
    remove_column :variants, :option_value_id, :integer
  end
end
