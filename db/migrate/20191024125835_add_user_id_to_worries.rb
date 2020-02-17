class AddUserIdToWorries < ActiveRecord::Migration[5.2]
  def change
    add_column :worries,:user_id,:integer
  end
end
