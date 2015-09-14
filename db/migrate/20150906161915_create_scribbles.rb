class CreateScribbles < ActiveRecord::Migration
  def change
    create_table :scribbles do |t|
      t.string :title
      t.text :content
      t.boolean :on
      t.boolean :no_more_comments, default: false

      t.timestamps null: false
    end
  end
end
