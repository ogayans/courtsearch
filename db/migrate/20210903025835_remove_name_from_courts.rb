class RemoveNameFromCourts < ActiveRecord::Migration[6.0]
  def change
    remove_column :courts, :name, :string
  end
end
