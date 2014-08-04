class AddUserIdToTodoitemTable < ActiveRecord::Migration
  def up
   add_column :to_do_items, :user_id, :integer
  end

  def down
    remove_column :to_do_items, :user_id
  end
end
