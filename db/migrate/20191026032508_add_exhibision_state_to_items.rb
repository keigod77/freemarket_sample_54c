class AddExhibisionStateToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items,:exhibision_state, :integer,null:false
  end
end
