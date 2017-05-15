class ChangeRegisteredUrlFormat < ActiveRecord::Migration
  def change
    rename_column :registered_apps, :URL, :url
  end
end
