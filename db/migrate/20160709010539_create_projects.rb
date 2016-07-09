class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :logo
      t.string :web_app_link
      t.string :github_link

      t.timestamps null: false
    end
  end
end
