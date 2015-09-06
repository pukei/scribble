class CreateScribbles < ActiveRecord::Migration
  def change
    create_table :scribbles do |t|
      t.string :title
      t.text :content
      t.boolean :on

      t.timestamps null: false
    end
  end
end
