class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :buyer_id, true
  end
end
