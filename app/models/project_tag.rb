class ProjectTag < ActiveRecord::Base
  has_many :project_taggings, dependent: :destroy
  has_many :projects, through: :project_tagging
  validates :title, uniqueness: true, presence: true

end
