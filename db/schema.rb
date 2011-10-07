# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111007191349) do

  create_table "boards", :force => true do |t|
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labels_stories", :id => false, :force => true do |t|
    t.integer "label_id"
    t.integer "story_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "pivotal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "board_id"
  end

  create_table "stages", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_id"
    t.integer  "stage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pivotal_id"
  end

end
