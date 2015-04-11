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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150411145036) do

  create_table "dossiers", force: true do |t|
    t.string   "raison_sociale"
    t.string   "rcs_ville"
    t.string   "siren"
    t.string   "nic"
    t.string   "forme_juridique"
    t.boolean  "societe_mono_etablissement"
    t.string   "code_naf"
    t.integer  "regime_fiscal_id"
    t.integer  "adresse_id"
    t.date     "date_creation"
    t.decimal  "capital"
    t.integer  "nombre_action"
    t.string   "activite_principale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dossiers_users", id: false, force: true do |t|
    t.integer "dossier_id"
    t.integer "user_id"
  end

  create_table "ecritures", force: true do |t|
    t.string   "journal"
    t.date     "date_ecriture"
    t.string   "compte"
    t.string   "libelle"
    t.decimal  "debit"
    t.decimal  "credit"
    t.string   "numero_facture"
    t.string   "mode_reglement"
    t.string   "lettrage"
    t.date     "echeance"
    t.integer  "numero_mouvement"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dossier_id"
  end

  create_table "exercices", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dossier_id"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "nom"
    t.string   "prenom"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
