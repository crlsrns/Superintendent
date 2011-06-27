class AddUserstampsToTokens < ActiveRecord::Migration
  def self.up
    add_column :tokens, :created_by, :integer
    add_column :tokens, :updated_by, :integer
  end

  def self.down
    remove_column :tokens, :updated_by
    remove_column :tokens, :created_by
  end
end
