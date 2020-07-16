class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.integer :trader_id
      t.integer :tradee_id
      t.integer :requested_card_id
      t.string :status, :default => 'pending'
      t.timestamps
    end
  end
end
