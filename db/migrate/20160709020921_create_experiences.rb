class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :job_title
      t.string :company
      t.date :start_date
      t.date :end_date
      t.boolean :current, default: false
      t.text :description

      t.timestamps null: false
    end
  end
end
