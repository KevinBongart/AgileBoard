class Project < ActiveRecord::Base
  belongs_to :board
  has_many :stories

  after_create :import_stories

  def import_stories
    self.stories.each { |story| story.destroy }
    project = PivotalTracker::Project.find(pivotal_id)

    stage = Stage.find_by_name('Sprint')
    project.stories.all(:current_state => 'rejected').each do |story|
      Story.import_from_pivotal_tracker_story(story, self, stage)
    end

    stage = Stage.find_by_name('Development')
    project.stories.all(:current_state => ['started', 'finished']).each do |story|
      Story.import_from_pivotal_tracker_story(story, self, stage)
    end

    stage = Stage.find_by_name('QA')
    project.stories.all(:current_state => 'delivered').each do |story|
      Story.import_from_pivotal_tracker_story(story, self, stage)
    end

    stage = Stage.find_by_name('Done')
    project.stories.all(:current_state => 'accepted').each do |story|
      Story.import_from_pivotal_tracker_story(story, self, stage)
    end
  end
end
