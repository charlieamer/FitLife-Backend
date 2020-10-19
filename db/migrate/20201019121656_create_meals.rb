class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.belongs_to :user, foreign_key: true
      t.string :food
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fats

      t.timestamps
    end
  end
end
