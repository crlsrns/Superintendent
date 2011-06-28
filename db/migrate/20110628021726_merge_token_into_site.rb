class MergeTokenIntoSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :api_token, :string
    drop_table :tokens
  end

  def self.down
    create_table :tokens do |t|
      t.string :value
      t.references :site
      t.userstamps
      t.timestamps
    end
    remove_column :sites, :api_token
  end
end
