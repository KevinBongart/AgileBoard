class Stage < ActiveRecord::Base
  has_many :stories

  default_scope order("postition ASC")
end
