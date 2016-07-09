class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :href
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
