class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :category
      t.string :img_url
      t.string :first_name
      t.string :last_name
      t.string :team
      t.string :condition
      t.integer :year
      t.integer :user_id
      t.integer :trade_id
      t.timestamps
    end
  end
end
