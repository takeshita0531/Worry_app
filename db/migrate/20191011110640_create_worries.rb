class CreateWorries < ActiveRecord::Migration[5.2]
  def change
    create_table :worries do |t|
      t.text :content
    
      t.timestamps
    end
  end
end
