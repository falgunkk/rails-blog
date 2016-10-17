class RemoveUidFromUsers < ActiveRecord::Migration[5.0]
   def up
    remove_column :users, :uid,:string
  end

  def down
    add_column :users, :uid, :string
  end
end
