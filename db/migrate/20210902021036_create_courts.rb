class CreateCourts < ActiveRecord::Migration[6.0]
  def change
    create_table :courts do |t|
      t.string :name
      t.string :text,           null: false
      t.text :image,            null: false
      t.timestamps
    end
  end
end
