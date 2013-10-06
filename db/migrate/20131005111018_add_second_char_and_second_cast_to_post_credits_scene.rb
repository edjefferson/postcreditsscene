class AddSecondCharAndSecondCastToPostCreditsScene < ActiveRecord::Migration
  def change
    add_column :post_credits_scenes, :second_char, :string
    add_column :post_credits_scenes, :second_cast, :string
  end
end
