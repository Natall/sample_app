class AddBooleanValue < ActiveRecord::Migration
  def change
    add_column :todos, :mark, :boolean, default: false
  end
end
