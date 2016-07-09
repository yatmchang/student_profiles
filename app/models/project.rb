class Project < ActiveRecord::Base
  has_many :project_taggings, dependent: :destroy
  has_many :project_tags, through: :project_taggings
  validates :title, presence: true
  validates :description, presence: true
  validates :web_app_link, presence: true
  validates :github_link, presence: true
  mount_uploader :logo, AvatarUploader
end
