class AddImageToWorries < ActiveRecord::Migration[5.2]
  def change
    add_column :worries,:image,:string
  end
end
