class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :under_sale
      t.integer :price
      t.integer :sale_price
      t.string :sale_text

      t.timestamps
    end
  end
end
