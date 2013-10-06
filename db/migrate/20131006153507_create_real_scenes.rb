class CreateRealScenes < ActiveRecord::Migration
  def change
    create_table :real_scenes do |t|
      t.string :imdb_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
