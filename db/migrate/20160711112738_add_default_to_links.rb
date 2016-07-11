class AddDefaultToLinks < ActiveRecord::Migration
  def change
    add_column :links, :Github, :string
    add_column :links, :Twitter, :string
    add_column :links, :LinkedIn, :string
  end
end
