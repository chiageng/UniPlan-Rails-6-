class AddDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :job, :string
    add_column :users, :fullname, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :website, :string
    add_column :users, :github, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
    add_column :users, :facebook, :string
  end
end
