class AddCompleteToItems < ActiveRecord::Migration
  def change
    add_column :items, :complete, :boolean, default: false
    remove_column :items, :status, :integer
  end
end
