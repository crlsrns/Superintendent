class RenameUserstampColumns < ActiveRecord::Migration
  def self.up
    rename_column :sites, :created_by, :creator_id
    rename_column :sites, :updated_by, :updater_id
    rename_column :tokens, :created_by, :creator_id
    rename_column :tokens, :updated_by, :updater_id
    rename_column :users, :created_by, :creator_id
    rename_column :users, :updated_by, :updater_id
  end

  def self.down
    rename_column :users, :updater_id, :updated_by
    rename_column :users, :creator_id, :created_by
    rename_column :tokens, :updater_id, :updated_by
    rename_column :tokens, :creator_id, :created_by
    rename_column :sites, :updater_id, :updated_by
    rename_column :sites, :creator_id, :created_by
  end
end
