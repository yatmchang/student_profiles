class ProjectTagging < ActiveRecord::Base
  belongs_to :project
  belongs_to :project_tag
end
