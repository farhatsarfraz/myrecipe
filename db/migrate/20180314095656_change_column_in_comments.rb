class ChangeColumnInComments < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :recipes_id, :recipe_id
    change_column :comments, :recipe_id, :integer
  end
end
