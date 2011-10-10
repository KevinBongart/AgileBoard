class Board < ActiveRecord::Base
  belongs_to  :user
  has_many    :projects

  after_create :import_projects

private

  def import_projects
    PivotalTracker::Client.token = token
    PivotalTracker::Project.all.each do |project|
      existing_project = Project.find_by_pivotal_id(project.id)
      if existing_project
        existing_project.update_attributes(:board => self)
        existing_project.import_stories
      else
        Project.create(:name => project.name, :pivotal_id => project.id, :board => self)
      end
    end
  end
end
