class Board < ActiveRecord::Base
  belongs_to  :user
  has_many    :projects

  after_create  :import_projects

  def import_projects
    unless token.nil?
      PivotalTracker::Client.token = token
      p "Importing projects..."
      PivotalTracker::Project.all.each do |project|
        p "  Importing project #{project.id}"
        existing_project = Project.where(:pivotal_id => project.id, :board_id => user.board).first
        if existing_project
          p "    existing project found"
          existing_project.update_attributes(:board_id => self)
          existing_project.import_stories
        else
          p "    no project found"
          new_project = Project.create(:name => project.name, :pivotal_id => project.id, :board_id => self)
          p "    new project created: #{new_project.id} #{new_project.name}"
        end
      end
    end
  end

  def get_token
    PivotalTracker::Client.token = nil

    begin
      token = PivotalTracker::Client.token(user.email, user.password)
    rescue
    end

    self.update_attributes(:token => token) if token
  end
end
