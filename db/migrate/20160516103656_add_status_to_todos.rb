class AddStatusToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :status, :integer, default:0
    # add_column :users, :admin, :boolean, default: false
  end
end
