class CreateSceneItemships < ActiveRecord::Migration[4.2]
  def change
    create_table :scene_itemships do |t|
      t.integer :user_id
      t.integer :scene_id
      t.integer :scene_item_id
    end
  end
end
