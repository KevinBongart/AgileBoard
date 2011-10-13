class Story < ActiveRecord::Base
  belongs_to :stage
  belongs_to :project
  has_and_belongs_to_many :labels
  has_many :tasks

  default_scope order("updated_at DESC")

  def self.import_from_pivotal_tracker_story(pivotal_tracker_story, project, stage)
    return if pivotal_tracker_story.story_type == 'release'

    labels = []
    unless pivotal_tracker_story.labels.blank?
      pivotal_tracker_story.labels.split(',').each do |l|
        existing_label = Label.find_by_name(l)
        if existing_label
          labels << existing_label
        else
          labels << Label.create(:name => l)
        end
      end
    end

    existing_story = Story.where(:pivotal_id => pivotal_tracker_story.id, :project_id => project).first

    if existing_story
      existing_story.update_attributes(
        :name => pivotal_tracker_story.name,
        :description => pivotal_tracker_story.description,
        :project => project,
        :labels => labels,
        :stage => stage,
        :accepted_at => pivotal_tracker_story.accepted_at,
        :points => pivotal_tracker_story.estimate
      )
    else
      existing_story = Story.create(
        :name => pivotal_tracker_story.name,
        :description => pivotal_tracker_story.description,
        :project => project,
        :labels => labels,
        :stage => stage,
        :pivotal_id => pivotal_tracker_story.id,
        :accepted_at => pivotal_tracker_story.accepted_at,
        :points => pivotal_tracker_story.estimate
      )
    end

    existing_story.import_tasks(pivotal_tracker_story)
  end

  def import_tasks(pivotal_tracker_story)
    pivotal_tracker_story.tasks.all.each do |task|
      Task.create(
        :story_id    => self.id,
        :description => task.description,
        :position    => task.position,
        :complete    => task.complete
      )
    end
  end
end
class Story < ActiveRecord::Base
  belongs_to :stage
  belongs_to :project
  has_and_belongs_to_many :labels
  has_many :tasks

  default_scope order("updated_at DESC")

  def self.import_from_pivotal_tracker_story(pivotal_tracker_story, project, stage)
    return if pivotal_tracker_story.story_type == 'release'

    labels = []
    unless pivotal_tracker_story.labels.blank?
      pivotal_tracker_story.labels.split(',').each do |l|
        existing_label = Label.find_by_name(l)
        if existing_label
          labels << existing_label
        else
          labels << Label.create(:name => l)
        end
      end
    end

    existing_story = Story.where(:pivotal_id => pivotal_tracker_story.id, :project_id => project).first

    if existing_story
      existing_story.update_attributes(
        :name => pivotal_tracker_story.name,
        :description => pivotal_tracker_story.description,
        :project => project,
        :labels => labels,
        :stage => stage,
        :accepted_at => pivotal_tracker_story.accepted_at,
        :points => pivotal_tracker_story.estimate
      )
    else
      existing_story = Story.create(
        :name => pivotal_tracker_story.name,
        :description => pivotal_tracker_story.description,
        :project => project,
        :labels => labels,
        :stage => stage,
        :pivotal_id => pivotal_tracker_story.id,
        :accepted_at => pivotal_tracker_story.accepted_at,
        :points => pivotal_tracker_story.estimate
      )
    end

    existing_story.import_tasks(pivotal_tracker_story)
  end

  def import_tasks(pivotal_tracker_story)
    pivotal_tracker_story.tasks.all.each do |task|
      Task.create(
        :story_id    => self.id,
        :description => task.description,
        :position    => task.position,
        :complete    => task.complete
      )
    end
  end
end
class Story < ActiveRecord::Base
  belongs_to :stage
  belongs_to :project
  has_and_belongs_to_many :labels
  has_many :tasks

  default_scope order("updated_at DESC")

  def self.import_from_pivotal_tracker_story(pivotal_tracker_story, project, stage)
    return if pivotal_tracker_story.story_type == 'release'

    labels = []
    unless pivotal_tracker_story.labels.blank?
      pivotal_tracker_story.labels.split(',').each do |l|
        existing_label = Label.find_by_name(l)
        if existing_label
          labels << existing_label
        else
          labels << Label.create(:name => l)
        end
      end
    end

    existing_story = Story.where(:pivotal_id => pivotal_tracker_story.id, :project_id => project).first

    if existing_story
      existing_story.update_attributes(
        :name => pivotal_tracker_story.name,
        :description => pivotal_tracker_story.description,
        :project => project,
        :labels => labels,
        :stage => stage,
        :accepted_at => pivotal_tracker_story.accepted_at,
        :points => pivotal_tracker_story.estimate,
        :owned_by => pivotal_tracker_story.owned_by
      )
    else
      existing_story = Story.create(
        :name => pivotal_tracker_story.name,
        :description => pivotal_tracker_story.description,
        :project => project,
        :labels => labels,
        :stage => stage,
        :pivotal_id => pivotal_tracker_story.id,
        :accepted_at => pivotal_tracker_story.accepted_at,
        :points => pivotal_tracker_story.estimate,
        :owned_by => pivotal_tracker_story.owned_by
      )
    end

    existing_story.import_tasks(pivotal_tracker_story)
  end

  def import_tasks(pivotal_tracker_story)
    pivotal_tracker_story.tasks.all.each do |task|
      Task.create(
        :story_id    => self.id,
        :description => task.description,
        :position    => task.position,
        :complete    => task.complete
      )
    end
  end
end
