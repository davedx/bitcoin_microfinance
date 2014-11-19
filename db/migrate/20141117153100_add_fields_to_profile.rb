class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :mobile, :string
    add_column :users, :facebook_url, :string
    add_column :users, :about, :text
  end
end