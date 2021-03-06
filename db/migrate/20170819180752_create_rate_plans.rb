class CreateRatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :rate_plans do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :product, foreign_key: true
      t.string :recurrence
      t.decimal :price

      t.timestamps
    end
  end
end
