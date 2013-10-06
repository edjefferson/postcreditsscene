class CreatePostCreditsScenes < ActiveRecord::Migration
  def change
    create_table :post_credits_scenes do |t|
      t.text :text, :limit => nil

      t.timestamps
    end
  end
end
