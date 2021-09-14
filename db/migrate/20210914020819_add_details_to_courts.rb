class AddDetailsToCourts < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :category_id, :integer
    add_column :courts, :prefecture_id, :integer
    add_column :courts, :local, :string
    add_column :courts, :address, :string
    add_column :courts, :number_id, :integer
  end
end
