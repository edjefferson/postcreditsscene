class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :search
      t.string :title
      t.string :main_char
      t.string :main_cast

      t.timestamps
    end
  end
end
