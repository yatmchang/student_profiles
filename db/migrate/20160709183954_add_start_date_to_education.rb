class AddStartDateToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :start_date, :date
  end
end
