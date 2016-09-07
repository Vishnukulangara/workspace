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

ActiveRecord::Schema.define(version: 20160824050443) do

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "account_type_id",            limit: 4,                   null: false
    t.string   "account_name",               limit: 255
    t.string   "contact_first_name",         limit: 255
    t.string   "contact_last_name",          limit: 255
    t.string   "contact_job_title",          limit: 255
    t.string   "contact_email",              limit: 255
    t.string   "account_number",             limit: 255
    t.string   "contact_phone",              limit: 255
    t.integer  "ar_number",                  limit: 4
    t.string   "web_page",                   limit: 255
    t.string   "billing_information",        limit: 255
    t.integer  "accounts_receivable_number", limit: 4
    t.integer  "hotel_chain_id",             limit: 4
    t.boolean  "is_commission_on",                       default: false
    t.string   "commission_value",           limit: 255, default: "0.0", null: false
    t.string   "commission_type",            limit: 255
    t.boolean  "is_prepaid_commission_on",               default: false
    t.integer  "commission_post_type_id",    limit: 4
    t.string   "tax_number",                 limit: 255
  end

  create_table "action_details", force: :cascade do |t|
    t.integer "action_id", limit: 4,   null: false
    t.string  "key",       limit: 255, null: false
    t.string  "old_value", limit: 255
    t.string  "new_value", limit: 255
  end

  add_index "action_details", ["action_id", "key"], name: "index_action_details_on_action_id_and_key", unique: true, using: :btree

  create_table "action_tasks", force: :cascade do |t|
    t.integer  "associated_id",       limit: 4,   null: false
    t.string   "associated_type",     limit: 255, null: false
    t.integer  "action_task_type_id", limit: 4
    t.string   "description",         limit: 255
    t.integer  "department_id",       limit: 4
    t.integer  "creator_id",          limit: 4
    t.integer  "hotel_id",            limit: 4,   null: false
    t.datetime "due_at"
    t.datetime "completed_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "completer_id",        limit: 4
    t.datetime "task_created_at"
    t.string   "external_id",         limit: 255
  end

  add_index "action_tasks", ["associated_id", "associated_type"], name: "index_action_tasks_on_associated_id_and_associated_type", using: :btree
  add_index "action_tasks", ["hotel_id"], name: "index_action_tasks_on_hotel_id", using: :btree

  create_table "actions", force: :cascade do |t|
    t.integer  "creator_id",      limit: 4
    t.integer  "hotel_id",        limit: 4,   null: false
    t.integer  "action_type_id",  limit: 4,   null: false
    t.integer  "application_id",  limit: 4,   null: false
    t.integer  "actionable_id",   limit: 4,   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "actionable_type", limit: 255, null: false
    t.date     "business_date",               null: false
  end

  add_index "actions", ["actionable_id", "actionable_type"], name: "idx_actions_actionable", using: :btree
  add_index "actions", ["hotel_id", "action_type_id"], name: "index_actions_on_hotel_id_and_action_type_id", using: :btree

  create_table "additional_contacts", force: :cascade do |t|
    t.string   "value",                   limit: 255, null: false
    t.string   "external_id",             limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "contact_type_id",         limit: 4,   null: false
    t.integer  "label_id",                limit: 4,   null: false
    t.boolean  "is_primary"
    t.integer  "associated_address_id",   limit: 4
    t.string   "associated_address_type", limit: 255
  end

  add_index "additional_contacts", ["associated_address_id", "associated_address_type"], name: "idx_additional_contacts_association", using: :btree
  add_index "additional_contacts", ["external_id"], name: "idx_additional_contacts_external_id", using: :btree
  add_index "additional_contacts", ["value"], name: "idx_additional_contacts_value", using: :btree

  create_table "addons", force: :cascade do |t|
    t.string   "name",                   limit: 255,                                          null: false
    t.string   "description",            limit: 255
    t.date     "begin_date"
    t.date     "end_date"
    t.string   "package_rythm",          limit: 255
    t.string   "price_calculation",      limit: 255
    t.decimal  "amount",                             precision: 10, scale: 2
    t.integer  "hotel_id",               limit: 4
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
    t.integer  "posting_rythm_id",       limit: 4
    t.integer  "calculation_rule_id",    limit: 4
    t.boolean  "is_included_in_rate"
    t.string   "package_code",           limit: 255
    t.boolean  "bestseller",                                                  default: false, null: false
    t.integer  "charge_group_id",        limit: 4
    t.integer  "charge_code_id",         limit: 4
    t.integer  "amount_type_id",         limit: 4
    t.integer  "post_type_id",           limit: 4
    t.boolean  "rate_code_only",                                              default: false, null: false
    t.boolean  "is_active",                                                   default: true,  null: false
    t.boolean  "is_reservation_only",                                         default: false
    t.boolean  "manual_posting",                                              default: false
    t.integer  "inventory_count",        limit: 4
    t.boolean  "forecast_for_next_day",                                       default: false
    t.boolean  "charge_full_weeks_only",                                      default: false
    t.boolean  "allow_rate_exclusions",                                       default: false, null: false
  end

  add_index "addons", ["hotel_id", "package_code"], name: "index_addons_on_hotel_id_and_package_code", using: :btree

  create_table "addons_excluded_rates", force: :cascade do |t|
    t.integer "addon_id", limit: 4, null: false
    t.integer "rate_id",  limit: 4, null: false
  end

  add_index "addons_excluded_rates", ["addon_id", "rate_id"], name: "index_addons_excluded_rates_on_addon_id_and_rate_id", unique: true, using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "street1",                 limit: 255
    t.string   "street2",                 limit: 255
    t.string   "city",                    limit: 255
    t.string   "state",                   limit: 255
    t.string   "postal_code",             limit: 255
    t.boolean  "is_primary"
    t.string   "external_id",             limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "country_id",              limit: 4
    t.integer  "label_id",                limit: 4,   null: false
    t.integer  "associated_address_id",   limit: 4
    t.string   "associated_address_type", limit: 255
    t.string   "street3",                 limit: 255
  end

  add_index "addresses", ["associated_address_id", "associated_address_type"], name: "idx_addresses_association", using: :btree

  create_table "admin_menu_option_translations", force: :cascade do |t|
    t.integer  "admin_menu_option_id", limit: 4
    t.string   "locale",               limit: 255, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name",                 limit: 255
  end

  add_index "admin_menu_option_translations", ["admin_menu_option_id"], name: "index_admin_menu_option_translations_on_admin_menu_option_id", using: :btree
  add_index "admin_menu_option_translations", ["locale"], name: "index_admin_menu_option_translations_on_locale", using: :btree

  create_table "admin_menu_options", force: :cascade do |t|
    t.boolean  "is_group",                           default: false
    t.string   "icon_class",             limit: 255
    t.string   "action_path",            limit: 255,                 null: false
    t.integer  "admin_menu_id",          limit: 4,                   null: false
    t.integer  "parent_id",              limit: 4
    t.integer  "creator_id",             limit: 4
    t.integer  "updater_id",             limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "action_state",           limit: 255
    t.boolean  "require_standalone_pms",             default: false
    t.boolean  "require_external_pms",               default: false
    t.boolean  "nightly_only",                       default: false, null: false
  end

  create_table "admin_menu_translations", force: :cascade do |t|
    t.integer  "admin_menu_id", limit: 4
    t.string   "locale",        limit: 255, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
  end

  add_index "admin_menu_translations", ["admin_menu_id"], name: "index_admin_menu_translations_on_admin_menu_id", using: :btree
  add_index "admin_menu_translations", ["locale"], name: "index_admin_menu_translations_on_locale", using: :btree

  create_table "admin_menus", force: :cascade do |t|
    t.integer  "display_order", limit: 4
    t.string   "available_for", limit: 255, null: false
    t.integer  "creator_id",    limit: 4
    t.integer  "updater_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "analytics_setups", force: :cascade do |t|
    t.string   "analytics_type", limit: 255, null: false
    t.string   "product_type",   limit: 255, null: false
    t.string   "tracking_id",    limit: 255, null: false
    t.integer  "hotel_id",       limit: 4
    t.integer  "service_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "email",             limit: 255,                null: false
    t.string   "key",               limit: 255,                null: false
    t.datetime "expiry_date"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "user_id",           limit: 4
    t.boolean  "active",                        default: true, null: false
    t.integer  "interface_type_id", limit: 4
  end

  add_index "api_keys", ["email"], name: "index_api_keys_on_email", unique: true, using: :btree

  create_table "ar_details", force: :cascade do |t|
    t.integer  "account_id",          limit: 4
    t.string   "contact_first_name",  limit: 255
    t.string   "ar_number",           limit: 255
    t.string   "contact_last_name",   limit: 255
    t.string   "job_title",           limit: 255
    t.boolean  "is_use_main_contact"
    t.boolean  "is_use_main_address"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "payment_due_days",    limit: 255
    t.boolean  "allow_direct_debit",              default: true
    t.integer  "hotel_id",            limit: 4
  end

  create_table "ar_transactions", force: :cascade do |t|
    t.integer  "hotel_id",                 limit: 4
    t.integer  "bill_id",                  limit: 4
    t.integer  "account_id",               limit: 4
    t.integer  "associated_id",            limit: 4
    t.float    "credit",                   limit: 24
    t.decimal  "debit",                                precision: 10, scale: 2
    t.date     "paid_on"
    t.date     "date"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "associated_type",          limit: 255
    t.integer  "financial_transaction_id", limit: 4
    t.integer  "ar_bill_id",               limit: 4
  end

  add_index "ar_transactions", ["hotel_id", "date"], name: "index_ar_transactions_on_hotel_id_and_date", using: :btree

  create_table "asset_categories", force: :cascade do |t|
    t.string  "asset_type",        limit: 255
    t.integer "category_id",       limit: 4
    t.integer "type_id",           limit: 4
    t.integer "asset_category_id", limit: 4
    t.string  "asset_category",    limit: 255
  end

  create_table "assets", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "specification",  limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "asset_type",     limit: 255
    t.string   "asset_category", limit: 255
    t.integer  "assigned_to",    limit: 4
    t.integer  "asset_id",       limit: 4
  end

  create_table "async_callbacks", force: :cascade do |t|
    t.text     "request",     limit: 65535
    t.text     "response",    limit: 65535
    t.integer  "origin_id",   limit: 4
    t.string   "origin_type", limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "hotel_id",    limit: 4
    t.integer  "status",      limit: 4,     default: 102
  end

  add_index "async_callbacks", ["hotel_id"], name: "index_async_callbacks_on_hotel_id", using: :btree

  create_table "auto_sync_inventories", force: :cascade do |t|
    t.integer  "hotel_id",     limit: 4,                   null: false
    t.string   "emails",       limit: 255
    t.boolean  "is_auto_sync",             default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "beacons", force: :cascade do |t|
    t.string   "location",          limit: 255
    t.string   "uuid",              limit: 255
    t.boolean  "is_active",                       default: false, null: false
    t.text     "notification_text", limit: 65535
    t.integer  "hotel_id",          limit: 4,                     null: false
    t.integer  "promotion_id",      limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "type_id",           limit: 4,                     null: false
    t.integer  "trigger_range_id",  limit: 4,                     null: false
    t.boolean  "is_linked",                       default: false
  end

  create_table "billing_groups", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "hotel_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "bills", force: :cascade do |t|
    t.integer  "associated_id",   limit: 4,   null: false
    t.integer  "account_id",      limit: 4
    t.integer  "bill_number",     limit: 4,   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "associated_type", limit: 255
    t.string   "invoice_number",  limit: 255
  end

  add_index "bills", ["associated_id", "associated_type", "bill_number"], name: "index_bills_on_associated_id_and_associated_type_and_bill_number", using: :btree

  create_table "black_listed_emails", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.integer  "hotel_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "booking_origins", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_active"
    t.integer  "hotel_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "subject",               limit: 255
    t.text     "body",                  limit: 65535
    t.string   "call_to_action_label",  limit: 255
    t.string   "call_to_action_target", limit: 255
    t.text     "alert_ios7",            limit: 65535
    t.text     "alert_ios8",            limit: 65535
    t.date     "date_to_send"
    t.string   "time_to_send",          limit: 255
    t.boolean  "is_scheduled"
    t.date     "recurrence_end_date"
    t.datetime "last_sent_at"
    t.string   "status",                limit: 255
    t.integer  "audience_type_id",      limit: 4
    t.integer  "campaign_type_id",      limit: 4
    t.integer  "hotel_id",              limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "day_of_week",           limit: 255
    t.integer  "screen_type_id",        limit: 4
    t.string   "delivery_details",      limit: 255,                   null: false
    t.boolean  "is_deleted",                          default: false
    t.integer  "delay_after_checkin",   limit: 4
  end

  create_table "campaigns_recepients", force: :cascade do |t|
    t.integer  "campaign_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "cancellation_policies", force: :cascade do |t|
    t.string   "name",                  limit: 255,                 null: false
    t.string   "description",           limit: 255
    t.float    "amount",                limit: 24,                  null: false
    t.string   "amount_type",           limit: 255,                 null: false
    t.boolean  "apply_to_all_bookings",             default: false
    t.integer  "advance_days",          limit: 4
    t.time     "advance_time"
    t.integer  "hotel_id",              limit: 4,                   null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "creator_id",            limit: 4
    t.integer  "updater_id",            limit: 4
    t.integer  "charge_code_id",        limit: 4
    t.integer  "post_type_id",          limit: 4
  end

  create_table "cashier_periods", force: :cascade do |t|
    t.datetime "starts_at",                         null: false
    t.datetime "ends_at"
    t.integer  "user_id",               limit: 4
    t.string   "status",                limit: 255, null: false
    t.float    "checks_submitted",      limit: 24
    t.float    "cash_submitted",        limit: 24
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.float    "closing_balance_cash",  limit: 24
    t.float    "closing_balance_check", limit: 24
    t.integer  "creator_id",            limit: 4
    t.integer  "updater_id",            limit: 4
  end

  add_index "cashier_periods", ["user_id", "status", "ends_at"], name: "idx_cashier_periods_user_status_ends_at", using: :btree

  create_table "charge_code_generates", force: :cascade do |t|
    t.integer  "charge_code_id",          limit: 4,                 null: false
    t.integer  "generate_charge_code_id", limit: 4,                 null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "is_inclusive",                      default: false
  end

  add_index "charge_code_generates", ["charge_code_id", "generate_charge_code_id"], name: "index_charge_code_generates_uniq", unique: true, using: :btree

  create_table "charge_codes", force: :cascade do |t|
    t.string   "charge_code",             limit: 255,                          null: false
    t.string   "description",             limit: 255
    t.integer  "hotel_id",                limit: 4,                            null: false
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "charge_code_type_id",     limit: 4,                            null: false
    t.decimal  "amount",                              precision: 10, scale: 3
    t.integer  "post_type_id",            limit: 4
    t.integer  "amount_type_id",          limit: 4
    t.string   "amount_symbol",           limit: 255
    t.integer  "associated_payment_id",   limit: 4
    t.string   "associated_payment_type", limit: 255
    t.float    "minimum_amount_for_fees", limit: 24
  end

  add_index "charge_codes", ["associated_payment_id", "associated_payment_type"], name: "idx_charge_codes_assoc_pay", using: :btree
  add_index "charge_codes", ["charge_code", "description"], name: "index_charge_codes_on_charge_code_and_description", using: :btree
  add_index "charge_codes", ["charge_code", "hotel_id"], name: "index_charge_codes_on_charge_code_and_hotel_id", unique: true, using: :btree
  add_index "charge_codes", ["hotel_id", "description"], name: "index_charge_codes_on_hotel_id_and_description", using: :btree

  create_table "charge_codes_billing_groups", id: false, force: :cascade do |t|
    t.integer "charge_code_id",   limit: 4, null: false
    t.integer "billing_group_id", limit: 4, null: false
  end

  create_table "charge_groups", force: :cascade do |t|
    t.string   "charge_group", limit: 255, null: false
    t.string   "description",  limit: 255
    t.integer  "hotel_id",     limit: 4,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "charge_groups", ["charge_group", "hotel_id"], name: "index_charge_groups_on_charge_group_and_hotel_id", unique: true, using: :btree
  add_index "charge_groups", ["hotel_id"], name: "index_charge_groups_on_hotel_id", using: :btree

  create_table "charge_groups_codes", id: false, force: :cascade do |t|
    t.integer "charge_group_id", limit: 4, null: false
    t.integer "charge_code_id",  limit: 4, null: false
  end

  add_index "charge_groups_codes", ["charge_code_id", "charge_group_id"], name: "index_charge_groups_codes_on_charge_code_id_and_charge_group_id", unique: true, using: :btree
  add_index "charge_groups_codes", ["charge_group_id", "charge_code_id"], name: "index_charge_groups_codes_on_charge_group_id_and_charge_code_id", unique: true, using: :btree

  create_table "charge_routings", force: :cascade do |t|
    t.integer  "bill_id",                       limit: 4,                             null: false
    t.integer  "to_bill_id",                    limit: 4
    t.integer  "room_id",                       limit: 4
    t.integer  "charge_code_id",                limit: 4
    t.string   "external_routing_instructions", limit: 2000
    t.string   "owner_name",                    limit: 255
    t.integer  "created_by_id",                 limit: 4
    t.integer  "updated_by_id",                 limit: 4
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.integer  "billing_group_id",              limit: 4
    t.integer  "owner_id",                      limit: 4
    t.date     "from_date"
    t.date     "to_date"
    t.decimal  "credit_limit",                               precision: 10, scale: 2
    t.string   "reference_number",              limit: 255
  end

  add_index "charge_routings", ["bill_id"], name: "index_charge_routings_on_bill_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "email",            limit: 255
  end

  create_table "cms_components", force: :cascade do |t|
    t.string   "name",                              limit: 255
    t.integer  "hotel_id",                          limit: 4
    t.string   "component_type",                    limit: 255
    t.text     "description",                       limit: 65535
    t.string   "address",                           limit: 255
    t.string   "website_url",                       limit: 255
    t.string   "phone",                             limit: 255
    t.string   "page_template",                     limit: 255
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.boolean  "status",                                          default: true
    t.float    "latitude",                          limit: 24
    t.float    "longitude",                         limit: 24
    t.integer  "valid_branch_count",                limit: 4,     default: 0
    t.integer  "addon_id",                          limit: 4
    t.string   "cms_section_type",                  limit: 255
    t.integer  "addon_min_duration",                limit: 4
    t.integer  "addon_max_order",                   limit: 4
    t.string   "screen_id",                         limit: 255
    t.boolean  "is_description_visible",                          default: true
    t.string   "description_alignment",             limit: 255
    t.boolean  "is_search_enabled",                               default: false
    t.string   "email",                             limit: 255
    t.integer  "application_id",                    limit: 4
    t.string   "screen_title",                      limit: 255
    t.integer  "hotel_chain_id",                    limit: 4
    t.boolean  "is_system_defined",                               default: false
    t.boolean  "is_caraousal_enabled",                            default: false
    t.boolean  "is_caraousal_auto_advance_enabled",               default: false
    t.integer  "carousal_delay",                    limit: 4
    t.boolean  "is_carousal_loop_enabled",                        default: false
    t.boolean  "is_home_screen_section",                          default: false
    t.string   "system_defined_section_id",         limit: 255
  end

  create_table "cms_item_details", force: :cascade do |t|
    t.integer "cms_component_id", limit: 4
    t.string  "key",              limit: 255
    t.string  "value",            limit: 255
  end

  create_table "cms_section_components", force: :cascade do |t|
    t.integer  "parent_id",          limit: 4
    t.integer  "child_component_id", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "sequence_number",    limit: 4, default: 1
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.integer  "commentable_id",   limit: 4,                    null: false
    t.string   "commentable_type", limit: 255,                  null: false
    t.integer  "user_id",          limit: 4,                    null: false
    t.integer  "recipient_id",     limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.text     "comment",          limit: 65535,                null: false
    t.string   "author_name",      limit: 255
    t.string   "author_email",     limit: 255
    t.string   "author_url",       limit: 255
    t.string   "author_ip",        limit: 255
    t.boolean  "notify_by_email",                default: true
    t.integer  "hotel_id",         limit: 4
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["created_at"], name: "index_comments_on_created_at", using: :btree
  add_index "comments", ["hotel_id"], name: "index_comments_on_hotel_id", using: :btree
  add_index "comments", ["recipient_id"], name: "index_comments_on_recipient_id", using: :btree
  add_index "comments", ["user_id"], name: "fk_comments_user", using: :btree

  create_table "commission_transactions", force: :cascade do |t|
    t.integer  "reservation_id",         limit: 4
    t.integer  "origin_id",              limit: 4
    t.string   "origin_type",            limit: 255
    t.integer  "travel_agent_id",        limit: 4
    t.decimal  "amount",                             precision: 16, scale: 2, default: 0.0
    t.decimal  "tax",                                precision: 16, scale: 2, default: 0.0
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.string   "commission_rate",        limit: 255
    t.integer  "paid_status_id",         limit: 4
    t.decimal  "commissionable_revenue",             precision: 16, scale: 2, default: 0.0
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "website",           limit: 255
    t.string   "address",           limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  create_table "contract_nights", force: :cascade do |t|
    t.date     "month_year"
    t.integer  "no_of_nights", limit: 4
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "rate_id",      limit: 4, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "creator_id",            limit: 4
    t.integer  "updater_id",            limit: 4
    t.boolean  "is_group_conversation",           default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "code", limit: 255, null: false
  end

  add_index "countries", ["code"], name: "index_countries_on_code", unique: true, using: :btree
  add_index "countries", ["name"], name: "index_countries_on_name", unique: true, using: :btree

  create_table "country_sortings", force: :cascade do |t|
    t.integer "country_id", limit: 4
    t.integer "hotel_id",   limit: 4
    t.integer "sort_index", limit: 4
  end

  add_index "country_sortings", ["country_id"], name: "index_country_sortings_on_country_id", using: :btree
  add_index "country_sortings", ["hotel_id"], name: "index_country_sortings_on_hotel_id", using: :btree

  create_table "credit_card_batch_requests", force: :cascade do |t|
    t.integer  "hotel_id",            limit: 4
    t.integer  "external_batch_no",   limit: 4
    t.decimal  "batch_total_amount",            precision: 10, scale: 2
    t.integer  "batch_total_records", limit: 4
    t.boolean  "status"
    t.integer  "creator_id",          limit: 4
    t.integer  "updater_id",          limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "credit_card_batch_requests", ["hotel_id"], name: "index_credit_card_batch_requests_on_hotel_id", using: :btree

  create_table "credit_card_transactions", force: :cascade do |t|
    t.integer  "payment_method_id",               limit: 4
    t.integer  "credit_card_transaction_type_id", limit: 4
    t.float    "amount",                          limit: 24
    t.string   "req_reference_no",                limit: 255
    t.string   "external_transaction_ref",        limit: 255
    t.string   "authorization_code",              limit: 255
    t.integer  "currency_code_id",                limit: 4
    t.integer  "workstation_id",                  limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "status"
    t.integer  "creator_id",                      limit: 4
    t.integer  "updater_id",                      limit: 4
    t.integer  "hotel_id",                        limit: 4
    t.text     "external_print_data",             limit: 65535
    t.string   "external_failure_reason",         limit: 255
    t.string   "emv_terminal_id",                 limit: 255
    t.boolean  "is_swiped"
    t.boolean  "is_emv_pin_verified"
    t.boolean  "is_emv_authorized"
    t.string   "external_message",                limit: 255
    t.boolean  "is_dcc"
    t.string   "issue_number",                    limit: 255
    t.string   "merchant_id",                     limit: 255
    t.integer  "sequence_number",                 limit: 4
    t.integer  "source_id",                       limit: 4
    t.string   "source_type",                     limit: 255
    t.boolean  "is_batch_settled"
  end

  add_index "credit_card_transactions", ["credit_card_transaction_type_id"], name: "index_cc_on_cc_type_id", using: :btree
  add_index "credit_card_transactions", ["payment_method_id"], name: "index_credit_card_transactions_on_payment_method_id", using: :btree

  create_table "daily_balances", force: :cascade do |t|
    t.date     "date"
    t.decimal  "deposit_opening_balance",           precision: 10, scale: 2
    t.decimal  "deposit_closing_balance",           precision: 10, scale: 2
    t.decimal  "guest_opening_balance",             precision: 10, scale: 2
    t.decimal  "guest_closing_balance",             precision: 10, scale: 2
    t.decimal  "ar_opening_balance",                precision: 10, scale: 2
    t.decimal  "ar_closing_balance",                precision: 10, scale: 2
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "hotel_id",                limit: 4
  end

  create_table "default_account_routings", force: :cascade do |t|
    t.integer  "associated_account_id",   limit: 4
    t.integer  "charge_code_id",          limit: 4
    t.integer  "billing_group_id",        limit: 4
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "hotel_id",                limit: 4
    t.string   "associated_account_type", limit: 255
    t.date     "from_date"
    t.date     "to_date"
    t.decimal  "credit_limit",                        precision: 10, scale: 2
    t.string   "reference_number",        limit: 255
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "hotel_id",    limit: 4,     null: false
  end

  add_index "departments", ["name", "hotel_id"], name: "index_departments_on_name_and_hotel_id", unique: true, using: :btree

  create_table "deposit_policies", force: :cascade do |t|
    t.string   "name",                                              limit: 255,                 null: false
    t.string   "description",                                       limit: 255
    t.boolean  "apply_to_all_bookings",                                         default: false
    t.boolean  "allow_deposit_edit",                                            default: false
    t.integer  "hotel_id",                                          limit: 4,                   null: false
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
    t.integer  "creator_id",                                        limit: 4
    t.integer  "updater_id",                                        limit: 4
    t.boolean  "no_deposit_req_on_reservations_with_routed_charge",             default: true
  end

  add_index "deposit_policies", ["hotel_id"], name: "index_deposit_policies_on_hotel_id", using: :btree

  create_table "deposit_policy_schedules", force: :cascade do |t|
    t.float    "amount",                  limit: 24,  null: false
    t.string   "amount_type",             limit: 255, null: false
    t.integer  "post_type_id",            limit: 4
    t.integer  "advance_days",            limit: 4
    t.integer  "deposit_policy_id",       limit: 4,   null: false
    t.boolean  "auto_charge_on_due_date"
    t.integer  "max_no_nights",           limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "creator_id",              limit: 4
    t.integer  "updater_id",              limit: 4
  end

  create_table "early_checkin_excluded_block_codes", force: :cascade do |t|
    t.integer  "hotel_id",   limit: 4, null: false
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "early_checkin_setups", force: :cascade do |t|
    t.float    "charge",     limit: 24
    t.datetime "start_time"
    t.integer  "hotel_id",   limit: 4
    t.integer  "addon_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "email_template_themes", force: :cascade do |t|
    t.boolean  "is_system_specific",             default: false, null: false
    t.string   "name",               limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "code",               limit: 255,                 null: false
  end

  add_index "email_template_themes", ["name"], name: "index_email_template_themes_on_name", unique: true, using: :btree

  create_table "email_templates", force: :cascade do |t|
    t.string   "title",                   limit: 255,   null: false
    t.text     "subject",                 limit: 65535, null: false
    t.text     "body",                    limit: 65535, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.text     "signature",               limit: 65535
    t.integer  "email_template_theme_id", limit: 4
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.string   "email",                    limit: 255
    t.string   "address",                  limit: 255
    t.date     "date_of_birth"
    t.date     "date_of_joining"
    t.string   "mobile_no",                limit: 255
    t.string   "employment_status",        limit: 255
    t.string   "section",                  limit: 255
    t.string   "bank_account_details",     limit: 255
    t.string   "passport_details",         limit: 255
    t.string   "pancard_details",          limit: 255
    t.string   "adhar_card_details",       limit: 255
    t.string   "qualifications",           limit: 255
    t.string   "employee_id",              limit: 255
    t.string   "profile_pic_file_name",    limit: 255
    t.string   "profile_pic_content_type", limit: 255
    t.integer  "profile_pic_file_size",    limit: 4
    t.datetime "profile_pic_updated_at"
    t.string   "role",                     limit: 255
  end

  create_table "emv_terminals", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.integer  "hotel_id",            limit: 4
    t.string   "terminal_identifier", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "emv_terminals", ["hotel_id"], name: "index_emv_terminals_on_hotel_id", using: :btree

  create_table "entities", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.string   "display_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "entities", ["name"], name: "index_entities_on_name", unique: true, using: :btree

  create_table "errors", force: :cascade do |t|
    t.integer  "error_type_id", limit: 4
    t.string   "title",         limit: 255
    t.text     "message",       limit: 65535
    t.integer  "source_id",     limit: 4
    t.string   "source_type",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "errors", ["source_id", "source_type"], name: "index_errors_on_source_id_and_source_type", using: :btree

  create_table "export_delivery_methods", force: :cascade do |t|
    t.integer  "hotel_id",         limit: 4,     null: false
    t.string   "name",             limit: 100,   null: false
    t.integer  "delivery_type_id", limit: 4,     null: false
    t.string   "url",              limit: 1000
    t.integer  "port",             limit: 4
    t.string   "username",         limit: 100
    t.string   "password",         limit: 100
    t.string   "folder",           limit: 1000
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "creator_id",       limit: 4
    t.integer  "updater_id",       limit: 4
    t.text     "emails",           limit: 65535
  end

  create_table "export_schedules", force: :cascade do |t|
    t.integer  "hotel_id",           limit: 4,                    null: false
    t.integer  "report_id",          limit: 4,                    null: false
    t.integer  "frequency_id",       limit: 4,                    null: false
    t.time     "time",                                            null: false
    t.integer  "delivery_method_id", limit: 4,                    null: false
    t.integer  "format_id",          limit: 4,                    null: false
    t.boolean  "is_successful",                    default: true, null: false
    t.datetime "next_export_at",                                  null: false
    t.datetime "last_export_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "creator_id",         limit: 4
    t.integer  "updater_id",         limit: 4
    t.integer  "repeats_every",      limit: 4
    t.date     "starts_on"
    t.date     "ends_on_date"
    t.integer  "ends_on_after",      limit: 4
    t.text     "filter_values",      limit: 65535
    t.boolean  "is_complete",                      default: true
    t.integer  "time_period_id",     limit: 4
  end

  create_table "export_schedules_report_fields", force: :cascade do |t|
    t.integer "export_schedule_id", limit: 4, null: false
    t.integer "report_field_id",    limit: 4, null: false
  end

  create_table "ext_interface_type_mappings", force: :cascade do |t|
    t.string   "value",                     limit: 255, null: false
    t.string   "description",               limit: 255
    t.integer  "ref_ext_interface_type_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "ext_interface_type_mappings", ["ref_ext_interface_type_id", "value"], name: "idx_ext_interface_type_mappings_uniq", unique: true, using: :btree

  create_table "external_mappings", force: :cascade do |t|
    t.string   "external_value",                limit: 80,                  null: false
    t.string   "value",                         limit: 80,                  null: false
    t.integer  "hotel_id",                      limit: 4
    t.string   "mapping_type",                  limit: 55,                  null: false
    t.boolean  "is_inactive",                               default: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "pms_type_id",                   limit: 4,                   null: false
    t.string   "source_code",                   limit: 255
    t.integer  "ext_interface_type_mapping_id", limit: 4
  end

  add_index "external_mappings", ["hotel_id", "mapping_type", "external_value"], name: "idx_ext_mapping_ext_value", using: :btree
  add_index "external_mappings", ["hotel_id", "mapping_type", "value"], name: "idx_ext_mapping_value", using: :btree

  create_table "external_references", force: :cascade do |t|
    t.string   "value",                 limit: 45,                  null: false
    t.string   "description",           limit: 45,                  null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "associated_id",         limit: 4,                   null: false
    t.string   "associated_type",       limit: 255,                 null: false
    t.integer  "reference_type_id",     limit: 4,                   null: false
    t.integer  "ext_interface_type_id", limit: 4
    t.boolean  "primary"
    t.boolean  "is_from_rover",                     default: false, null: false
  end

  add_index "external_references", ["associated_id"], name: "index_external_references_on_associated_id", using: :btree
  add_index "external_references", ["associated_type"], name: "index_external_references_on_associated_type", using: :btree
  add_index "external_references", ["value"], name: "index_external_references_on_value", using: :btree

  create_table "feature_types", force: :cascade do |t|
    t.string   "value",                   limit: 255,                 null: false
    t.string   "selection_type",          limit: 255,                 null: false
    t.integer  "hotel_id",                limit: 4
    t.boolean  "hide_on_room_assignment"
    t.string   "description",             limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.boolean  "is_system_features_only",             default: false, null: false
  end

  create_table "features", force: :cascade do |t|
    t.string   "value",           limit: 255, null: false
    t.string   "description",     limit: 255
    t.integer  "hotel_id",        limit: 4
    t.integer  "feature_type_id", limit: 4,   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "financial_transactions", force: :cascade do |t|
    t.date     "date",                                                                              null: false
    t.decimal  "amount",                                   precision: 10, scale: 2,                 null: false
    t.integer  "charge_code_id",             limit: 4
    t.integer  "bill_id",                    limit: 4,                                              null: false
    t.datetime "created_at",                                                                        null: false
    t.datetime "updated_at",                                                                        null: false
    t.string   "external_id",                limit: 255
    t.string   "reference_number",           limit: 255
    t.integer  "currency_code_id",           limit: 4,                                              null: false
    t.integer  "article_id",                 limit: 4
    t.boolean  "is_active",                                                         default: true
    t.integer  "parent_transaction_id",      limit: 4
    t.integer  "credit_card_transaction_id", limit: 4
    t.integer  "creator_id",                 limit: 4
    t.integer  "updater_id",                 limit: 4
    t.datetime "time"
    t.string   "transaction_type",           limit: 255
    t.boolean  "is_eod_transaction",                                                default: false
    t.text     "comments",                   limit: 65535
    t.integer  "original_transaction_id",    limit: 4
    t.integer  "cashier_period_id",          limit: 4
    t.string   "reference_text",             limit: 255
    t.integer  "addon_id",                   limit: 4
    t.integer  "inclusive_parent_id",        limit: 4
    t.boolean  "is_pre_stay",                                                       default: false
    t.date     "checkin_date"
    t.string   "adjustment_reason",          limit: 255
  end

  add_index "financial_transactions", ["bill_id"], name: "index_financial_transactions_on_bill_id", using: :btree
  add_index "financial_transactions", ["charge_code_id", "checkin_date"], name: "index_financial_transactions_on_charge_code_id_and_checkin_date", using: :btree
  add_index "financial_transactions", ["charge_code_id", "date"], name: "idx_financial_trans_charge_code_date", using: :btree
  add_index "financial_transactions", ["credit_card_transaction_id"], name: "index_financial_transactions_on_credit_card_transaction_id", using: :btree
  add_index "financial_transactions", ["inclusive_parent_id"], name: "index_financial_transactions_on_inclusive_parent_id", using: :btree
  add_index "financial_transactions", ["original_transaction_id"], name: "index_financial_transactions_on_original_transaction_id", using: :btree
  add_index "financial_transactions", ["parent_transaction_id"], name: "index_financial_transactions_on_parent_transaction_id", using: :btree
  add_index "financial_transactions", ["updater_id"], name: "index_financial_transactions_on_updater_id", using: :btree

  create_table "floors", force: :cascade do |t|
    t.string   "floor_number", limit: 40,  null: false
    t.string   "description",  limit: 255
    t.integer  "hotel_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "front_office_statuses_tasks", force: :cascade do |t|
    t.integer "task_id",                limit: 4
    t.integer "front_office_status_id", limit: 4
  end

  create_table "future_transactions", force: :cascade do |t|
    t.integer  "associated_id",   limit: 4
    t.string   "associated_type", limit: 255
    t.integer  "charge_code_id",  limit: 4
    t.decimal  "amount",                      precision: 10, scale: 2
    t.decimal  "base_amount",                 precision: 10, scale: 2
    t.string   "ancestry",        limit: 255
    t.boolean  "is_inclusive"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "future_transactions", ["ancestry"], name: "index_future_transactions_on_ancestry", using: :btree
  add_index "future_transactions", ["associated_id", "associated_type"], name: "index_future_transactions_on_associated_id_and_associated_type", using: :btree
  add_index "future_transactions", ["charge_code_id"], name: "index_future_transactions_on_charge_code_id", using: :btree

  create_table "group_addons", force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.integer  "addon_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "group_addons", ["group_id"], name: "index_group_addons_on_group_id", using: :btree

  create_table "group_custom_rates", force: :cascade do |t|
    t.integer  "group_room_type_id", limit: 4
    t.float    "single_amount",      limit: 24
    t.float    "double_amount",      limit: 24
    t.float    "extra_adult_amount", limit: 24
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "rate_id",            limit: 4
  end

  add_index "group_custom_rates", ["group_room_type_id"], name: "index_group_custom_rates_on_group_room_type_id", using: :btree

  create_table "group_hold_status_settings", force: :cascade do |t|
    t.integer  "hotel_id",                  limit: 4,        null: false
    t.integer  "group_hold_status_id",      limit: 4,        null: false
    t.text     "confirmation_email_header", limit: 16777215
    t.text     "confirmation_email_footer", limit: 16777215
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "group_hold_statuses", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.integer  "hotel_id",               limit: 4
    t.boolean  "is_take_from_inventory",             default: false, null: false
    t.boolean  "is_system",                          default: false, null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "is_group_only",                      default: false
    t.boolean  "is_allotment_only",                  default: false
  end

  create_table "group_inventories", force: :cascade do |t|
    t.integer  "group_room_type_id",    limit: 4
    t.date     "date"
    t.integer  "occ1_to_sell",          limit: 4
    t.integer  "occ2_to_sell",          limit: 4
    t.integer  "occ3_to_sell",          limit: 4
    t.integer  "occ4_to_sell",          limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "creator_id",            limit: 4
    t.integer  "updater_id",            limit: 4
    t.integer  "contract_occ1_to_sell", limit: 4
    t.integer  "contract_occ2_to_sell", limit: 4
    t.integer  "contract_occ3_to_sell", limit: 4
    t.integer  "contract_occ4_to_sell", limit: 4
    t.integer  "release_day_range",     limit: 4
    t.integer  "occ1_contract",         limit: 4
    t.integer  "occ2_contract",         limit: 4
    t.integer  "occ3_contract",         limit: 4
    t.integer  "occ4_contract",         limit: 4
    t.date     "release_date"
  end

  add_index "group_inventories", ["group_room_type_id", "date"], name: "index_group_inventories_on_group_room_type_id_and_date", using: :btree

  create_table "group_room_types", force: :cascade do |t|
    t.integer  "group_id",     limit: 4
    t.integer  "room_type_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.boolean  "can_edit",               default: true
  end

  add_index "group_room_types", ["group_id", "room_type_id"], name: "index_group_room_types_on_group_id_and_room_type_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",                         limit: 255,                null: false
    t.integer  "hotel_id",                     limit: 4,                  null: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "members_count",                limit: 4
    t.string   "group_code",                   limit: 255
    t.date     "from_date"
    t.date     "to_date"
    t.string   "first_name",                   limit: 255
    t.string   "last_name",                    limit: 255
    t.string   "email",                        limit: 255
    t.integer  "booked_count",                 limit: 4
    t.date     "release_date"
    t.integer  "creator_id",                   limit: 4
    t.integer  "updator_id",                   limit: 4
    t.string   "phone",                        limit: 255
    t.integer  "reservation_type_id",          limit: 4
    t.integer  "market_segment_id",            limit: 4
    t.integer  "source_id",                    limit: 4
    t.integer  "booking_origin_id",            limit: 4
    t.integer  "rate_id",                      limit: 4
    t.integer  "hold_status_id",               limit: 4
    t.integer  "posting_account_id",           limit: 4
    t.integer  "segment_id",                   limit: 4
    t.boolean  "hide_rates",                               default: true
    t.integer  "travel_agent_id",              limit: 4
    t.integer  "company_id",                   limit: 4
    t.string   "group_type",                   limit: 255
    t.integer  "charge_routes_recipient_id",   limit: 4
    t.string   "charge_routes_recipient_type", limit: 255
  end

  add_index "groups", ["from_date"], name: "index_groups_on_from_date", using: :btree
  add_index "groups", ["group_code", "hotel_id"], name: "index_groups_on_group_code_and_hotel_id", using: :btree
  add_index "groups", ["hotel_id"], name: "index_groups_on_hotel_id", using: :btree
  add_index "groups", ["name"], name: "index_groups_on_name", using: :btree
  add_index "groups", ["posting_account_id"], name: "index_groups_on_posting_account_id", using: :btree

  create_table "guest_bill_print_settings", force: :cascade do |t|
    t.string   "logo_type",                  limit: 255
    t.boolean  "show_hotel_address"
    t.text     "custom_text_header",         limit: 65535
    t.text     "custom_text_footer",         limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "hotel_id",                   limit: 4
    t.string   "email_logo_type",            limit: 255
    t.string   "logo_type_for_cancellation", limit: 255
  end

  create_table "guest_details", force: :cascade do |t|
    t.integer  "user_id",                  limit: 4
    t.date     "birthday"
    t.string   "gender",                   limit: 255
    t.boolean  "is_vip"
    t.string   "title",                    limit: 255
    t.string   "company",                  limit: 255
    t.string   "works_at",                 limit: 255
    t.string   "external_id",              limit: 255
    t.string   "passport_no",              limit: 255
    t.date     "passport_expiry"
    t.string   "image_url",                limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "first_name",               limit: 255
    t.string   "last_name",                limit: 255,                 null: false
    t.integer  "hotel_chain_id",           limit: 4,                   null: false
    t.string   "job_title",                limit: 255
    t.string   "nationality",              limit: 255
    t.integer  "language_id",              limit: 4
    t.string   "avatar_file_name",         limit: 255
    t.string   "avatar_content_type",      limit: 255
    t.integer  "avatar_file_size",         limit: 4
    t.datetime "avatar_updated_at"
    t.boolean  "is_opted_promotion_email",             default: false, null: false
    t.boolean  "is_primary_to_zest_user",              default: false
    t.string   "tax_number",               limit: 255
    t.integer  "government_id_type_id",    limit: 4
    t.string   "government_id_number",     limit: 255
    t.string   "striped_last_name",        limit: 255,                 null: false
  end

  add_index "guest_details", ["hotel_chain_id", "external_id"], name: "index_guest_details_on_hotel_chain_id_and_external_id", using: :btree
  add_index "guest_details", ["hotel_chain_id", "last_name", "first_name"], name: "idx_guest_details_first_last", using: :btree
  add_index "guest_details", ["striped_last_name"], name: "index_guest_details_on_striped_last_name", using: :btree
  add_index "guest_details", ["user_id"], name: "index_guest_details_on_user_id", using: :btree

  create_table "guest_features", force: :cascade do |t|
    t.integer "guest_detail_id", limit: 4, null: false
    t.integer "feature_id",      limit: 4, null: false
  end

  add_index "guest_features", ["guest_detail_id", "feature_id"], name: "index_guest_features_on_guest_detail_id_and_feature_id", unique: true, using: :btree

  create_table "guest_memberships", force: :cascade do |t|
    t.integer  "guest_detail_id",        limit: 4,   null: false
    t.string   "membership_card_number", limit: 255
    t.date     "membership_expiry_date"
    t.string   "name_on_card",           limit: 255
    t.date     "membership_start_date"
    t.string   "external_id",            limit: 255
    t.integer  "membership_level_id",    limit: 4
    t.integer  "membership_type_id",     limit: 4,   null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "guest_memberships", ["guest_detail_id"], name: "index_guest_memberships_on_guest_detail_id", using: :btree
  add_index "guest_memberships", ["membership_type_id", "guest_detail_id"], name: "index_guest_memberships_uniq", unique: true, using: :btree

  create_table "guest_web_tokens", force: :cascade do |t|
    t.integer  "guest_detail_id", limit: 4
    t.string   "access_token",    limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_active",                   default: true
    t.integer  "reservation_id",  limit: 4
    t.string   "email_type",      limit: 255
  end

  create_table "guest_web_urls", force: :cascade do |t|
    t.integer  "hotel_id",              limit: 4,                  null: false
    t.integer  "application_id",        limit: 4,                  null: false
    t.integer  "guest_web_url_type_id", limit: 4,                  null: false
    t.string   "name",                  limit: 255,                null: false
    t.string   "url_suffix",            limit: 255,                null: false
    t.boolean  "active",                            default: true, null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "hotel_brands", force: :cascade do |t|
    t.string   "name",              limit: 255,                 null: false
    t.string   "icon_file_name",    limit: 255
    t.string   "icon_content_type", limit: 255
    t.integer  "icon_file_size",    limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "hotel_chain_id",    limit: 4,                   null: false
    t.boolean  "is_inactive",                   default: false
  end

  add_index "hotel_brands", ["name"], name: "index_hotel_brands_on_name", unique: true, using: :btree

  create_table "hotel_business_dates", force: :cascade do |t|
    t.integer  "hotel_id",      limit: 4,                    null: false
    t.date     "business_date",                              null: false
    t.string   "status",        limit: 255, default: "OPEN", null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "hotel_business_dates", ["business_date", "hotel_id"], name: "index_hotel_business_dates_on_business_date_and_hotel_id", unique: true, using: :btree
  add_index "hotel_business_dates", ["status"], name: "index_hotel_business_dates_on_status", using: :btree

  create_table "hotel_chains", force: :cascade do |t|
    t.string   "name",                    limit: 255,                 null: false
    t.string   "icon_file_name",          limit: 255
    t.string   "icon_content_type",       limit: 255
    t.integer  "icon_file_size",          limit: 4
    t.string   "welcome_msg",             limit: 255
    t.string   "splash_file_name",        limit: 255
    t.string   "splash_content_type",     limit: 255
    t.integer  "splash_file_size",        limit: 4
    t.datetime "splash_updated_at"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.boolean  "batch_process_enabled",               default: true,  null: false
    t.string   "code",                    limit: 255,                 null: false
    t.boolean  "is_inactive",                         default: false
    t.integer  "room_status_import_freq", limit: 4
    t.string   "domain_name",             limit: 255
    t.string   "beacon_uuid_proximity",   limit: 255
  end

  add_index "hotel_chains", ["code"], name: "index_hotel_chains_on_code", unique: true, using: :btree
  add_index "hotel_chains", ["name"], name: "index_hotel_chains_on_name", unique: true, using: :btree

  create_table "hotel_email_templates", force: :cascade do |t|
    t.integer  "hotel_id",          limit: 4
    t.integer  "email_template_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "hotel_ext_interfaces", force: :cascade do |t|
    t.integer  "hotel_id",                  limit: 4, null: false
    t.integer  "ref_ext_interface_type_id", limit: 4, null: false
    t.boolean  "active"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "hotel_guest_languages", force: :cascade do |t|
    t.integer  "hotel_id",    limit: 4, null: false
    t.integer  "language_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "hotel_interfaces", force: :cascade do |t|
    t.integer  "hotel_id",                  limit: 4,                 null: false
    t.integer  "ref_interface_type_id",     limit: 4,                 null: false
    t.integer  "ref_key_system_id",         limit: 4
    t.boolean  "is_inactive",                         default: true
    t.boolean  "remove_room_leading_zeros",           default: false
    t.boolean  "is_remote_encoder_enabled",           default: false
    t.boolean  "is_mobile_key_enabled",               default: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "creator_id",                limit: 4
    t.integer  "updater_id",                limit: 4
  end

  add_index "hotel_interfaces", ["hotel_id"], name: "index_hotel_interfaces_on_hotel_id", using: :btree

  create_table "hotel_message_translations", force: :cascade do |t|
    t.integer  "hotel_message_id", limit: 4
    t.string   "locale",           limit: 255,   null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "message",          limit: 65535
  end

  add_index "hotel_message_translations", ["hotel_message_id"], name: "index_hotel_message_translations_on_hotel_message_id", using: :btree
  add_index "hotel_message_translations", ["locale"], name: "index_hotel_message_translations_on_locale", using: :btree

  create_table "hotel_messages", force: :cascade do |t|
    t.integer  "hotel_id",             limit: 4
    t.string   "module",               limit: 255, null: false
    t.integer  "hotel_message_key_id", limit: 4,   null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "hotel_review_categories", id: false, force: :cascade do |t|
    t.integer "hotel_id",               limit: 4, null: false
    t.integer "ref_review_category_id", limit: 4, null: false
  end

  add_index "hotel_review_categories", ["hotel_id", "ref_review_category_id"], name: "index_hotel_review_categories_uniq", unique: true, using: :btree
  add_index "hotel_review_categories", ["hotel_id"], name: "index_hotel_review_categories_on_hotel_id", using: :btree

  create_table "hotels", force: :cascade do |t|
    t.string   "name",                              limit: 255,                 null: false
    t.integer  "staffs_count",                      limit: 4
    t.integer  "guests_count",                      limit: 4
    t.integer  "posts_today_count",                 limit: 4
    t.integer  "posts_month_count",                 limit: 4
    t.integer  "number_of_rooms",                   limit: 4
    t.string   "code",                              limit: 255
    t.string   "icon_file_name",                    limit: 255
    t.string   "icon_content_type",                 limit: 255
    t.integer  "icon_file_size",                    limit: 4
    t.string   "zipcode",                           limit: 255
    t.string   "hotel_phone",                       limit: 255
    t.string   "short_name",                        limit: 255
    t.time     "checkout_time"
    t.integer  "arr_grace_period",                  limit: 4
    t.integer  "dep_grace_period",                  limit: 4
    t.integer  "groups_count",                      limit: 4
    t.integer  "checkin_bypass",                    limit: 1
    t.float    "latitude",                          limit: 24
    t.float    "longitude",                         limit: 24
    t.string   "city",                              limit: 255,                 null: false
    t.string   "state",                             limit: 255
    t.integer  "country_id",                        limit: 4,                   null: false
    t.time     "checkin_time"
    t.string   "welcome_msg",                       limit: 255
    t.string   "welcome_msg_detail",                limit: 255
    t.string   "sl_checkin_msg",                    limit: 255
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "hotel_chain_id",                    limit: 4
    t.integer  "hotel_brand_id",                    limit: 4
    t.datetime "last_reservation_update"
    t.string   "street",                            limit: 255,                 null: false
    t.boolean  "is_inactive",                                   default: false
    t.string   "last_reservation_filename",         limit: 255
    t.integer  "default_currency_id",               limit: 4
    t.string   "main_contact_first_name",           limit: 255
    t.string   "main_contact_last_name",            limit: 255
    t.string   "main_contact_email",                limit: 255
    t.string   "main_contact_phone",                limit: 255
    t.string   "tz_info",                           limit: 255
    t.integer  "pms_type_id",                       limit: 4
    t.string   "domain_name",                       limit: 255
    t.boolean  "is_res_import_on",                              default: true,  null: false
    t.integer  "key_system_id",                     limit: 4
    t.integer  "auto_logout_delay",                 limit: 4
    t.string   "hotel_from_address",                limit: 255
    t.integer  "late_checkout_charge_code_id",      limit: 4
    t.integer  "upsell_charge_code_id",             limit: 4
    t.string   "template_logo_file_name",           limit: 255
    t.string   "template_logo_content_type",        limit: 255
    t.integer  "template_logo_file_size",           limit: 4
    t.datetime "template_logo_updated_at"
    t.integer  "day_import_freq",                   limit: 4,   default: 5
    t.integer  "night_import_freq",                 limit: 4,   default: 5
    t.datetime "last_smartband_imported"
    t.boolean  "is_market_segments_on"
    t.integer  "language_id",                       limit: 4
    t.string   "beacon_uuid_major",                 limit: 255
    t.integer  "default_date_format_id",            limit: 4
    t.boolean  "is_eod_in_progress",                            default: false
    t.boolean  "is_eod_manual_started",                         default: false
    t.date     "pms_start_date"
    t.boolean  "is_external_references_import_on",              default: false, null: false
    t.integer  "external_references_import_freq",   limit: 4
    t.datetime "last_external_references_update"
    t.string   "last_external_references_filename", limit: 255
    t.boolean  "is_reservation_export_on",                      default: false, null: false
    t.boolean  "is_res_import_in_progress",                     default: false
    t.boolean  "is_hold_room_import_on",                        default: false
    t.integer  "hold_room_import_freq",             limit: 4,   default: 60
    t.datetime "last_hold_rooms_imported_at"
    t.string   "last_hold_rooms_import_file",       limit: 255
    t.string   "hotel_picture_file_name",           limit: 255
    t.string   "hotel_picture_content_type",        limit: 255
    t.integer  "hotel_picture_file_size",           limit: 4
    t.datetime "hotel_picture_updated_at"
    t.string   "checkout_static_uri",               limit: 255
    t.string   "hotel_email_address",               limit: 255
    t.string   "checkin_static_uri",                limit: 255
    t.integer  "next_day_upsell_charge_code_id",    limit: 4
    t.datetime "next_eod_at"
    t.datetime "next_check_in_email_at"
    t.datetime "next_check_in_next_day_email_at"
    t.datetime "next_check_out_email_at"
    t.datetime "next_check_out_alt_email_at"
    t.integer  "service_provider_id",               limit: 4
    t.string   "alternate_name",                    limit: 255
  end

  add_index "hotels", ["code", "hotel_chain_id"], name: "index_hotels_on_code_and_hotel_chain_id", unique: true, using: :btree
  add_index "hotels", ["last_reservation_update"], name: "index_hotels_on_last_reservation_update", using: :btree
  add_index "hotels", ["name", "hotel_chain_id"], name: "index_hotels_on_name_and_hotel_chain_id", unique: true, using: :btree
  add_index "hotels", ["tz_info"], name: "index_hotels_on_tz_info", using: :btree

  create_table "hotels_account_commissions", force: :cascade do |t|
    t.integer  "hotel_id",         limit: 4
    t.integer  "account_id",       limit: 4
    t.float    "base_revenue",     limit: 24
    t.float    "to_date_amount",   limit: 24
    t.float    "unpaid_amount",    limit: 24
    t.integer  "open_bills_count", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "hotels_account_commissions", ["hotel_id", "account_id"], name: "index_hotels_account_commissions_on_hotel_id_and_account_id", unique: true, using: :btree

  create_table "hotels_credit_card_types", force: :cascade do |t|
    t.integer "hotel_id",                limit: 4,                 null: false
    t.integer "ref_credit_card_type_id", limit: 4,                 null: false
    t.boolean "is_cc",                             default: true
    t.boolean "is_offline",                        default: false
    t.boolean "is_rover_only",                     default: false
    t.boolean "is_web_only",                       default: false
    t.boolean "active",                            default: true
    t.boolean "is_display_reference",              default: false
  end

  add_index "hotels_credit_card_types", ["hotel_id", "ref_credit_card_type_id"], name: "index_hotels_credit_card_types_uniq", unique: true, using: :btree

  create_table "hotels_early_checkin_groups", force: :cascade do |t|
    t.integer "hotel_id", limit: 4
    t.integer "group_id", limit: 4
  end

  create_table "hotels_early_checkin_rates", force: :cascade do |t|
    t.integer "hotel_id", limit: 4
    t.integer "rate_id",  limit: 4
  end

  create_table "hotels_eod_processes", force: :cascade do |t|
    t.integer  "hotel_id",       limit: 4
    t.integer  "eod_process_id", limit: 4
    t.date     "date"
    t.integer  "status_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "hotels_eod_processes", ["eod_process_id"], name: "index_hotels_eod_processes_on_eod_process_id", using: :btree
  add_index "hotels_eod_processes", ["hotel_id"], name: "index_hotels_eod_processes_on_hotel_id", using: :btree
  add_index "hotels_eod_processes", ["status_id"], name: "index_hotels_eod_processes_on_status_id", using: :btree

  create_table "hotels_feature_types", id: false, force: :cascade do |t|
    t.integer "hotel_id",        limit: 4, null: false
    t.integer "feature_type_id", limit: 4, null: false
  end

  add_index "hotels_feature_types", ["hotel_id", "feature_type_id"], name: "index_hotels_feature_types_on_hotel_id_and_feature_type_id", unique: true, using: :btree

  create_table "hotels_features", id: false, force: :cascade do |t|
    t.integer "hotel_id",   limit: 4, null: false
    t.integer "feature_id", limit: 4, null: false
  end

  add_index "hotels_features", ["hotel_id", "feature_id"], name: "index_hotels_features_on_hotel_id_and_feature_id", unique: true, using: :btree

  create_table "hotels_membership_types", id: false, force: :cascade do |t|
    t.integer "membership_type_id", limit: 4, null: false
    t.integer "hotel_id",           limit: 4, null: false
  end

  add_index "hotels_membership_types", ["hotel_id", "membership_type_id"], name: "index_hotels_membership_types_on_hotel_id_and_membership_type_id", unique: true, using: :btree

  create_table "hotels_payment_types", force: :cascade do |t|
    t.integer "hotel_id",                   limit: 4,                 null: false
    t.integer "payment_type_id",            limit: 4,                 null: false
    t.boolean "is_cc",                                default: false
    t.boolean "is_offline",                           default: false
    t.boolean "is_rover_only",                        default: false
    t.boolean "is_web_only",                          default: false
    t.boolean "active",                               default: true
    t.boolean "is_display_reference",                 default: false
    t.integer "linked_reservation_type_id", limit: 4
    t.integer "custom_cc_processor_id",     limit: 4
  end

  add_index "hotels_payment_types", ["hotel_id", "payment_type_id"], name: "index_hotels_payment_types_on_hotel_id_and_ref_payment_type_id", unique: true, using: :btree
  add_index "hotels_payment_types", ["hotel_id"], name: "index_hotels_payment_types_on_hotel_id", using: :btree

  create_table "hotels_rate_types", id: false, force: :cascade do |t|
    t.integer "hotel_id",     limit: 4, null: false
    t.integer "rate_type_id", limit: 4, null: false
  end

  add_index "hotels_rate_types", ["hotel_id", "rate_type_id"], name: "index_hotels_rate_types_on_hotel_id_and_rate_type_id", unique: true, using: :btree

  create_table "hotels_reservation_types", force: :cascade do |t|
    t.integer "hotel_id",                limit: 4, null: false
    t.integer "ref_reservation_type_id", limit: 4, null: false
  end

  create_table "hotels_restriction_types", force: :cascade do |t|
    t.integer "hotel_id",            limit: 4
    t.integer "restriction_type_id", limit: 4
  end

  create_table "hotels_roles", force: :cascade do |t|
    t.integer "hotel_id",             limit: 4,                 null: false
    t.integer "role_id",              limit: 4,                 null: false
    t.integer "default_dashboard_id", limit: 4,                 null: false
    t.boolean "is_active",                      default: false, null: false
  end

  create_table "hotels_users", id: false, force: :cascade do |t|
    t.integer "hotel_id", limit: 4, null: false
    t.integer "user_id",  limit: 4, null: false
  end

  add_index "hotels_users", ["hotel_id", "user_id"], name: "index_hotels_users_on_hotel_id_and_user_id", unique: true, using: :btree

  create_table "hourly_inventory_details", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "hour",                limit: 4
    t.integer  "sold",                limit: 4
    t.integer  "inventory_detail_id", limit: 4
    t.integer  "hotel_id",            limit: 4
    t.integer  "rate_id",             limit: 4
    t.integer  "room_type_id",        limit: 4
    t.date     "date"
    t.integer  "creator_id",          limit: 4
    t.integer  "updater_id",          limit: 4
  end

  create_table "hourly_room_rates", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "hour",         limit: 4
    t.float    "amount",       limit: 24
    t.integer  "room_rate_id", limit: 4
  end

  create_table "images", force: :cascade do |t|
    t.string   "image_file_name",       limit: 255
    t.string   "image_content_type",    limit: 255
    t.string   "image_file_size",       limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "image_attachable_id",   limit: 4
    t.string   "image_attachable_type", limit: 255
    t.boolean  "is_list_image"
  end

  create_table "inactive_rooms", force: :cascade do |t|
    t.integer  "room_id",               limit: 4
    t.integer  "ref_service_status_id", limit: 4
    t.integer  "maintenance_reason_id", limit: 4
    t.text     "comments",              limit: 65535
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  add_index "inactive_rooms", ["date"], name: "index_inactive_rooms_on_date", using: :btree
  add_index "inactive_rooms", ["room_id"], name: "index_inactive_rooms_on_room_id", using: :btree

  create_table "interface_key_card_types", force: :cascade do |t|
    t.integer "hotel_interface_id",   limit: 4, null: false
    t.integer "ref_key_card_type_id", limit: 4, null: false
  end

  create_table "interface_settings", force: :cascade do |t|
    t.integer "hotel_interface_id", limit: 4,   null: false
    t.string  "setting",            limit: 255, null: false
    t.string  "value",              limit: 255
  end

  add_index "interface_settings", ["hotel_interface_id", "setting", "value"], name: "unique_interface_settings", unique: true, using: :btree

  create_table "inventory_details", force: :cascade do |t|
    t.integer  "hotel_id",     limit: 4, null: false
    t.date     "date",                   null: false
    t.integer  "rate_id",      limit: 4
    t.integer  "room_type_id", limit: 4, null: false
    t.integer  "sold",         limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
  end

  add_index "inventory_details", ["hotel_id", "date"], name: "index_inventory_details_on_hotel_id_and_date", using: :btree
  add_index "inventory_details", ["hotel_id", "rate_id", "room_type_id", "date"], name: "index_inventory_details_uniq", unique: true, using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "hotel_id",       limit: 4,                                            null: false
    t.integer  "charge_code_id", limit: 4,                                            null: false
    t.decimal  "unit_price",                 precision: 10, scale: 2,                 null: false
    t.string   "description",    limit: 255,                                          null: false
    t.integer  "created_by_id",  limit: 4
    t.integer  "updated_by_id",  limit: 4
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.boolean  "is_favorite",                                         default: false
  end

  add_index "items", ["hotel_id", "description"], name: "index_items_on_hotel_id_and_description", unique: true, using: :btree

  create_table "key_encoders", force: :cascade do |t|
    t.integer  "hotel_id",    limit: 4,                  null: false
    t.string   "description", limit: 255,                null: false
    t.string   "location",    limit: 255
    t.string   "encoder_id",  limit: 255,                null: false
    t.boolean  "enabled",                 default: true, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "creator_id",  limit: 4
    t.integer  "updater_id",  limit: 4
  end

  create_table "late_checkout_charges", force: :cascade do |t|
    t.time     "extended_checkout_time",              null: false
    t.float    "extended_checkout_charge", limit: 24, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "hotel_id",                 limit: 4,  null: false
  end

  add_index "late_checkout_charges", ["hotel_id", "extended_checkout_time"], name: "index_late_checkout_charges_uniq", unique: true, using: :btree

  create_table "lhma_2016_01_20_14_40_19_110_reservations_addons", force: :cascade do |t|
    t.integer "reservation_id",       limit: 4,              null: false
    t.integer "addon_id",             limit: 4,              null: false
    t.float   "price",                limit: 24
    t.boolean "is_inclusive_in_rate"
    t.integer "quantity",             limit: 4,  default: 1, null: false
    t.date    "start_date"
    t.date    "end_date"
  end

  add_index "lhma_2016_01_20_14_40_19_110_reservations_addons", ["reservation_id", "addon_id"], name: "idx_reservations_addons", using: :btree

  create_table "lhma_2016_01_28_12_04_43_315_sms_keywords", force: :cascade do |t|
    t.integer "sms_campaign_id", limit: 4
    t.string  "sms_keyword",     limit: 255
    t.string  "sms_response",    limit: 255
  end

  create_table "lhma_2016_01_28_12_04_45_284_sms_keywords", force: :cascade do |t|
    t.string  "sms_keyword",             limit: 255
    t.string  "sms_response",            limit: 255
    t.integer "sms_object_id",           limit: 4
    t.integer "ref_sms_keyword_type_id", limit: 4
    t.string  "type",                    limit: 255
  end

  create_table "lhma_2016_02_08_14_23_46_996_sms_codes", force: :cascade do |t|
    t.integer "hotel_chain_id", limit: 4
    t.string  "account_sid",    limit: 255
    t.string  "auth_token",     limit: 255
    t.string  "code",           limit: 255
    t.boolean "active",                     default: false
  end

  create_table "lhma_2016_02_08_14_23_47_787_sms_campaigns", force: :cascade do |t|
    t.integer "sms_code_id", limit: 4
    t.integer "hotel_id",    limit: 4
    t.boolean "active",                default: false
  end

  create_table "lhma_2016_02_08_14_23_58_765_reservations", force: :cascade do |t|
    t.string   "confirm_no",                     limit: 255,                                            null: false
    t.date     "arrival_date",                                                                          null: false
    t.date     "dep_date",                                                                              null: false
    t.integer  "hotel_id",                       limit: 4,                                              null: false
    t.datetime "created_at",                                                                            null: false
    t.datetime "updated_at",                                                                            null: false
    t.decimal  "upsell_amount",                                precision: 10, scale: 2
    t.datetime "arrival_time"
    t.string   "cancellation_no",                limit: 255
    t.date     "cancel_date"
    t.string   "cancel_reason",                  limit: 255
    t.string   "company_id",                     limit: 255
    t.boolean  "no_room_move",                                                          default: false, null: false
    t.boolean  "fixed_rate"
    t.decimal  "total_amount",                                 precision: 10, scale: 2
    t.string   "guarantee_type",                 limit: 255
    t.string   "last_stay_room",                 limit: 255
    t.string   "market_segment",                 limit: 255
    t.string   "total_rooms",                    limit: 255
    t.string   "party_code",                     limit: 255
    t.string   "preferred_room_type",            limit: 255
    t.boolean  "print_rate"
    t.string   "source_code",                    limit: 255
    t.string   "travel_agent_id",                limit: 255
    t.boolean  "is_walkin"
    t.string   "external_id",                    limit: 255
    t.boolean  "lobby_status",                                                          default: false
    t.date     "original_arrival_date",                                                                 null: false
    t.date     "original_departure_date",                                                               null: false
    t.time     "checkin_time"
    t.time     "checkout_time"
    t.string   "waitlist_reason",                limit: 2000
    t.decimal  "discount_amount",                              precision: 10, scale: 2
    t.string   "discount_reason",                limit: 2000
    t.boolean  "is_posting_restricted"
    t.boolean  "is_remote_co_allowed"
    t.boolean  "is_day_use"
    t.boolean  "is_upsell_applied",                                                     default: false
    t.boolean  "is_first_time_checkin",                                                 default: true
    t.integer  "status_id",                      limit: 4,                                              null: false
    t.integer  "discount_type_id",               limit: 4
    t.boolean  "is_opted_late_checkout",                                                default: false
    t.time     "late_checkout_time"
    t.boolean  "is_rate_suppressed"
    t.string   "promotion_code",                 limit: 255
    t.date     "last_upsell_posted_date"
    t.datetime "departure_time"
    t.boolean  "is_queued",                                                             default: false
    t.datetime "last_imported"
    t.boolean  "no_post"
    t.integer  "reservation_type_id",            limit: 4
    t.integer  "source_id",                      limit: 4
    t.integer  "market_segment_id",              limit: 4
    t.integer  "booking_origin_id",              limit: 4
    t.boolean  "is_advance_bill",                                                       default: false
    t.text     "comments",                       limit: 65535
    t.boolean  "is_pre_checkin",                                                        default: false
    t.boolean  "is_hourly",                                                             default: false
    t.datetime "put_in_queue_updated_at"
    t.integer  "creator_id",                     limit: 4
    t.integer  "updator_id",                     limit: 4
    t.boolean  "is_early_checkin_purchased",                                            default: false
    t.integer  "assigned_room_id",               limit: 4
    t.integer  "assigned_group_id",              limit: 4
    t.integer  "sharer_id",                      limit: 4
    t.datetime "charges_accepted_at"
    t.integer  "segment_id",                     limit: 4
    t.boolean  "hide_rates",                                                            default: false
    t.integer  "promotion_id",                   limit: 4
    t.float    "commission_value",               limit: 24,                             default: 0.0
    t.string   "commission_type",                limit: 255
    t.integer  "commission_origin_id",           limit: 4
    t.string   "commission_origin_type",         limit: 255
    t.decimal  "early_checkin_charge",                         precision: 10, scale: 2
    t.boolean  "is_early_checkin_charge_posted",                                        default: false
    t.boolean  "on_hold",                                                               default: false
    t.boolean  "is_room_service_opted",                                                 default: true
    t.boolean  "use_mobile_key",                                                        default: false
  end

  add_index "lhma_2016_02_08_14_23_58_765_reservations", ["confirm_no"], name: "index_reservations_on_confirm_no", using: :btree
  add_index "lhma_2016_02_08_14_23_58_765_reservations", ["hotel_id", "confirm_no"], name: "index_reservations_on_hotel_id_and_confirm_no", unique: true, using: :btree
  add_index "lhma_2016_02_08_14_23_58_765_reservations", ["hotel_id", "sharer_id"], name: "index_reservations_on_hotel_id_and_sharer_id", using: :btree
  add_index "lhma_2016_02_08_14_23_58_765_reservations", ["hotel_id", "status_id", "arrival_date"], name: "index_reservations_on_hotel_id_and_status_id_and_arrival_date", using: :btree
  add_index "lhma_2016_02_08_14_23_58_765_reservations", ["hotel_id", "status_id", "dep_date"], name: "index_reservations_on_hotel_id_and_status_id_and_dep_date", using: :btree

  create_table "lhma_2016_02_16_19_06_47_821_external_references", force: :cascade do |t|
    t.string   "value",                 limit: 45,  null: false
    t.string   "description",           limit: 45,  null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "associated_id",         limit: 4,   null: false
    t.string   "associated_type",       limit: 255, null: false
    t.integer  "reference_type_id",     limit: 4,   null: false
    t.integer  "ext_interface_type_id", limit: 4
    t.boolean  "primary"
  end

  add_index "lhma_2016_02_16_19_06_47_821_external_references", ["associated_id"], name: "index_external_references_on_associated_id", using: :btree
  add_index "lhma_2016_02_16_19_06_47_821_external_references", ["associated_type"], name: "index_external_references_on_associated_type", using: :btree
  add_index "lhma_2016_02_16_19_06_47_821_external_references", ["value"], name: "index_external_references_on_value", using: :btree

  create_table "lhma_2016_04_21_19_24_49_541_credit_card_transactions", force: :cascade do |t|
    t.integer  "payment_method_id",               limit: 4
    t.integer  "credit_card_transaction_type_id", limit: 4
    t.float    "amount",                          limit: 24
    t.string   "req_reference_no",                limit: 255
    t.string   "external_transaction_ref",        limit: 255
    t.string   "authorization_code",              limit: 255
    t.integer  "currency_code_id",                limit: 4
    t.integer  "workstation_id",                  limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "status"
    t.integer  "creator_id",                      limit: 4
    t.integer  "updater_id",                      limit: 4
    t.integer  "hotel_id",                        limit: 4
    t.text     "external_print_data",             limit: 65535
    t.string   "external_failure_reason",         limit: 255
    t.string   "emv_terminal_id",                 limit: 255
    t.boolean  "is_swiped"
    t.boolean  "is_emv_pin_verified"
    t.boolean  "is_emv_authorized"
    t.string   "external_message",                limit: 255
    t.boolean  "is_dcc"
    t.string   "issue_number",                    limit: 255
    t.string   "merchant_id",                     limit: 255
    t.integer  "sequence_number",                 limit: 4
    t.integer  "source_id",                       limit: 4
    t.string   "source_type",                     limit: 255
    t.boolean  "is_batch_settled"
  end

  add_index "lhma_2016_04_21_19_24_49_541_credit_card_transactions", ["payment_method_id"], name: "index_credit_card_transactions_on_payment_method_id", using: :btree

  create_table "lhma_2016_04_29_14_31_45_072_financial_transactions", force: :cascade do |t|
    t.date     "date",                                                                              null: false
    t.decimal  "amount",                                   precision: 10, scale: 2,                 null: false
    t.integer  "charge_code_id",             limit: 4
    t.integer  "bill_id",                    limit: 4,                                              null: false
    t.datetime "created_at",                                                                        null: false
    t.datetime "updated_at",                                                                        null: false
    t.string   "external_id",                limit: 255
    t.string   "reference_number",           limit: 255
    t.integer  "currency_code_id",           limit: 4,                                              null: false
    t.integer  "article_id",                 limit: 4
    t.boolean  "is_active",                                                         default: true
    t.integer  "parent_transaction_id",      limit: 4
    t.integer  "credit_card_transaction_id", limit: 4
    t.integer  "creator_id",                 limit: 4
    t.integer  "updater_id",                 limit: 4
    t.time     "time"
    t.string   "transaction_type",           limit: 255
    t.boolean  "is_eod_transaction",                                                default: false
    t.text     "comments",                   limit: 65535
    t.integer  "original_transaction_id",    limit: 4
    t.integer  "cashier_period_id",          limit: 4
    t.string   "reference_text",             limit: 255
    t.integer  "addon_id",                   limit: 4
    t.integer  "inclusive_parent_id",        limit: 4
    t.boolean  "is_pre_stay",                                                       default: false
    t.date     "checkin_date"
  end

  add_index "lhma_2016_04_29_14_31_45_072_financial_transactions", ["bill_id"], name: "index_financial_transactions_on_bill_id", using: :btree
  add_index "lhma_2016_04_29_14_31_45_072_financial_transactions", ["charge_code_id", "date"], name: "idx_financial_trans_charge_code_date", using: :btree
  add_index "lhma_2016_04_29_14_31_45_072_financial_transactions", ["inclusive_parent_id"], name: "index_financial_transactions_on_inclusive_parent_id", using: :btree
  add_index "lhma_2016_04_29_14_31_45_072_financial_transactions", ["original_transaction_id"], name: "index_financial_transactions_on_original_transaction_id", using: :btree
  add_index "lhma_2016_04_29_14_31_45_072_financial_transactions", ["parent_transaction_id"], name: "index_financial_transactions_on_parent_transaction_id", using: :btree
  add_index "lhma_2016_04_29_14_31_45_072_financial_transactions", ["updater_id"], name: "index_financial_transactions_on_updater_id", using: :btree

  create_table "lhma_2016_06_06_12_33_01_409_financial_transactions", force: :cascade do |t|
    t.date     "date",                                                                              null: false
    t.decimal  "amount",                                   precision: 10, scale: 2,                 null: false
    t.integer  "charge_code_id",             limit: 4
    t.integer  "bill_id",                    limit: 4,                                              null: false
    t.datetime "created_at",                                                                        null: false
    t.datetime "updated_at",                                                                        null: false
    t.string   "external_id",                limit: 255
    t.string   "reference_number",           limit: 255
    t.integer  "currency_code_id",           limit: 4,                                              null: false
    t.integer  "article_id",                 limit: 4
    t.boolean  "is_active",                                                         default: true
    t.integer  "parent_transaction_id",      limit: 4
    t.integer  "credit_card_transaction_id", limit: 4
    t.integer  "creator_id",                 limit: 4
    t.integer  "updater_id",                 limit: 4
    t.datetime "time"
    t.string   "transaction_type",           limit: 255
    t.boolean  "is_eod_transaction",                                                default: false
    t.text     "comments",                   limit: 65535
    t.integer  "original_transaction_id",    limit: 4
    t.integer  "cashier_period_id",          limit: 4
    t.string   "reference_text",             limit: 255
    t.integer  "addon_id",                   limit: 4
    t.integer  "inclusive_parent_id",        limit: 4
    t.boolean  "is_pre_stay",                                                       default: false
    t.date     "checkin_date"
  end

  add_index "lhma_2016_06_06_12_33_01_409_financial_transactions", ["bill_id"], name: "index_financial_transactions_on_bill_id", using: :btree
  add_index "lhma_2016_06_06_12_33_01_409_financial_transactions", ["charge_code_id", "date"], name: "idx_financial_trans_charge_code_date", using: :btree
  add_index "lhma_2016_06_06_12_33_01_409_financial_transactions", ["inclusive_parent_id"], name: "index_financial_transactions_on_inclusive_parent_id", using: :btree
  add_index "lhma_2016_06_06_12_33_01_409_financial_transactions", ["original_transaction_id"], name: "index_financial_transactions_on_original_transaction_id", using: :btree
  add_index "lhma_2016_06_06_12_33_01_409_financial_transactions", ["parent_transaction_id"], name: "index_financial_transactions_on_parent_transaction_id", using: :btree
  add_index "lhma_2016_06_06_12_33_01_409_financial_transactions", ["updater_id"], name: "index_financial_transactions_on_updater_id", using: :btree

  create_table "lhma_2016_06_30_14_17_23_041_financial_transactions", force: :cascade do |t|
    t.date     "date",                                                                              null: false
    t.decimal  "amount",                                   precision: 10, scale: 2,                 null: false
    t.integer  "charge_code_id",             limit: 4
    t.integer  "bill_id",                    limit: 4,                                              null: false
    t.datetime "created_at",                                                                        null: false
    t.datetime "updated_at",                                                                        null: false
    t.string   "external_id",                limit: 255
    t.string   "reference_number",           limit: 255
    t.integer  "currency_code_id",           limit: 4,                                              null: false
    t.integer  "article_id",                 limit: 4
    t.boolean  "is_active",                                                         default: true
    t.integer  "parent_transaction_id",      limit: 4
    t.integer  "credit_card_transaction_id", limit: 4
    t.integer  "creator_id",                 limit: 4
    t.integer  "updater_id",                 limit: 4
    t.datetime "time"
    t.string   "transaction_type",           limit: 255
    t.boolean  "is_eod_transaction",                                                default: false
    t.text     "comments",                   limit: 65535
    t.integer  "original_transaction_id",    limit: 4
    t.integer  "cashier_period_id",          limit: 4
    t.string   "reference_text",             limit: 255
    t.integer  "addon_id",                   limit: 4
    t.integer  "inclusive_parent_id",        limit: 4
    t.boolean  "is_pre_stay",                                                       default: false
    t.date     "checkin_date"
  end

  add_index "lhma_2016_06_30_14_17_23_041_financial_transactions", ["bill_id"], name: "index_financial_transactions_on_bill_id", using: :btree
  add_index "lhma_2016_06_30_14_17_23_041_financial_transactions", ["charge_code_id", "checkin_date"], name: "index_financial_transactions_on_charge_code_id_and_checkin_date", using: :btree
  add_index "lhma_2016_06_30_14_17_23_041_financial_transactions", ["charge_code_id", "date"], name: "idx_financial_trans_charge_code_date", using: :btree
  add_index "lhma_2016_06_30_14_17_23_041_financial_transactions", ["inclusive_parent_id"], name: "index_financial_transactions_on_inclusive_parent_id", using: :btree
  add_index "lhma_2016_06_30_14_17_23_041_financial_transactions", ["original_transaction_id"], name: "index_financial_transactions_on_original_transaction_id", using: :btree
  add_index "lhma_2016_06_30_14_17_23_041_financial_transactions", ["parent_transaction_id"], name: "index_financial_transactions_on_parent_transaction_id", using: :btree
  add_index "lhma_2016_06_30_14_17_23_041_financial_transactions", ["updater_id"], name: "index_financial_transactions_on_updater_id", using: :btree

  create_table "lhma_2016_06_30_14_17_36_068_reservation_daily_instances", force: :cascade do |t|
    t.integer  "reservation_id",        limit: 4,                                       null: false
    t.date     "reservation_date",                                                      null: false
    t.integer  "room_type_id",          limit: 4,                                       null: false
    t.integer  "original_room_type_id", limit: 4
    t.decimal  "rate_amount",                      precision: 10, scale: 2
    t.integer  "rate_id",               limit: 4
    t.decimal  "original_rate_amount",             precision: 10, scale: 2
    t.string   "market_segment",        limit: 20
    t.integer  "adults",                limit: 4,                           default: 1, null: false
    t.integer  "children",              limit: 4
    t.integer  "children1",             limit: 4
    t.integer  "children2",             limit: 4
    t.integer  "children3",             limit: 4
    t.integer  "children4",             limit: 4
    t.integer  "children5",             limit: 4
    t.integer  "children6",             limit: 4
    t.integer  "cribs",                 limit: 4
    t.integer  "extra_beds",            limit: 4
    t.string   "turndown_status",       limit: 10
    t.boolean  "is_due_out"
    t.integer  "block_id",              limit: 4
    t.integer  "group_id",              limit: 4
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.integer  "room_id",               limit: 4
    t.integer  "currency_code_id",      limit: 4
    t.integer  "status_id",             limit: 4,                                       null: false
    t.integer  "infants",               limit: 4
  end

  add_index "lhma_2016_06_30_14_17_36_068_reservation_daily_instances", ["group_id"], name: "index_reservation_daily_instances_on_group_id", using: :btree
  add_index "lhma_2016_06_30_14_17_36_068_reservation_daily_instances", ["reservation_id", "reservation_date"], name: "index_res_daily_instances_on_res_id_and_res_date", unique: true, using: :btree
  add_index "lhma_2016_06_30_14_17_36_068_reservation_daily_instances", ["room_id"], name: "index_reservation_daily_instances_on_room_id", using: :btree

  create_table "lhma_2016_07_20_12_45_49_354_reservations", force: :cascade do |t|
    t.string   "confirm_no",                     limit: 255,                                            null: false
    t.date     "arrival_date",                                                                          null: false
    t.date     "dep_date",                                                                              null: false
    t.integer  "hotel_id",                       limit: 4,                                              null: false
    t.datetime "created_at",                                                                            null: false
    t.datetime "updated_at",                                                                            null: false
    t.decimal  "upsell_amount",                                precision: 10, scale: 2
    t.datetime "arrival_time"
    t.string   "cancellation_no",                limit: 255
    t.date     "cancel_date"
    t.string   "cancel_reason",                  limit: 255
    t.string   "company_id",                     limit: 255
    t.boolean  "no_room_move",                                                          default: false, null: false
    t.boolean  "fixed_rate"
    t.decimal  "total_amount",                                 precision: 10, scale: 2
    t.string   "guarantee_type",                 limit: 255
    t.string   "last_stay_room",                 limit: 255
    t.string   "market_segment",                 limit: 255
    t.string   "total_rooms",                    limit: 255
    t.string   "party_code",                     limit: 255
    t.string   "preferred_room_type",            limit: 255
    t.boolean  "print_rate"
    t.string   "source_code",                    limit: 255
    t.string   "travel_agent_id",                limit: 255
    t.boolean  "is_walkin"
    t.string   "external_id",                    limit: 255
    t.boolean  "lobby_status",                                                          default: false
    t.date     "original_arrival_date",                                                                 null: false
    t.date     "original_departure_date",                                                               null: false
    t.time     "checkin_time"
    t.time     "checkout_time"
    t.string   "waitlist_reason",                limit: 2000
    t.decimal  "discount_amount",                              precision: 10, scale: 2
    t.string   "discount_reason",                limit: 2000
    t.boolean  "is_posting_restricted"
    t.boolean  "is_remote_co_allowed"
    t.boolean  "is_day_use"
    t.boolean  "is_upsell_applied",                                                     default: false
    t.boolean  "is_first_time_checkin",                                                 default: true
    t.integer  "status_id",                      limit: 4,                                              null: false
    t.integer  "discount_type_id",               limit: 4
    t.boolean  "is_opted_late_checkout",                                                default: false
    t.time     "late_checkout_time"
    t.boolean  "is_rate_suppressed"
    t.string   "promotion_code",                 limit: 255
    t.date     "last_upsell_posted_date"
    t.datetime "departure_time"
    t.boolean  "is_queued",                                                             default: false
    t.datetime "last_imported"
    t.boolean  "no_post"
    t.integer  "reservation_type_id",            limit: 4
    t.integer  "source_id",                      limit: 4
    t.integer  "market_segment_id",              limit: 4
    t.integer  "booking_origin_id",              limit: 4
    t.boolean  "is_advance_bill",                                                       default: false
    t.text     "comments",                       limit: 65535
    t.boolean  "is_pre_checkin",                                                        default: false
    t.boolean  "is_hourly",                                                             default: false
    t.datetime "put_in_queue_updated_at"
    t.integer  "creator_id",                     limit: 4
    t.integer  "updator_id",                     limit: 4
    t.boolean  "is_early_checkin_purchased",                                            default: false
    t.integer  "assigned_room_id",               limit: 4
    t.integer  "assigned_group_id",              limit: 4
    t.integer  "sharer_id",                      limit: 4
    t.datetime "charges_accepted_at"
    t.integer  "segment_id",                     limit: 4
    t.boolean  "hide_rates",                                                            default: false
    t.integer  "promotion_id",                   limit: 4
    t.float    "commission_value",               limit: 24,                             default: 0.0
    t.string   "commission_type",                limit: 255
    t.integer  "commission_origin_id",           limit: 4
    t.string   "commission_origin_type",         limit: 255
    t.decimal  "early_checkin_charge",                         precision: 10, scale: 2
    t.boolean  "is_early_checkin_charge_posted",                                        default: false
    t.boolean  "on_hold",                                                               default: false
    t.boolean  "is_room_service_opted",                                                 default: true
    t.boolean  "use_mobile_key",                                                        default: false
    t.boolean  "has_any_open_bill",                                                     default: false
  end

  add_index "lhma_2016_07_20_12_45_49_354_reservations", ["confirm_no"], name: "index_reservations_on_confirm_no", using: :btree
  add_index "lhma_2016_07_20_12_45_49_354_reservations", ["hotel_id", "confirm_no"], name: "index_reservations_on_hotel_id_and_confirm_no", unique: true, using: :btree
  add_index "lhma_2016_07_20_12_45_49_354_reservations", ["hotel_id", "sharer_id"], name: "index_reservations_on_hotel_id_and_sharer_id", using: :btree
  add_index "lhma_2016_07_20_12_45_49_354_reservations", ["hotel_id", "status_id", "arrival_date"], name: "index_reservations_on_hotel_id_and_status_id_and_arrival_date", using: :btree
  add_index "lhma_2016_07_20_12_45_49_354_reservations", ["hotel_id", "status_id", "dep_date"], name: "index_reservations_on_hotel_id_and_status_id_and_dep_date", using: :btree
  add_index "lhma_2016_07_20_12_45_49_354_reservations", ["hotel_id", "status_id", "has_any_open_bill"], name: "index_reservations_on_hotel_id_status_id_and_has_any_open_bill", using: :btree

  create_table "lhma_2016_08_08_17_03_39_663_financial_transactions", force: :cascade do |t|
    t.date     "date",                                                                              null: false
    t.decimal  "amount",                                   precision: 10, scale: 2,                 null: false
    t.integer  "charge_code_id",             limit: 4
    t.integer  "bill_id",                    limit: 4,                                              null: false
    t.datetime "created_at",                                                                        null: false
    t.datetime "updated_at",                                                                        null: false
    t.string   "external_id",                limit: 255
    t.string   "reference_number",           limit: 255
    t.integer  "currency_code_id",           limit: 4,                                              null: false
    t.integer  "article_id",                 limit: 4
    t.boolean  "is_active",                                                         default: true
    t.integer  "parent_transaction_id",      limit: 4
    t.integer  "credit_card_transaction_id", limit: 4
    t.integer  "creator_id",                 limit: 4
    t.integer  "updater_id",                 limit: 4
    t.datetime "time"
    t.string   "transaction_type",           limit: 255
    t.boolean  "is_eod_transaction",                                                default: false
    t.text     "comments",                   limit: 65535
    t.integer  "original_transaction_id",    limit: 4
    t.integer  "cashier_period_id",          limit: 4
    t.string   "reference_text",             limit: 255
    t.integer  "addon_id",                   limit: 4
    t.integer  "inclusive_parent_id",        limit: 4
    t.boolean  "is_pre_stay",                                                       default: false
    t.date     "checkin_date"
  end

  add_index "lhma_2016_08_08_17_03_39_663_financial_transactions", ["bill_id"], name: "index_financial_transactions_on_bill_id", using: :btree
  add_index "lhma_2016_08_08_17_03_39_663_financial_transactions", ["charge_code_id", "checkin_date"], name: "index_financial_transactions_on_charge_code_id_and_checkin_date", using: :btree
  add_index "lhma_2016_08_08_17_03_39_663_financial_transactions", ["charge_code_id", "date"], name: "idx_financial_trans_charge_code_date", using: :btree
  add_index "lhma_2016_08_08_17_03_39_663_financial_transactions", ["credit_card_transaction_id"], name: "index_financial_transactions_on_credit_card_transaction_id", using: :btree
  add_index "lhma_2016_08_08_17_03_39_663_financial_transactions", ["inclusive_parent_id"], name: "index_financial_transactions_on_inclusive_parent_id", using: :btree
  add_index "lhma_2016_08_08_17_03_39_663_financial_transactions", ["original_transaction_id"], name: "index_financial_transactions_on_original_transaction_id", using: :btree
  add_index "lhma_2016_08_08_17_03_39_663_financial_transactions", ["parent_transaction_id"], name: "index_financial_transactions_on_parent_transaction_id", using: :btree
  add_index "lhma_2016_08_08_17_03_39_663_financial_transactions", ["updater_id"], name: "index_financial_transactions_on_updater_id", using: :btree

  create_table "locale_translations", force: :cascade do |t|
    t.integer  "locale_id",  limit: 4
    t.string   "locale",     limit: 255,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "value",      limit: 65535
  end

  add_index "locale_translations", ["locale"], name: "index_locale_translations_on_locale", using: :btree
  add_index "locale_translations", ["locale_id"], name: "index_locale_translations_on_locale_id", using: :btree

  create_table "locales", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.integer  "hotel_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "locales", ["hotel_id"], name: "index_locales_on_hotel_id", using: :btree

  create_table "maintenance_reasons", force: :cascade do |t|
    t.integer  "hotel_id",           limit: 4
    t.string   "maintenance_reason", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "code",               limit: 255
  end

  create_table "market_segments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "hotel_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "is_active"
  end

  create_table "membership_levels", force: :cascade do |t|
    t.string  "membership_level",   limit: 40, null: false
    t.boolean "is_inactive"
    t.string  "description",        limit: 80
    t.integer "membership_type_id", limit: 4,  null: false
  end

  add_index "membership_levels", ["membership_level", "membership_type_id"], name: "index_membership_levels_uniq", unique: true, using: :btree

  create_table "membership_types", force: :cascade do |t|
    t.string   "value",               limit: 255,                 null: false
    t.integer  "membership_class_id", limit: 4,                   null: false
    t.integer  "property_id",         limit: 4
    t.string   "property_type",       limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "description",         limit: 255,                 null: false
    t.boolean  "auto_enroll",                     default: false, null: false
  end

  add_index "membership_types", ["property_id", "property_type", "value"], name: "idx_membership_types_prop_value", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "message",      limit: 255
    t.integer  "sender_id",    limit: 4
    t.integer  "reciever_id",  limit: 4
    t.integer  "archive",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "message_copy", limit: 255
  end

  create_table "messages_recipients", force: :cascade do |t|
    t.integer "message_id",   limit: 4
    t.integer "recipient_id", limit: 4
    t.boolean "is_read",                default: false
    t.boolean "is_pushed"
  end

  create_table "neighbourhoods", id: false, force: :cascade do |t|
    t.integer "beacon_id",    limit: 4, null: false
    t.integer "neighbour_id", limit: 4, null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "content",     limit: 255
    t.datetime "schedule_at"
    t.string   "sent_to",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "associated_id",           limit: 4,                    null: false
    t.string   "description",             limit: 2000,                 null: false
    t.integer  "creator_id",              limit: 4
    t.integer  "updater_id",              limit: 4
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "note_type_id",            limit: 4,                    null: false
    t.string   "external_id",             limit: 255
    t.boolean  "is_guest_viewable"
    t.boolean  "is_from_external_system"
    t.string   "associated_type",         limit: 255
    t.boolean  "is_from_rate_adjustment",              default: false
  end

  add_index "notes", ["associated_id"], name: "index_reservation_notes_on_reservation_id", using: :btree

  create_table "notification_details", force: :cascade do |t|
    t.integer  "notification_id",      limit: 4,   null: false
    t.string   "notification_type",    limit: 255, null: false
    t.string   "message",              limit: 255, null: false
    t.string   "additional_data",      limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "notification_section", limit: 255, null: false
  end

  create_table "notification_device_details", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.string   "unique_id",          limit: 255,                   null: false
    t.string   "registration_id",    limit: 255
    t.string   "device_type",        limit: 255,                   null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "device_version",     limit: 255
    t.string   "app_version",        limit: 255, default: "1.0.1"
    t.integer  "application_id",     limit: 4,   default: 3
    t.boolean  "is_logging_enabled",             default: false
    t.datetime "logging_start_time"
    t.datetime "logging_end_time"
    t.string   "device_name",        limit: 255
  end

  add_index "notification_device_details", ["unique_id"], name: "index_notification_device_details_on_unique_id", unique: true, using: :btree

  create_table "occupancy_targets", force: :cascade do |t|
    t.integer  "hotel_id",   limit: 4, null: false
    t.date     "date",                 null: false
    t.integer  "target",     limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
  end

  create_table "ota_configs", force: :cascade do |t|
    t.integer  "hotel_ext_interface_id", limit: 4
    t.string   "username",               limit: 255
    t.integer  "payment_type_id",        limit: 4
    t.integer  "booking_origin_id",      limit: 4
    t.datetime "full_refresh_at"
    t.string   "access_url",             limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "hotel_code",             limit: 255
    t.string   "encrypted_password",     limit: 255
    t.string   "customer_name",          limit: 255
    t.string   "property_name",          limit: 255
    t.integer  "rate_id",                limit: 4
  end

  add_index "ota_configs", ["hotel_ext_interface_id"], name: "index_ota_configs_on_hotel_ext_interface_id", using: :btree

  create_table "ota_messages", force: :cascade do |t|
    t.string   "message_type",           limit: 255
    t.datetime "processed_at"
    t.string   "response",               limit: 255
    t.text     "payload",                limit: 16777215
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "hotel_ext_interface_id", limit: 4
    t.integer  "status",                 limit: 4
    t.string   "message_id",             limit: 255
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "mli_token",           limit: 255
    t.string   "card_expiry",         limit: 255
    t.string   "card_cvv",            limit: 20
    t.string   "card_name",           limit: 255
    t.string   "bank_routing_no",     limit: 80
    t.string   "account_no",          limit: 80
    t.boolean  "is_primary"
    t.string   "external_id",         limit: 80
    t.integer  "payment_type_id",     limit: 4,   null: false
    t.integer  "credit_card_type_id", limit: 4
    t.integer  "creator_id",          limit: 4
    t.integer  "updater_id",          limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "mli_transaction_id",  limit: 255
    t.boolean  "is_swiped"
    t.integer  "associated_id",       limit: 4
    t.string   "associated_type",     limit: 255
    t.integer  "bill_number",         limit: 4
    t.string   "masked_card_number",  limit: 5
  end

  add_index "payment_methods", ["associated_id", "associated_type"], name: "index_payment_methods_on_associated_id_and_associated_type", using: :btree
  add_index "payment_methods", ["mli_token"], name: "index_guest_payment_types_on_mli_token", using: :btree

  create_table "payment_types", force: :cascade do |t|
    t.string   "value",         limit: 255,                null: false
    t.string   "description",   limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "is_selectable",             default: true, null: false
    t.integer  "hotel_id",      limit: 4
  end

  add_index "payment_types", ["hotel_id", "value"], name: "index_payment_types_on_hotel_id_and_value", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.string   "name",            limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "code",            limit: 255
    t.string   "permission_type", limit: 255
  end

  create_table "posting_accounts", force: :cascade do |t|
    t.integer  "posting_account_status_id", limit: 4
    t.integer  "posting_account_type_id",   limit: 4
    t.string   "posting_account_name",      limit: 255
    t.string   "posting_account_number",    limit: 255
    t.integer  "hotel_id",                  limit: 4
    t.integer  "market_segment_id",         limit: 4
    t.integer  "source_id",                 limit: 4
    t.integer  "booking_origin_id",         limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "travel_agent_id",           limit: 4
    t.integer  "company_id",                limit: 4
  end

  add_index "posting_accounts", ["hotel_id"], name: "index_posting_accounts_on_hotel_id", using: :btree
  add_index "posting_accounts", ["posting_account_status_id"], name: "index_posting_accounts_on_posting_account_status_id", using: :btree

  create_table "pre_checkin_excluded_block_codes", force: :cascade do |t|
    t.integer  "hotel_id",   limit: 4, null: false
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "pre_checkin_excluded_rate_codes", force: :cascade do |t|
    t.integer  "hotel_id",   limit: 4, null: false
    t.integer  "rate_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "pre_reservations", force: :cascade do |t|
    t.integer  "room_id",    limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "from_time",            null: false
    t.datetime "to_time",              null: false
    t.integer  "rate_id",    limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printer_templates", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "template",      limit: 65535, null: false
    t.integer  "hotel_id",      limit: 4,     null: false
    t.string   "template_type", limit: 255,   null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "description",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_active"
    t.integer  "hotel_id",       limit: 4,   null: false
    t.integer  "image_id",       limit: 4
    t.date     "from_date"
    t.date     "to_date"
    t.string   "category",       limit: 255, null: false
    t.string   "discount_type",  limit: 255
    t.float    "discount_value", limit: 24
  end

  create_table "promotions_rates", force: :cascade do |t|
    t.integer  "rate_id",      limit: 4,                null: false
    t.integer  "promotion_id", limit: 4,                null: false
    t.boolean  "is_linked",              default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "rate_adjustments", force: :cascade do |t|
    t.integer  "reservation_daily_instance_id", limit: 4,   null: false
    t.float    "old_value",                     limit: 24
    t.float    "new_value",                     limit: 24
    t.string   "reason",                        limit: 255
    t.integer  "user_id",                       limit: 4
    t.integer  "hotel_id",                      limit: 4,   null: false
    t.date     "created_on",                                null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "rate_channels", force: :cascade do |t|
    t.integer  "hotel_id",                  limit: 4,                  null: false
    t.integer  "rate_id",                   limit: 4,                  null: false
    t.integer  "ref_ext_interface_type_id", limit: 4,                  null: false
    t.boolean  "active",                                default: true, null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "rate_status",               limit: 255
  end

  add_index "rate_channels", ["active"], name: "index_rate_channels_on_active", using: :btree
  add_index "rate_channels", ["hotel_id", "ref_ext_interface_type_id"], name: "index_rate_ext_interfaces_on_hotel_ext_interface", using: :btree
  add_index "rate_channels", ["rate_id", "ref_ext_interface_type_id"], name: "index_rate_ext_interfaces_on_rate_ext_interface", unique: true, using: :btree

  create_table "rate_channels_room_types", force: :cascade do |t|
    t.integer "rate_channel_id", limit: 4, null: false
    t.integer "room_type_id",    limit: 4, null: false
  end

  add_index "rate_channels_room_types", ["rate_channel_id", "room_type_id"], name: "index_rate_channels_room_types", unique: true, using: :btree

  create_table "rate_commission_charge_codes", force: :cascade do |t|
    t.integer  "rate_id",        limit: 4
    t.integer  "charge_code_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "rate_commission_charge_codes", ["charge_code_id"], name: "index_rate_commission_charge_codes_on_charge_code_id", using: :btree
  add_index "rate_commission_charge_codes", ["rate_id"], name: "index_rate_commission_charge_codes_on_rate_id", using: :btree

  create_table "rate_date_ranges", force: :cascade do |t|
    t.integer  "rate_id",    limit: 4
    t.date     "begin_date",           null: false
    t.date     "end_date",             null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
  end

  add_index "rate_date_ranges", ["rate_id", "begin_date", "end_date"], name: "index_rate_date_ranges", using: :btree

  create_table "rate_details", force: :cascade do |t|
    t.integer  "hotel_id",                    limit: 4,                  null: false
    t.integer  "rate_id",                     limit: 4,                  null: false
    t.integer  "room_type_id",                limit: 4,                  null: false
    t.date     "date",                                                   null: false
    t.integer  "room_rate_id",                limit: 4,                  null: false
    t.integer  "rate_set_id",                 limit: 4,                  null: false
    t.integer  "rate_date_range_id",          limit: 4,                  null: false
    t.float    "single_amount",               limit: 24
    t.float    "double_amount",               limit: 24
    t.float    "extra_adult_amount",          limit: 24
    t.float    "child_amount",                limit: 24
    t.boolean  "single_overridden",                      default: false, null: false
    t.boolean  "double_overridden",                      default: false, null: false
    t.boolean  "extra_adult_overridden",                 default: false, null: false
    t.boolean  "child_overridden",                       default: false, null: false
    t.boolean  "closed",                                 default: false, null: false
    t.boolean  "closed_arrival",                         default: false, null: false
    t.boolean  "closed_departure",                       default: false, null: false
    t.integer  "min_stay_through",            limit: 4
    t.integer  "min_length_of_stay",          limit: 4
    t.integer  "max_length_of_stay",          limit: 4
    t.integer  "min_advanced_booking",        limit: 4
    t.integer  "max_advanced_booking",        limit: 4
    t.boolean  "min_length_of_stay_locked",              default: false, null: false
    t.boolean  "max_length_of_stay_locked",              default: false, null: false
    t.boolean  "min_advanced_booking_locked",            default: false, null: false
    t.boolean  "max_advanced_booking_locked",            default: false, null: false
    t.boolean  "is_child_rate",                          default: false, null: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "rate_details", ["hotel_id", "date"], name: "index_rate_details_on_hotel_id_and_date", using: :btree
  add_index "rate_details", ["hotel_id", "rate_id", "room_type_id", "date"], name: "rate_details_uniq", unique: true, using: :btree
  add_index "rate_details", ["hotel_id", "room_type_id"], name: "index_rate_details_on_hotel_id_and_room_type_id", using: :btree
  add_index "rate_details", ["hotel_id", "single_amount"], name: "index_rate_details_on_hotel_id_and_single_amount", using: :btree
  add_index "rate_details", ["rate_date_range_id"], name: "index_rate_details_on_rate_date_range_id", using: :btree
  add_index "rate_details", ["rate_id", "single_amount"], name: "index_rate_details_on_rate_id_and_single_amount", using: :btree
  add_index "rate_details", ["rate_id"], name: "index_rate_details_on_rate_id", using: :btree
  add_index "rate_details", ["rate_set_id"], name: "index_rate_details_on_rate_set_id", using: :btree
  add_index "rate_details", ["room_rate_id"], name: "index_rate_details_on_room_rate_id", using: :btree

  create_table "rate_restrictions", force: :cascade do |t|
    t.integer  "hotel_id",   limit: 4, null: false
    t.integer  "rate_id",    limit: 4, null: false
    t.integer  "type_id",    limit: 4, null: false
    t.integer  "days",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
  end

  add_index "rate_restrictions", ["rate_id"], name: "index_rate_restrictions_on_rate_id", using: :btree

  create_table "rate_sets", force: :cascade do |t|
    t.integer  "rate_date_range_id",          limit: 4,                   null: false
    t.string   "name",                        limit: 255,                 null: false
    t.boolean  "sunday",                                  default: false, null: false
    t.boolean  "monday",                                  default: false, null: false
    t.boolean  "tuesday",                                 default: false, null: false
    t.boolean  "wednesday",                               default: false, null: false
    t.boolean  "thursday",                                default: false, null: false
    t.boolean  "friday",                                  default: false, null: false
    t.boolean  "saturday",                                default: false, null: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "creator_id",                  limit: 4
    t.integer  "updater_id",                  limit: 4
    t.integer  "day_min_hours",               limit: 4
    t.integer  "day_max_hours",               limit: 4
    t.datetime "day_checkout_cut_off_time"
    t.datetime "night_start_time"
    t.datetime "night_end_time"
    t.datetime "night_checkout_cut_off_time"
  end

  add_index "rate_sets", ["rate_date_range_id", "name"], name: "index_rate_sets_uniq", unique: true, using: :btree

  create_table "rate_tasks", force: :cascade do |t|
    t.integer  "rate_id",    limit: 4
    t.integer  "task_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "rate_types", force: :cascade do |t|
    t.string   "name",              limit: 255,                 null: false
    t.integer  "hotel_id",          limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "classification_id", limit: 4
    t.boolean  "is_active",                     default: false
  end

  add_index "rate_types", ["classification_id"], name: "index_rate_types_on_classification_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "hotel_id",                    limit: 4,                                              null: false
    t.text     "rate_desc",                   limit: 65535
    t.date     "begin_date"
    t.date     "end_date"
    t.date     "sell_begin_date"
    t.date     "sell_end_date"
    t.string   "market_code",                 limit: 20
    t.integer  "external_id",                 limit: 4
    t.integer  "creator_id",                  limit: 4
    t.integer  "updater_id",                  limit: 4
    t.datetime "created_at",                                                                         null: false
    t.datetime "updated_at",                                                                         null: false
    t.string   "rate_name",                   limit: 255,                                            null: false
    t.integer  "currency_code_id",            limit: 4
    t.integer  "rate_type_id",                limit: 4
    t.string   "rate_code",                   limit: 255
    t.integer  "based_on_rate_id",            limit: 4
    t.string   "based_on_type",               limit: 255
    t.decimal  "based_on_value",                            precision: 10, scale: 2
    t.boolean  "is_active",                                                          default: true,  null: false
    t.string   "promotion_code",              limit: 255
    t.integer  "charge_code_id",              limit: 4
    t.integer  "market_segment_id",           limit: 4
    t.integer  "source_id",                   limit: 4
    t.boolean  "is_commission_on",                                                   default: false
    t.boolean  "is_suppress_rate_on",                                                default: false
    t.boolean  "is_discount_allowed_on",                                             default: false
    t.integer  "deposit_policy_id",           limit: 4
    t.integer  "cancellation_policy_id",      limit: 4
    t.boolean  "use_rate_levels",                                                    default: false
    t.integer  "account_id",                  limit: 4
    t.boolean  "is_fixed_rate",                                                      default: false, null: false
    t.boolean  "is_rate_shown_on_guest_bill",                                        default: false, null: false
    t.boolean  "is_hourly_rate",                                                     default: false
    t.boolean  "is_member",                                                          default: false, null: false
    t.string   "commission_value",            limit: 255,                            default: "0.0", null: false
    t.string   "commission_type",             limit: 255
    t.boolean  "is_pms_only",                                                        default: false
    t.boolean  "is_channel_only",                                                    default: false
    t.boolean  "is_prepaid_commission_on",                                           default: false
    t.integer  "commission_post_type_id",     limit: 4
    t.integer  "task_id",                     limit: 4
    t.integer  "booking_origin_id",           limit: 4
    t.boolean  "is_copied",                                                          default: false
  end

  add_index "rates", ["hotel_id", "rate_code"], name: "index_rates_on_hotel_id_and_rate_code", using: :btree
  add_index "rates", ["hotel_id"], name: "index_rates_on_hotel_id", using: :btree

  create_table "rates_addons", force: :cascade do |t|
    t.integer "rate_id",              limit: 4,                null: false
    t.integer "addon_id",             limit: 4,                null: false
    t.boolean "is_inclusive_in_rate",           default: true, null: false
  end

  add_index "rates_addons", ["rate_id", "addon_id"], name: "index_rates_addons_on_rate_id_and_addon_id", unique: true, using: :btree

  create_table "rates_room_types", force: :cascade do |t|
    t.integer "rate_id",      limit: 4, null: false
    t.integer "room_type_id", limit: 4, null: false
  end

  add_index "rates_room_types", ["rate_id", "room_type_id"], name: "index_rates_room_types_on_rate_id_and_room_type_id", unique: true, using: :btree

  create_table "ref_account_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_action_task_types", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_action_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_activity_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_addons", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_amount_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_analytics_services", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "creator_id",  limit: 4
    t.integer  "updater_id",  limit: 4
  end

  create_table "ref_applications", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_beacon_ranges", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_beacon_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_calculation_rules", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_campaign_audience_types", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_campaign_types", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_cancel_codes", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_charge_code_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_commission_paid_statuses", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_contact_labels", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_contact_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_credit_card_transaction_types", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_credit_card_types", force: :cascade do |t|
    t.string   "value",          limit: 255, null: false
    t.string   "description",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "validator_code", limit: 255
  end

  create_table "ref_currency_codes", force: :cascade do |t|
    t.string "value",       limit: 255, null: false
    t.string "description", limit: 255
    t.string "symbol",      limit: 255, null: false
  end

  create_table "ref_custom_cc_processors", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_dashboards", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_date_formats", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_discount_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_eod_processes", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "method",          limit: 255
    t.string   "arguments",       limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "sequence_number", limit: 4
  end

  create_table "ref_eod_statuses", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ref_error_types", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ref_export_delivery_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_export_formats", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_export_frequencies", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_export_report_fields", force: :cascade do |t|
    t.integer  "report_id",   limit: 4,   null: false
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_export_reports", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_export_time_periods", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_ext_interface_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_external_reference_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_front_office_statuses", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_government_id_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "value",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_guest_web_url_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "value",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_hotel_message_keys", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_housekeeping_statuses", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_interface_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "creator_id",  limit: 4
    t.integer  "updater_id",  limit: 4
  end

  create_table "ref_key_card_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_key_systems", force: :cascade do |t|
    t.string   "value",            limit: 255,                 null: false
    t.string   "description",      limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "key_card_type_id", limit: 4
    t.boolean  "retrieve_uid",                 default: false, null: false
    t.string   "aid",              limit: 255
    t.string   "keyb",             limit: 255
    t.boolean  "encoder_enabled",              default: false, null: false
    t.string   "private_key",      limit: 255
  end

  create_table "ref_languages", force: :cascade do |t|
    t.string   "value",        limit: 255,                null: false
    t.string   "description",  limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "translatable",             default: true
  end

  create_table "ref_membership_classes", force: :cascade do |t|
    t.string   "value",          limit: 255, null: false
    t.string   "description",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_system_only"
  end

  create_table "ref_note_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_pms_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_policy_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_post_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "frequency",   limit: 4
  end

  create_table "ref_posting_account_statuses", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_posting_account_types", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_posting_rythms", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_printer_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_rate_classifications", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_report_filters", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_report_groupable_fields", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_report_sortable_fields", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_reservation_hk_statuses", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_reservation_status_translations", force: :cascade do |t|
    t.integer  "reservation_status_id", limit: 4
    t.string   "locale",                limit: 255, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "description",           limit: 255
  end

  add_index "ref_reservation_status_translations", ["locale"], name: "index_ref_reservation_status_translations_on_locale", using: :btree
  add_index "ref_reservation_status_translations", ["reservation_status_id"], name: "index_3222b6be4ddd4ff11bb49e79e7db8d7b9e2a9f88", using: :btree

  create_table "ref_reservation_statuses", force: :cascade do |t|
    t.string   "value",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ref_reservation_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_restriction_types", force: :cascade do |t|
    t.string   "value",       limit: 255,                 null: false
    t.string   "description", limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "editable",                default: false, null: false
  end

  create_table "ref_review_categories", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  create_table "ref_screen_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_service_statuses", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_sms_keyword_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_sorting_preferences", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_survey_question_types", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_titles", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_translatable_entities", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_translatable_entity_items", force: :cascade do |t|
    t.string   "value",                  limit: 255, null: false
    t.string   "description",            limit: 255
    t.integer  "translatable_entity_id", limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "ref_wakeup_statuses", force: :cascade do |t|
    t.string   "value",       limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ref_work_statuses", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "report_filters", force: :cascade do |t|
    t.integer "report_id", limit: 4
    t.integer "filter_id", limit: 4
  end

  create_table "report_groupable_fields", force: :cascade do |t|
    t.integer "report_id",          limit: 4
    t.integer "groupable_field_id", limit: 4
  end

  create_table "report_sortable_fields", force: :cascade do |t|
    t.integer "report_id",         limit: 4
    t.integer "sortable_field_id", limit: 4
  end

  create_table "reports", force: :cascade do |t|
    t.string   "title",                    limit: 255
    t.string   "description",              limit: 255
    t.string   "method",                   limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "sub_title",                limit: 255
    t.boolean  "is_required_external_pms",             default: true
    t.boolean  "is_nightly_only",                      default: false, null: false
    t.boolean  "display_show_button",                  default: true,  null: false
    t.boolean  "display_export_button",                default: false, null: false
    t.boolean  "is_export_only",                       default: false
  end

  create_table "reservation_daily_instances", force: :cascade do |t|
    t.integer  "reservation_id",        limit: 4,                                       null: false
    t.date     "reservation_date",                                                      null: false
    t.integer  "room_type_id",          limit: 4,                                       null: false
    t.integer  "original_room_type_id", limit: 4
    t.decimal  "rate_amount",                      precision: 10, scale: 2,             null: false
    t.integer  "rate_id",               limit: 4
    t.decimal  "original_rate_amount",             precision: 10, scale: 2
    t.string   "market_segment",        limit: 20
    t.integer  "adults",                limit: 4,                           default: 1, null: false
    t.integer  "children",              limit: 4
    t.integer  "children1",             limit: 4
    t.integer  "children2",             limit: 4
    t.integer  "children3",             limit: 4
    t.integer  "children4",             limit: 4
    t.integer  "children5",             limit: 4
    t.integer  "children6",             limit: 4
    t.integer  "cribs",                 limit: 4
    t.integer  "extra_beds",            limit: 4
    t.string   "turndown_status",       limit: 10
    t.boolean  "is_due_out"
    t.integer  "block_id",              limit: 4
    t.integer  "group_id",              limit: 4
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.integer  "room_id",               limit: 4
    t.integer  "currency_code_id",      limit: 4
    t.integer  "status_id",             limit: 4,                                       null: false
    t.integer  "infants",               limit: 4
  end

  add_index "reservation_daily_instances", ["group_id"], name: "index_reservation_daily_instances_on_group_id", using: :btree
  add_index "reservation_daily_instances", ["reservation_id", "reservation_date"], name: "index_res_daily_instances_on_res_id_and_res_date", unique: true, using: :btree
  add_index "reservation_daily_instances", ["room_id"], name: "index_reservation_daily_instances_on_room_id", using: :btree

  create_table "reservation_guest_messages", force: :cascade do |t|
    t.integer  "hotel_id",            limit: 4
    t.integer  "reservation_id",      limit: 4
    t.integer  "user_id",             limit: 4
    t.string   "external_message_id", limit: 255
    t.string   "message_from",        limit: 255
    t.boolean  "message_read",                    default: false
    t.string   "message",             limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "reservation_guest_messages", ["hotel_id"], name: "index_reservation_guest_messages_on_hotel_id", using: :btree
  add_index "reservation_guest_messages", ["reservation_id"], name: "index_reservation_guest_messages_on_reservation_id", using: :btree
  add_index "reservation_guest_messages", ["user_id"], name: "index_reservation_guest_messages_on_user_id", using: :btree

  create_table "reservation_keys", force: :cascade do |t|
    t.integer  "number_of_keys", limit: 4,                     null: false
    t.string   "room_number",    limit: 255
    t.integer  "reservation_id", limit: 4,                     null: false
    t.binary   "qr_data",        limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "uid",            limit: 255
    t.boolean  "is_inactive",                  default: false
  end

  create_table "reservation_reports", force: :cascade do |t|
    t.integer  "reservation_id",         limit: 4
    t.date     "deposit_due_date"
    t.string   "deposit_payment_status", limit: 255
    t.decimal  "deposit_due_amount",                 precision: 7, scale: 2
    t.decimal  "deposit_paid_amount",                precision: 7, scale: 2
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.date     "deposit_paid_date"
    t.string   "report_type",            limit: 255
    t.boolean  "is_deposit_schedule"
  end

  add_index "reservation_reports", ["reservation_id"], name: "index_reservation_reports_on_reservation_id", using: :btree

  create_table "reservation_signatures", force: :cascade do |t|
    t.integer  "reservation_id", limit: 4,        null: false
    t.binary   "data",           limit: 16777215, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservation_tasks", force: :cascade do |t|
    t.integer  "reservation_id", limit: 4
    t.integer  "task_id",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "confirm_no",                     limit: 255,                                            null: false
    t.date     "arrival_date",                                                                          null: false
    t.date     "dep_date",                                                                              null: false
    t.integer  "hotel_id",                       limit: 4,                                              null: false
    t.datetime "created_at",                                                                            null: false
    t.datetime "updated_at",                                                                            null: false
    t.decimal  "upsell_amount",                                precision: 10, scale: 2
    t.datetime "arrival_time"
    t.string   "cancellation_no",                limit: 255
    t.date     "cancel_date"
    t.string   "cancel_reason",                  limit: 255
    t.string   "company_id",                     limit: 255
    t.boolean  "no_room_move",                                                          default: false, null: false
    t.boolean  "fixed_rate"
    t.decimal  "total_amount",                                 precision: 10, scale: 2
    t.string   "guarantee_type",                 limit: 255
    t.string   "last_stay_room",                 limit: 255
    t.string   "market_segment",                 limit: 255
    t.string   "total_rooms",                    limit: 255
    t.string   "party_code",                     limit: 255
    t.string   "preferred_room_type",            limit: 255
    t.boolean  "print_rate"
    t.string   "source_code",                    limit: 255
    t.string   "travel_agent_id",                limit: 255
    t.boolean  "is_walkin"
    t.string   "external_id",                    limit: 255
    t.boolean  "lobby_status",                                                          default: false
    t.date     "original_arrival_date",                                                                 null: false
    t.date     "original_departure_date",                                                               null: false
    t.time     "checkin_time"
    t.time     "checkout_time"
    t.string   "waitlist_reason",                limit: 2000
    t.decimal  "discount_amount",                              precision: 10, scale: 2
    t.string   "discount_reason",                limit: 2000
    t.boolean  "is_posting_restricted"
    t.boolean  "is_remote_co_allowed"
    t.boolean  "is_day_use"
    t.boolean  "is_upsell_applied",                                                     default: false
    t.boolean  "is_first_time_checkin",                                                 default: true
    t.integer  "status_id",                      limit: 4,                                              null: false
    t.integer  "discount_type_id",               limit: 4
    t.boolean  "is_opted_late_checkout",                                                default: false
    t.time     "late_checkout_time"
    t.boolean  "is_rate_suppressed"
    t.string   "promotion_code",                 limit: 255
    t.date     "last_upsell_posted_date"
    t.datetime "departure_time"
    t.boolean  "is_queued",                                                             default: false
    t.datetime "last_imported"
    t.boolean  "no_post"
    t.integer  "reservation_type_id",            limit: 4
    t.integer  "source_id",                      limit: 4
    t.integer  "market_segment_id",              limit: 4
    t.integer  "booking_origin_id",              limit: 4
    t.boolean  "is_advance_bill",                                                       default: false
    t.text     "comments",                       limit: 65535
    t.boolean  "is_pre_checkin",                                                        default: false
    t.boolean  "is_hourly",                                                             default: false
    t.datetime "put_in_queue_updated_at"
    t.integer  "creator_id",                     limit: 4
    t.integer  "updator_id",                     limit: 4
    t.boolean  "is_early_checkin_purchased",                                            default: false
    t.integer  "assigned_room_id",               limit: 4
    t.integer  "assigned_group_id",              limit: 4
    t.integer  "sharer_id",                      limit: 4
    t.datetime "charges_accepted_at"
    t.integer  "segment_id",                     limit: 4
    t.boolean  "hide_rates",                                                            default: false
    t.integer  "promotion_id",                   limit: 4
    t.float    "commission_value",               limit: 24,                             default: 0.0
    t.string   "commission_type",                limit: 255
    t.integer  "commission_origin_id",           limit: 4
    t.string   "commission_origin_type",         limit: 255
    t.decimal  "early_checkin_charge",                         precision: 10, scale: 2
    t.boolean  "is_early_checkin_charge_posted",                                        default: false
    t.boolean  "on_hold",                                                               default: false
    t.boolean  "is_room_service_opted",                                                 default: true
    t.boolean  "use_mobile_key",                                                        default: false
    t.boolean  "has_any_open_bill",                                                     default: false
    t.boolean  "is_routing_present",                                                    default: false
  end

  add_index "reservations", ["confirm_no"], name: "index_reservations_on_confirm_no", using: :btree
  add_index "reservations", ["hotel_id", "confirm_no"], name: "index_reservations_on_hotel_id_and_confirm_no", unique: true, using: :btree
  add_index "reservations", ["hotel_id", "sharer_id"], name: "index_reservations_on_hotel_id_and_sharer_id", using: :btree
  add_index "reservations", ["hotel_id", "status_id", "arrival_date"], name: "index_reservations_on_hotel_id_and_status_id_and_arrival_date", using: :btree
  add_index "reservations", ["hotel_id", "status_id", "dep_date"], name: "index_reservations_on_hotel_id_and_status_id_and_dep_date", using: :btree
  add_index "reservations", ["hotel_id", "status_id", "has_any_open_bill"], name: "index_reservations_on_hotel_id_status_id_and_has_any_open_bill", using: :btree

  create_table "reservations_addons", force: :cascade do |t|
    t.integer  "reservation_id",       limit: 4,              null: false
    t.integer  "addon_id",             limit: 4,              null: false
    t.float    "price",                limit: 24
    t.boolean  "is_inclusive_in_rate"
    t.integer  "quantity",             limit: 4,  default: 1, null: false
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations_addons", ["reservation_id", "addon_id"], name: "idx_reservations_addons", using: :btree

  create_table "reservations_features", id: false, force: :cascade do |t|
    t.integer "reservation_id", limit: 4, null: false
    t.integer "feature_id",     limit: 4, null: false
  end

  add_index "reservations_features", ["feature_id"], name: "index_reservations_preferences_on_preference_id", using: :btree
  add_index "reservations_features", ["reservation_id", "feature_id"], name: "index_reservations_features_on_reservation_id_and_feature_id", unique: true, using: :btree
  add_index "reservations_features", ["reservation_id"], name: "index_reservations_preferences_on_reservation_id", using: :btree

  create_table "reservations_guest_details", force: :cascade do |t|
    t.boolean "is_primary",                      default: false, null: false
    t.integer "reservation_id",        limit: 4,                 null: false
    t.integer "guest_detail_id",       limit: 4,                 null: false
    t.boolean "is_accompanying_guest",           default: false
    t.boolean "is_added_from_kiosk",             default: false
  end

  add_index "reservations_guest_details", ["guest_detail_id"], name: "index_reservations_guest_details_on_guest_detail_id", using: :btree
  add_index "reservations_guest_details", ["reservation_id", "guest_detail_id"], name: "index_reservations_guest_details_uniq", unique: true, using: :btree

  create_table "reservations_memberships", id: false, force: :cascade do |t|
    t.integer "membership_id",  limit: 4, null: false
    t.integer "reservation_id", limit: 4, null: false
  end

  add_index "reservations_memberships", ["reservation_id", "membership_id"], name: "index_reservations_memberships_uniq", unique: true, using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                 limit: 255, null: false
    t.integer  "hotel_id",             limit: 4,   null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "api_username",         limit: 255
    t.string   "api_crypted_password", limit: 255
    t.string   "auth_token",           limit: 255
    t.datetime "auth_token_expiry"
    t.string   "external_id",          limit: 255
  end

  create_table "review_ratings", force: :cascade do |t|
    t.integer  "review_category_id", limit: 4, null: false
    t.integer  "rating",             limit: 4, null: false
    t.boolean  "published"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "review_id",          limit: 4, null: false
  end

  add_index "review_ratings", ["review_id", "review_category_id"], name: "index_review_ratings_on_review_id_and_review_category_id", unique: true, using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "reservation_id", limit: 4,   null: false
    t.string   "title",          limit: 255, null: false
    t.string   "description",    limit: 500
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "creator_id",     limit: 4
    t.integer  "updater_id",     limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string  "name",     limit: 255, null: false
    t.integer "hotel_id", limit: 4
  end

  add_index "roles", ["hotel_id", "name"], name: "index_roles_on_hotel_id_and_name", using: :btree

  create_table "roles_permissions", force: :cascade do |t|
    t.integer  "entity_id",     limit: 4
    t.integer  "role_id",       limit: 4
    t.integer  "permission_id", limit: 4
    t.boolean  "value"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "hotel_id",      limit: 4
  end

  add_index "roles_permissions", ["entity_id"], name: "index_roles_permissions_on_entity_id", using: :btree
  add_index "roles_permissions", ["permission_id"], name: "index_roles_permissions_on_permission_id", using: :btree
  add_index "roles_permissions", ["role_id"], name: "index_roles_permissions_on_role_id", using: :btree

  create_table "room_classes", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "description", limit: 255
    t.integer  "hotel_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "room_custom_rates", force: :cascade do |t|
    t.integer  "room_rate_id",       limit: 4,  null: false
    t.date     "date",                          null: false
    t.float    "single_amount",      limit: 24
    t.float    "double_amount",      limit: 24
    t.float    "extra_adult_amount", limit: 24
    t.float    "child_amount",       limit: 24
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "creator_id",         limit: 4
    t.integer  "updater_id",         limit: 4
  end

  add_index "room_custom_rates", ["room_rate_id", "date"], name: "index_room_custom_rates_on_room_rate_id_and_date", using: :btree

  create_table "room_rate_restrictions", force: :cascade do |t|
    t.integer  "hotel_id",     limit: 4, null: false
    t.integer  "type_id",      limit: 4, null: false
    t.date     "date",                   null: false
    t.integer  "rate_id",      limit: 4, null: false
    t.integer  "room_type_id", limit: 4, null: false
    t.integer  "days",         limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
  end

  add_index "room_rate_restrictions", ["rate_id", "date"], name: "index_room_rate_restrictions_on_rate_id_and_date", using: :btree
  add_index "room_rate_restrictions", ["type_id", "rate_id", "room_type_id", "date"], name: "index_restrictions_uniq", unique: true, using: :btree

  create_table "room_rates", force: :cascade do |t|
    t.integer  "room_type_id",             limit: 4,  null: false
    t.integer  "rate_set_id",              limit: 4,  null: false
    t.float    "single_amount",            limit: 24
    t.float    "double_amount",            limit: 24
    t.float    "extra_adult_amount",       limit: 24
    t.float    "child_amount",             limit: 24
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "creator_id",               limit: 4
    t.integer  "updater_id",               limit: 4
    t.float    "nightly_rate",             limit: 24
    t.float    "day_hourly_incr_amount",   limit: 24
    t.float    "night_hourly_incr_amount", limit: 24
  end

  add_index "room_rates", ["rate_set_id", "room_type_id"], name: "index_room_rates_uniq", unique: true, using: :btree

  create_table "room_type_tasks", force: :cascade do |t|
    t.integer  "task_id",         limit: 4
    t.integer  "room_type_id",    limit: 4
    t.datetime "completion_time"
  end

  add_index "room_type_tasks", ["task_id", "room_type_id"], name: "index_room_type_tasks_on_task_id_and_room_type_id", unique: true, using: :btree

  create_table "room_types", force: :cascade do |t|
    t.integer  "hotel_id",                                 limit: 4,                     null: false
    t.string   "room_type",                                limit: 20,                    null: false
    t.text     "description",                              limit: 65535
    t.integer  "no_of_rooms",                              limit: 4,                     null: false
    t.integer  "max_adults",                               limit: 4
    t.integer  "max_children",                             limit: 4
    t.integer  "creator_id",                               limit: 4
    t.integer  "updater_id",                               limit: 4
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.string   "room_type_name",                           limit: 255,                   null: false
    t.string   "image_file_name",                          limit: 255
    t.string   "image_content_type",                       limit: 255
    t.integer  "image_file_size",                          limit: 4
    t.datetime "image_updated_at"
    t.boolean  "is_pseudo",                                              default: false, null: false
    t.integer  "max_occupancy",                            limit: 4
    t.integer  "max_late_checkouts",                       limit: 4
    t.boolean  "is_suite",                                               default: false, null: false
    t.boolean  "is_room_type_ows_request_per_status_type",               default: false
    t.boolean  "is_excluded_from_pre_checkout",                          default: false
    t.boolean  "is_excluded_from_pre_checkin",                           default: false
    t.integer  "max_early_checkins",                       limit: 4
    t.integer  "room_class_id",                            limit: 4
    t.integer  "next_day_max_early_checkins",              limit: 4
  end

  add_index "room_types", ["hotel_id", "room_type"], name: "index_room_types_on_hotel_id_and_room_type", unique: true, using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "hotel_id",                               limit: 4,                   null: false
    t.string   "room_no",                                limit: 20,                  null: false
    t.integer  "room_type_id",                           limit: 4,                   null: false
    t.boolean  "is_occupied",                                        default: false, null: false
    t.integer  "creator_id",                             limit: 4
    t.integer  "updater_id",                             limit: 4
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.integer  "hk_status_id",                           limit: 4,                   null: false
    t.string   "image_file_name",                        limit: 255
    t.string   "image_content_type",                     limit: 255
    t.integer  "image_file_size",                        limit: 4
    t.datetime "image_updated_at"
    t.integer  "floor_id",                               limit: 4
    t.integer  "max_occupancy",                          limit: 4
    t.boolean  "is_on_hold",                                         default: false
    t.boolean  "is_exclude_from_manual_room_assignment",             default: false
    t.boolean  "is_exclude_from_auto_room_assignment",               default: false
    t.boolean  "is_exclude_from_manual_checkin",                     default: false
    t.boolean  "is_exclude_from_auto_checkin",                       default: false
    t.boolean  "is_exclude_from_housekeeping",                       default: false
  end

  add_index "rooms", ["hotel_id", "room_no"], name: "idx_rooms_room_no_uk", unique: true, using: :btree
  add_index "rooms", ["hotel_id", "room_no"], name: "index_rooms_on_hotel_id_and_room_no", unique: true, using: :btree
  add_index "rooms", ["room_type_id"], name: "index_rooms_on_room_type_id", using: :btree

  create_table "rooms_features", id: false, force: :cascade do |t|
    t.integer "room_id",    limit: 4, null: false
    t.integer "feature_id", limit: 4, null: false
  end

  add_index "rooms_features", ["room_id", "feature_id"], name: "idx_room_features_rooms_id_uk", unique: true, using: :btree
  add_index "rooms_features", ["room_id", "feature_id"], name: "index_rooms_features_on_room_id_and_feature_id", unique: true, using: :btree

  create_table "sb_posts", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,                 null: false
    t.text     "body",          limit: 65535,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body_html",     limit: 65535
    t.string   "author_name",   limit: 255
    t.string   "author_email",  limit: 255
    t.string   "author_url",    limit: 255
    t.string   "author_ip",     limit: 255
    t.integer  "comment_count", limit: 4,     default: 0
    t.integer  "hotel_id",      limit: 4,                 null: false
    t.integer  "group_id",      limit: 4
    t.integer  "ad_id",         limit: 4
  end

  add_index "sb_posts", ["ad_id"], name: "index_sb_posts_on_ad_id", using: :btree
  add_index "sb_posts", ["created_at"], name: "index_sb_posts_on_forum_id", using: :btree
  add_index "sb_posts", ["user_id", "created_at"], name: "index_sb_posts_on_user_id", using: :btree

  create_table "schedule_jobs", force: :cascade do |t|
    t.integer  "hotel_id",    limit: 4
    t.string   "job_name",    limit: 255
    t.string   "task_name",   limit: 255
    t.string   "status",      limit: 255
    t.string   "filter_dict", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "segments", force: :cascade do |t|
    t.string   "name",           limit: 255,                null: false
    t.integer  "length_of_stay", limit: 4
    t.integer  "hotel_id",       limit: 4,                  null: false
    t.boolean  "is_active",                  default: true
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "sell_limits", force: :cascade do |t|
    t.integer  "hotel_id",     limit: 4, null: false
    t.date     "from_date",              null: false
    t.date     "to_date",                null: false
    t.integer  "rate_id",      limit: 4
    t.integer  "room_type_id", limit: 4
    t.integer  "to_sell",      limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
  end

  add_index "sell_limits", ["hotel_id", "from_date", "to_date", "rate_id", "room_type_id"], name: "index_sell_limits", using: :btree

  create_table "service_providers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "address",    limit: 16777215
    t.integer  "country_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "city",       limit: 255
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id",   limit: 255,   null: false
    t.text     "data",         limit: 65535
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "user_id",      limit: 4,     null: false
    t.datetime "expires_at",                 null: false
    t.string   "session_type", limit: 255
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_sessid", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255,   null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id",   limit: 4
    t.string   "thing_type", limit: 30
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "shifts", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.time    "time"
    t.integer "hotel_id",  limit: 4
    t.boolean "is_system",             default: false
  end

  create_table "smartbands", force: :cascade do |t|
    t.integer  "reservation_id", limit: 4,                   null: false
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.string   "account_number", limit: 255,                 null: false
    t.boolean  "is_fixed",                   default: false, null: false
    t.float    "amount",         limit: 24
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "creator_id",     limit: 4
    t.integer  "updater_id",     limit: 4
  end

  add_index "smartbands", ["reservation_id"], name: "index_smartbands_on_reservation_id", using: :btree

  create_table "sms_campaigns", force: :cascade do |t|
    t.integer "sms_code_id", limit: 4
    t.integer "hotel_id",    limit: 4
    t.boolean "active",                  default: false
    t.string  "code",        limit: 255
  end

  create_table "sms_codes", force: :cascade do |t|
    t.integer "hotel_chain_id", limit: 4
    t.string  "account_sid",    limit: 255
    t.string  "auth_token",     limit: 255
    t.boolean "active",                     default: false
  end

  create_table "sms_keywords", force: :cascade do |t|
    t.string  "sms_keyword",             limit: 255
    t.string  "sms_response",            limit: 255
    t.integer "sms_object_id",           limit: 4
    t.integer "ref_sms_keyword_type_id", limit: 4
    t.string  "sms_object_type",         limit: 255
  end

  create_table "sms_numbers", force: :cascade do |t|
    t.integer "sms_campaign_id", limit: 4
    t.string  "phone_number",    limit: 255
    t.integer "guest_detail_id", limit: 4
    t.boolean "opt_in",                      default: true
    t.boolean "double_opt_in"
  end

  create_table "sources", force: :cascade do |t|
    t.string   "code",           limit: 255
    t.string   "description",    limit: 255
    t.integer  "hotel_id",       limit: 4
    t.boolean  "is_active"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_web_default"
  end

  create_table "staff_alert_emails", force: :cascade do |t|
    t.integer  "hotel_id",   limit: 4,   null: false
    t.string   "email",      limit: 255, null: false
    t.string   "email_type", limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "staff_details", force: :cascade do |t|
    t.integer  "user_id",             limit: 4,   null: false
    t.string   "first_name",          limit: 255, null: false
    t.string   "last_name",           limit: 255, null: false
    t.string   "job_title",           limit: 255
    t.string   "title",               limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "staff_details", ["user_id"], name: "index_staff_details_on_user_id", unique: true, using: :btree

  create_table "states", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  add_index "states", ["name"], name: "index_states_on_name", unique: true, using: :btree

  create_table "suite_rooms", force: :cascade do |t|
    t.integer  "room_id",           limit: 4
    t.integer  "component_room_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "suites_components", force: :cascade do |t|
    t.integer "suite_room_type_id",     limit: 4, null: false
    t.integer "component_room_type_id", limit: 4, null: false
    t.integer "rooms_count",            limit: 4, null: false
  end

  create_table "survey_answers", force: :cascade do |t|
    t.string   "description",     limit: 255
    t.integer  "associated_id",   limit: 4,   null: false
    t.string   "associated_type", limit: 255, null: false
    t.integer  "question_id",     limit: 4,   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "survey_questions", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "description",        limit: 255
    t.integer  "maximum_count",      limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "hotel_id",           limit: 4,   null: false
    t.integer  "question_type_id",   limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "task_frequencies", force: :cascade do |t|
    t.boolean  "sunday",               default: false
    t.boolean  "monday",               default: false
    t.boolean  "tuesday",              default: false
    t.boolean  "wednesday",            default: false
    t.boolean  "thursday",             default: false
    t.boolean  "friday",               default: false
    t.boolean  "saturday",             default: false
    t.integer  "days",       limit: 4, default: 0
    t.integer  "task_id",    limit: 4
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "task_reservation_statuses", force: :cascade do |t|
    t.integer "task_id",                      limit: 4
    t.integer "ref_reservation_hk_status_id", limit: 4
  end

  add_index "task_reservation_statuses", ["task_id", "ref_reservation_hk_status_id"], name: "idx_task_res_status_uniq", unique: true, using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.integer  "work_type_id",               limit: 4
    t.integer  "ref_housekeeping_status_id", limit: 4
    t.boolean  "is_occupied"
    t.boolean  "is_vacant"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.datetime "completion_time"
    t.boolean  "is_system",                              default: false
    t.boolean  "is_active",                              default: true
    t.boolean  "is_default",                             default: false
    t.boolean  "is_clean",                               default: false
    t.boolean  "is_dirty",                               default: false
    t.boolean  "is_pickup",                              default: false
  end

  add_index "tasks", ["work_type_id"], name: "index_tasks_on_work_type_id", using: :btree

  create_table "tax_calculation_rules", force: :cascade do |t|
    t.integer "charge_code_generate_id",        limit: 4
    t.integer "linked_charge_code_generate_id", limit: 4
  end

  create_table "translatable_label_translations", force: :cascade do |t|
    t.integer  "translatable_label_id", limit: 4
    t.string   "locale",                limit: 255, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "value",                 limit: 255
  end

  add_index "translatable_label_translations", ["locale"], name: "index_translatable_label_translations_on_locale", using: :btree
  add_index "translatable_label_translations", ["translatable_label_id"], name: "index_translatable_label_translations_on_translatable_label_id", using: :btree

  create_table "translatable_labels", force: :cascade do |t|
    t.string   "name",                        limit: 255, null: false
    t.string   "code",                        limit: 255
    t.integer  "translatable_entity_item_id", limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "upsell_amounts", force: :cascade do |t|
    t.integer "level_from",  limit: 4,                  null: false
    t.integer "level_to",    limit: 4,                  null: false
    t.float   "amount",      limit: 24,                 null: false
    t.integer "hotel_id",    limit: 4,                  null: false
    t.boolean "is_next_day",            default: false
  end

  create_table "upsell_room_levels", force: :cascade do |t|
    t.integer  "room_type_id",          limit: 4
    t.integer  "level",                 limit: 4,                 null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "max_los",               limit: 4
    t.boolean  "allow_rover_overwrite",           default: false, null: false
    t.integer  "next_day_room_type_id", limit: 4
  end

  add_index "upsell_room_levels", ["room_type_id", "level"], name: "index_upsell_room_levels_on_room_type_id_and_level", using: :btree

  create_table "url_mappings", force: :cascade do |t|
    t.string   "url",            limit: 255, null: false
    t.integer  "hotel_chain_id", limit: 4
    t.integer  "creator_id",     limit: 4
    t.integer  "updater_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "url_mappings", ["url"], name: "index_url_mappings_on_url", unique: true, using: :btree

  create_table "user_activities", force: :cascade do |t|
    t.integer  "hotel_id",                 limit: 4,   null: false
    t.integer  "associated_activity_id",   limit: 4,   null: false
    t.integer  "application_id",           limit: 4
    t.integer  "action_type_id",           limit: 4
    t.string   "activity_status",          limit: 255, null: false
    t.string   "message",                  limit: 255
    t.string   "user_ip_address",          limit: 255, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.datetime "activity_date_time"
    t.string   "associated_activity_type", limit: 255
  end

  add_index "user_activities", ["associated_activity_id", "associated_activity_type"], name: "index_user_activities_on_associated_activity", using: :btree
  add_index "user_activities", ["hotel_id", "application_id"], name: "index_user_activities_on_hotel_id_and_application_id", using: :btree
  add_index "user_activities", ["hotel_id", "associated_activity_id"], name: "index_user_activities_on_hotel_id_and_associated_activity_id", using: :btree

  create_table "user_admin_bookmarks", force: :cascade do |t|
    t.integer  "user_id",              limit: 4, null: false
    t.integer  "admin_menu_option_id", limit: 4, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "user_admin_bookmarks", ["user_id", "admin_menu_option_id"], name: "index_user_admin_bookmarks_on_user_id_and_admin_menu_option_id", unique: true, using: :btree

  create_table "user_notification_preferences", force: :cascade do |t|
    t.integer "user_id",             limit: 4,                null: false
    t.boolean "new_post",                      default: true
    t.boolean "response_to_post",              default: true
    t.boolean "response_to_review",            default: true
    t.boolean "alert_text_to_staff",           default: true
    t.boolean "is_alert_promotions"
  end

  add_index "user_notification_preferences", ["user_id"], name: "index_user_notification_preferences_on_user_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "role",                   limit: 255
    t.string   "name",                   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_notification_details", force: :cascade do |t|
    t.integer  "user_id",                limit: 4,   null: false
    t.integer  "notification_detail_id", limit: 4,   null: false
    t.boolean  "is_read"
    t.boolean  "is_pushed"
    t.boolean  "should_notify"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "alert_time"
    t.string   "notification_channel",   limit: 255
    t.integer  "reservation_id",         limit: 4
    t.string   "camapign_screen_type",   limit: 255
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4, null: false
    t.integer "role_id", limit: 4, null: false
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255,   null: false
    t.integer  "item_id",    limit: 4,     null: false
    t.string   "event",      limit: 255,   null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object",     limit: 65535
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "wakeups", force: :cascade do |t|
    t.integer  "reservation_id", limit: 4,   null: false
    t.integer  "hotel_id",       limit: 4,   null: false
    t.string   "room_no",        limit: 255
    t.date     "start_date",                 null: false
    t.date     "end_date",                   null: false
    t.time     "time",                       null: false
    t.integer  "creator_id",     limit: 4
    t.integer  "updater_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "status_id",      limit: 4,   null: false
  end

  add_index "wakeups", ["reservation_id"], name: "index_wakeups_on_reservation_id", using: :btree

  create_table "web_checkin_staff_alert_emails", force: :cascade do |t|
    t.integer  "hotel_id",   limit: 4,   null: false
    t.string   "email",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "web_checkout_staff_alert_emails", force: :cascade do |t|
    t.integer  "hotel_id",   limit: 4,   null: false
    t.string   "email",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "email_type", limit: 255
  end

  create_table "work_assignments", force: :cascade do |t|
    t.integer  "work_sheet_id",  limit: 4
    t.integer  "task_id",        limit: 4
    t.integer  "room_id",        limit: 4
    t.integer  "work_status_id", limit: 4
    t.integer  "order",          limit: 4
    t.datetime "begin_time"
    t.datetime "end_time"
  end

  add_index "work_assignments", ["room_id"], name: "index_work_assignments_on_room_id", using: :btree
  add_index "work_assignments", ["work_sheet_id"], name: "index_work_assignments_on_work_sheet_id", using: :btree

  create_table "work_logs", force: :cascade do |t|
    t.integer  "room_id",    limit: 4
    t.datetime "begin_time"
    t.datetime "end_time"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "work_sheets", force: :cascade do |t|
    t.integer "user_id",      limit: 4
    t.integer "work_type_id", limit: 4
    t.integer "shift_id",     limit: 4
    t.date    "date"
    t.integer "sheet_number", limit: 4
  end

  add_index "work_sheets", ["user_id"], name: "index_work_sheets_on_user_id", using: :btree
  add_index "work_sheets", ["work_type_id", "date"], name: "index_work_sheets_on_work_type_id_and_date", using: :btree

  create_table "work_types", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.integer  "hotel_id",             limit: 4
    t.boolean  "is_active",                        default: true
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.boolean  "is_system",                        default: false
    t.boolean  "is_show_on_stay_card",             default: false
    t.boolean  "is_default",                       default: false
    t.string   "value",                limit: 255
  end

  create_table "workstations", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "hotel_id",           limit: 4
    t.string   "station_identifier", limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "printer",            limit: 255
    t.integer  "key_encoder_id",     limit: 4
    t.integer  "emv_terminal_id",    limit: 4
    t.string   "rover_device_id",    limit: 255
    t.boolean  "is_out_of_order",                  default: false
    t.text     "out_of_order_msg",   limit: 65535
  end

  add_index "workstations", ["hotel_id"], name: "index_work_stations_on_hotel_id", using: :btree

end
