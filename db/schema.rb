# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130419204804) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "evidence_batches", :force => true do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ip_address"
    t.text     "notes"
  end

  create_table "evidences", :force => true do |t|
    t.string   "url"
    t.string   "source"
    t.integer  "evidence_batch_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.datetime "captured_at"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "mime_type"
    t.datetime "uploaded_at"
  end

  add_index "evidences", ["evidence_batch_id"], :name => "index_evidences_on_evidence_batch_id"

end
