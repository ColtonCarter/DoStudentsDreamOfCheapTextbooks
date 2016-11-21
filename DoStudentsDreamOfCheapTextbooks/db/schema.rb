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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161118013336) do

  create_table "searches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "search"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table1", primary_key: ["idtable1", "table1_copy3_idtable1"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idtable1",                         null: false
    t.string  "table1col",             limit: 45, null: false
    t.string  "table1col1",            limit: 45, null: false
    t.integer "table1_copy3_idtable1",            null: false
    t.index ["table1_copy3_idtable1"], name: "fk_table1_table1_copy3_idx", using: :btree
  end

  create_table "table1_copy1", primary_key: ["idtable1", "table1_idtable1", "table1_table1_copy3_idtable1", "table1_copy2_idtable1"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idtable1",                                null: false
    t.string  "table1col",                    limit: 45, null: false
    t.string  "table1col1",                   limit: 45, null: false
    t.integer "table1_idtable1",                         null: false
    t.integer "table1_table1_copy3_idtable1",            null: false
    t.integer "table1_copy2_idtable1",                   null: false
    t.index ["table1_copy2_idtable1"], name: "fk_table1_copy1_table1_copy21_idx", using: :btree
    t.index ["table1_idtable1", "table1_table1_copy3_idtable1"], name: "fk_table1_copy1_table11_idx", using: :btree
  end

  create_table "table1_copy2", primary_key: "idtable1", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "table1col",  limit: 45, null: false
    t.string "table1col1", limit: 45, null: false
  end

  create_table "table1_copy3", primary_key: "idtable1", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "table1col",  limit: 45, null: false
    t.string "table1col1", limit: 45, null: false
  end

  add_foreign_key "table1", "table1_copy3", column: "table1_copy3_idtable1", primary_key: "idtable1", name: "fk_table1_table1_copy3"
  add_foreign_key "table1_copy1", "table1", column: "table1_idtable1", primary_key: "idtable1", name: "fk_table1_copy1_table11"
  add_foreign_key "table1_copy1", "table1", column: "table1_table1_copy3_idtable1", primary_key: "table1_copy3_idtable1", name: "fk_table1_copy1_table11"
  add_foreign_key "table1_copy1", "table1_copy2", column: "table1_copy2_idtable1", primary_key: "idtable1", name: "fk_table1_copy1_table1_copy21"
end
