class AddSlugToScribbles < ActiveRecord::Migration
  def change
    add_column :scribbles, :slug, :string
    add_index :scribbles, :slug
  end
end
