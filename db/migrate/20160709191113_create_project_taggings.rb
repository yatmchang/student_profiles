class CreateProjectTaggings < ActiveRecord::Migration
  def change
    create_table :project_taggings do |t|
      t.references :project, index: true, foreign_key: true
      t.references :project_tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
