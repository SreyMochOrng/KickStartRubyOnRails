class CreateVariants < ActiveRecord::Migration[7.1]
  def change
    create_table :variants do |t|
      t.references :product, null: false, foreign_key: true
      t.float :price
      t.string :image
      t.integer :quantity

      t.timestamps
    end
  end
end
