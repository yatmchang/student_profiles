class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school
      t.text :description
      t.string :logo
      t.string :link

      t.timestamps null: false
    end
  end
end
