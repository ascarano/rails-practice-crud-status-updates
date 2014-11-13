class ChangeTable < ActiveRecord::Migration
  def change
    change_column :updates, :status, :text
  end
end
