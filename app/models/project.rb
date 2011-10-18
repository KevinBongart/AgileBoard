class Project < ActiveRecord::Base
  belongs_to :board
  has_many :stories

  after_create :import_stories

  def import_stories
    p "importing stories for project #{self.id}"

    self.stories.each do |story|
      story.tasks.each do |task|
        task.destroy
      end
      story.destroy
    end

    PivotalTracker::Client.token = board.token
    project = PivotalTracker::Project.find(pivotal_id)

    if project
      p "Project found on Pivotal Tracker!"

      ids = PivotalTracker::Iteration.current(project).stories.map(&:id)

      stage = Stage.find_by_name('Sprint')
      PivotalTracker::Story.all(project, :id => ids, :current_state => ['unstarted', 'rejected']).each do |story|
        Story.import_from_pivotal_tracker_story(story, self, stage)
      end

      stage = Stage.find_by_name('Development')
      PivotalTracker::Story.all(project, :id => ids, :current_state => ['started', 'finished']).each do |story|
        Story.import_from_pivotal_tracker_story(story, self, stage)
      end

      stage = Stage.find_by_name('QA')
      PivotalTracker::Story.all(project, :id => ids, :current_state => 'delivered').each do |story|
        Story.import_from_pivotal_tracker_story(story, self, stage)
      end

      stage = Stage.find_by_name('Done')
      PivotalTracker::Story.all(project, :id => ids, :current_state => 'accepted').each do |story|
        Story.import_from_pivotal_tracker_story(story, self, stage)
      end
    else
      p "PROJECT NOT FOUND!"
    end
  end
end
