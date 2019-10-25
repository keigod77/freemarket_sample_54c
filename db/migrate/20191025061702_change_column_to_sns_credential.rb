class ChangeColumnToSnsCredential < ActiveRecord::Migration[5.2]
  def up
    change_column :sns_credentials, :provider, :string, null: false
    change_column :sns_credentials, :uid, :string, null: false
  end

  def down
    change_column :sns_credentials, :provider, :string, null: true
    change_column :sns_credentials, :uid, :string, null: true
  end
end
