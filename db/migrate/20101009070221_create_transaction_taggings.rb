class CreateTransactionTaggings < ActiveRecord::Migration
  def self.up
    create_table :transaction_taggings do |t|
      t.integer :transaction_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_taggings
  end
end
