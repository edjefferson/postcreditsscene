class RemoveSecondCharAndSecondCastFromMovie < ActiveRecord::Migration
  def change
    remove_column :movies, :second_char, :string
    remove_column :movies, :second_cast, :string
  end
end
