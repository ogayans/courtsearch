class AddUserIdToCourts < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :user_id, :integer
  end
end
