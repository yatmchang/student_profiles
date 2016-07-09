class AddBasicInfoToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :avatar, :string
    add_column :profiles, :short_pitch, :text
    add_column :profiles, :long_pitch, :text
    add_column :profiles, :available, :boolean, default: false
    add_column :profiles, :resume, :string
  end
end
