class AddSecondCharAndSecondCastToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :second_char, :string
    add_column :movies, :second_cast, :string
  end
end
