class ChangePrefecturesToAdresses < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :prefectures, :integer, null: false, default: 1
  end
  
  def down
    change_column :addresses, :prefectures, :string, nill: false
  end
end
