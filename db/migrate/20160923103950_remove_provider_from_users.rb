class RemoveProviderFromUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :provider
  end

  def down
    add_column :users, :provider
  end
end
