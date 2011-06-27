class AddUserstampsToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :created_by, :integer
    add_column :sites, :updated_by, :integer
  end

  def self.down
    remove_column :sites, :updated_by
    remove_column :sites, :created_by
  end
end
