# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Stage.create(:name => "Sprint", :position => 1)
Stage.create(:name => "Development", :position => 2)
Stage.create(:name => "QA", :position => 3)
Stage.create(:name => "Done", :position => 4)

InviteCode.create(:code => "lol")
