class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commentator
      t.string :email
      t.text :comment
      t.boolean :on
      t.references :scribble, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
