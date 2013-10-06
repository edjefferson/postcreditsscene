class CreatePostCreditsScenes < ActiveRecord::Migration
  def change
    create_table :post_credits_scenes do |t|
      t.string :text

      t.timestamps
    end
  end
end
