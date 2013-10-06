class RemoveSecondCharAndSecondCastFromPostCreditsScenes < ActiveRecord::Migration
  def change
    remove_column :post_credits_scenes, :second_char, :string
    remove_column :post_credits_scenes, :second_cast, :string
  end
end
