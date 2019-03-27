class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :isbn
      t.text :summaries
      t.string :author
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
