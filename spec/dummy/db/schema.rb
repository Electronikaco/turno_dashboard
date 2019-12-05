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

ActiveRecord::Schema.define(version: 2019_09_20_150514) do

  create_table "abandonment_reasons", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "absence_reasons", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "poll_result_id"
    t.integer "question_id"
    t.text "value"
    t.integer "int_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "poll_id"
    t.integer "owner_id"
    t.integer "client_id"
    t.integer "venue_id"
    t.index ["poll_id"], name: "index_answers_on_poll_id"
    t.index ["poll_result_id"], name: "index_answers_on_poll_result_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "attention_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "attention_id", null: false
    t.integer "user_id"
    t.string "action"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attention_id"], name: "index_attention_logs_on_attention_id"
  end

  create_table "attentions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "turn", null: false
    t.integer "service_id", null: false
    t.integer "user_id"
    t.integer "customer_id"
    t.string "status", default: "requested", null: false
    t.datetime "scheduled_at", null: false
    t.boolean "appointment", default: false, null: false
    t.datetime "attention_started_at"
    t.datetime "attention_end_at"
    t.integer "duration"
    t.integer "attention_duration", default: 1, null: false
    t.boolean "was_redirected", default: false, null: false
    t.integer "dead_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 1
    t.integer "turn_order"
    t.text "comments"
    t.integer "unit_id"
    t.string "turn_code"
    t.string "service_point_name"
    t.integer "rate"
    t.datetime "called"
    t.boolean "postponed", default: false
    t.integer "abandonment_reason_id"
    t.integer "priority_id"
    t.integer "subservice_id"
    t.integer "redirected_from", default: 0, null: false
    t.datetime "appointment_at"
    t.datetime "appointment_end_at"
    t.integer "service_point_id"
    t.string "service_point_slot"
    t.index ["customer_id"], name: "index_attentions_on_customer_id"
    t.index ["service_id"], name: "index_attentions_on_service_id"
    t.index ["user_id"], name: "index_attentions_on_user_id"
  end

  create_table "attentions_services", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "attention_id", null: false
    t.integer "service_id", null: false
    t.index ["attention_id", "service_id"], name: "index_attentions_services_on_attention_id_and_service_id"
    t.index ["service_id", "attention_id"], name: "index_attentions_services_on_service_id_and_attention_id"
  end

  create_table "audits", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "chat_users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "chat_id"
    t.integer "user_id"
    t.integer "status"
    t.integer "unread_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_users_on_chat_id"
    t.index ["user_id"], name: "index_chat_users_on_user_id"
  end

  create_table "chats", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "customer_data", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "customer_field_id"
    t.string "field_name"
    t.string "field_type"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "venue_id"
    t.string "customer_data_key"
    t.index ["customer_id"], name: "index_customer_data_on_customer_id"
  end

  create_table "customer_fields", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "hint"
    t.string "field_type"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "orders", default: 0
    t.boolean "active", default: true
    t.boolean "required", default: false
    t.boolean "important", default: false
    t.string "regex_validation"
    t.boolean "display_on_kiosk", default: false, null: false
    t.boolean "request_in_modal", default: false, null: false
  end

  create_table "customers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "document_type"
    t.string "document_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "mobile"
    t.string "address1"
    t.string "address2"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "venue_id"
    t.integer "last_attention_answered"
  end

  create_table "kiosks", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "unit_id"
    t.string "ip", collation: "utf8_unicode_ci"
    t.boolean "print", default: true, null: false
    t.text "css", collation: "utf8_unicode_ci"
    t.text "js", collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", collation: "utf8_unicode_ci"
    t.integer "seconds_to_go_back_home", default: 15, null: false
    t.string "last_ip", collation: "utf8_unicode_ci"
    t.integer "public_template_id"
    t.boolean "use_keyboard_buffer", default: false
    t.boolean "use_provider_from_doc", default: false, null: false
    t.boolean "show_qr"
    t.index ["unit_id"], name: "index_kiosks_on_unit_id"
  end

  create_table "mailboxer_conversation_opt_outs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string "unsubscriber_type"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"
  end

  create_table "mailboxer_conversations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "subject", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_notifications", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "type"
    t.text "body"
    t.string "subject", default: ""
    t.integer "sender_id"
    t.string "sender_type"
    t.integer "conversation_id"
    t.boolean "draft", default: false
    t.string "notification_code"
    t.integer "notified_object_id"
    t.string "notified_object_type"
    t.string "attachment"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.boolean "global", default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
    t.index ["type"], name: "index_mailboxer_notifications_on_type"
  end

  create_table "mailboxer_receipts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "receiver_id"
    t.string "receiver_type"
    t.integer "notification_id", null: false
    t.boolean "is_read", default: false
    t.boolean "trashed", default: false
    t.boolean "deleted", default: false
    t.string "mailbox_type", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_delivered", default: false
    t.string "delivery_method"
    t.string "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"
  end

  create_table "messages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "chat_id"
    t.integer "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "poll_results", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "rateable_id"
    t.string "rateable_type"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "poll_id"
    t.index ["poll_id"], name: "index_poll_results_on_poll_id"
    t.index ["rateable_type", "rateable_id"], name: "index_poll_results_on_rateable_type_and_rateable_id"
  end

  create_table "polls", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "questions_count"
    t.integer "poll_type"
  end

  create_table "priorities", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "priority_level", default: 1, null: false
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "venue_id"
    t.string "image_url"
  end

  create_table "priorities_services", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "priority_id", null: false
    t.index ["priority_id", "service_id"], name: "index_priorities_services_on_priority_id_and_service_id"
    t.index ["service_id", "priority_id"], name: "index_priorities_services_on_service_id_and_priority_id"
  end

  create_table "public_templates", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "css"
    t.text "js"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "questions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "poll_id"
    t.string "title"
    t.string "field_type"
    t.text "question_options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.integer "orders"
    t.index ["poll_id"], name: "index_questions_on_poll_id"
  end

  create_table "rating_tablets", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ip"
    t.text "css"
    t.text "js"
    t.string "rate_object", default: "0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rateable_type"
    t.integer "rateable_id"
    t.integer "poll_id"
    t.string "name"
    t.string "last_ip"
    t.boolean "show_general_rate", default: true, null: false
    t.index ["poll_id"], name: "index_rating_tablets_on_poll_id"
    t.index ["rateable_type", "rateable_id"], name: "index_rating_tablets_on_rateable_type_and_rateable_id"
  end

  create_table "reports", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.date "day"
    t.time "arrival_time"
    t.time "expected_arrival_time"
    t.time "out_time"
    t.time "expected_out_time"
    t.integer "time_worked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expected_time_worked"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "title"
    t.text "description"
    t.text "the_role", null: false
  end

  create_table "rss_contents", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.text "content"
    t.string "link"
    t.string "media_content_height"
    t.string "media_content_width"
    t.datetime "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_rss_contents_on_url"
  end

  create_table "service_points", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "unit_id", null: false
    t.string "name", null: false
    t.integer "slots_qty", default: 1, null: false
    t.string "slots_names"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_service_points_on_unit_id"
  end

  create_table "service_points_services", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "service_point_id", null: false
    t.integer "service_id", null: false
    t.index ["service_id", "service_point_id"], name: "index_service_points_services_on_service_id_and_service_point_id"
    t.index ["service_point_id", "service_id"], name: "index_service_points_services_on_service_point_id_and_service_id"
  end

  create_table "service_points_subservices", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "service_point_id", null: false
    t.integer "subservice_id", null: false
    t.index ["service_point_id"], name: "fk_service_points_subservices_service_point_id"
    t.index ["subservice_id"], name: "fk_service_points_subservices_subservice_id"
  end

  create_table "services", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "unit_id", null: false
    t.string "code"
    t.string "name", null: false
    t.boolean "status", default: true, null: false
    t.text "description"
    t.integer "max_days_in_advance", default: 30
    t.integer "timeslot_duration"
    t.integer "slots_per_block"
    t.boolean "choose_date_on_kiosk", default: false, null: false
    t.boolean "choose_user_on_kiosk", default: false, null: false
    t.boolean "register_on_kiosk", default: false, null: false
    t.integer "poll_id"
    t.text "services_comment"
    t.boolean "call_by_name", default: false, null: false
    t.boolean "print_ticket", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "allow_to_omit_registration", default: false
    t.boolean "hide_on_kiosk", default: false, null: false
    t.boolean "show_prefix_by_name", default: false, null: false
    t.boolean "show_general_rate", default: true, null: false
    t.integer "allowed_users"
    t.integer "expected_attention_time"
    t.integer "average_waiting_time"
    t.datetime "average_waiting_time_updated_at"
    t.string "token"
    t.integer "priority", default: 0
    t.string "image_url"
    t.index ["unit_id"], name: "index_services_on_unit_id"
  end

  create_table "services_tvpanels", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "tvpanel_id", null: false
    t.integer "service_id", null: false
    t.index ["service_id", "tvpanel_id"], name: "index_services_tvpanels_on_service_id_and_tvpanel_id"
    t.index ["tvpanel_id", "service_id"], name: "index_services_tvpanels_on_tvpanel_id_and_service_id"
  end

  create_table "services_users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "service_id", null: false
    t.index ["service_id", "user_id"], name: "index_services_users_on_service_id_and_user_id"
    t.index ["user_id", "service_id"], name: "index_services_users_on_user_id_and_service_id"
  end

  create_table "settings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "slides", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "tvpanel_id", null: false
    t.string "content_type"
    t.string "url"
    t.text "data"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true, null: false
    t.integer "orders", default: 0, null: false
    t.string "name"
    t.integer "volume"
    t.index ["tvpanel_id"], name: "index_slides_on_tvpanel_id"
  end

  create_table "subservices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "unit_id"
    t.integer "service_id"
    t.string "name"
    t.string "code"
    t.boolean "status"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 0
    t.string "image_url"
    t.index ["service_id"], name: "index_subservices_on_service_id"
    t.index ["unit_id"], name: "index_subservices_on_unit_id"
  end

  create_table "subservices_users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "subservice_id", null: false
    t.integer "user_id", null: false
    t.index ["subservice_id"], name: "fk_subservices_users_subservice_id"
    t.index ["user_id"], name: "fk_subservices_users_user_id"
  end

  create_table "syncs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "token_venue"
    t.string "token_unit", default: "", null: false
    t.string "table_sync"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "maxid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
  end

  create_table "timeslots", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "service_id"
    t.boolean "available", default: true, null: false
    t.integer "user_id"
    t.boolean "single_day", default: false, null: false
    t.boolean "monday", default: false, null: false
    t.boolean "tuesday", default: false, null: false
    t.boolean "wednesday", default: false, null: false
    t.boolean "thursday", default: false, null: false
    t.boolean "friday", default: false, null: false
    t.boolean "saturday", default: false, null: false
    t.boolean "sunday", default: false, null: false
    t.date "from_date", null: false
    t.date "to_date"
    t.time "from_hour", null: false
    t.time "to_hour", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subservice_id"
    t.integer "service_point_id"
    t.string "service_point_slot"
    t.integer "unit_id"
    t.index ["service_id"], name: "index_timeslots_on_service_id"
  end

  create_table "tvpanels", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "unit_id"
    t.string "ip"
    t.string "rss_feed_url"
    t.text "css"
    t.text "js"
    t.string "bell"
    t.string "tts_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_ip"
    t.integer "public_template_id"
    t.index ["unit_id"], name: "index_tvpanels_on_unit_id"
  end

  create_table "units", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: false, null: false
    t.string "code"
    t.boolean "call_by_name", default: false, null: false
    t.boolean "increment_turn_by_service", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "services_count", default: 0
    t.integer "service_points_count", default: 0
    t.integer "expected_attention_time"
    t.integer "venue_id"
    t.string "token", default: "1a99f722-05e5-4165-a3b5-ffce43573354"
  end

  create_table "user_absences", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "end"
    t.integer "minutes"
    t.string "absences_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "absence_reason_id"
    t.integer "user_id"
  end

  create_table "user_logins", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_logins_on_user_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "role_id", null: false
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "active_unit_id"
    t.boolean "custom_services", default: false, null: false
    t.integer "service_point_id"
    t.string "service_point_slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false, null: false
    t.integer "permanent_service_point"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "photo_uid"
    t.integer "status", default: 0, null: false
    t.integer "venue_id"
    t.string "token"
    t.integer "chat_status", default: 0
    t.boolean "custom_subservices", default: false, null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["token"], name: "index_users_on_token"
  end

  create_table "venues", id: :integer, limit: 3, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.integer "root_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "token", default: "fdce9173-3882-4a7d-ba5c-b1fd5d7fc258"
    t.boolean "status", default: false, null: false
  end

  add_foreign_key "answers", "polls"
  add_foreign_key "attention_logs", "attentions"
  add_foreign_key "attentions", "customers"
  add_foreign_key "attentions", "services"
  add_foreign_key "attentions", "users"
  add_foreign_key "chat_users", "chats", name: "fk_chat_users_chat_id"
  add_foreign_key "chat_users", "users", name: "fk_chat_users_user_id"
  add_foreign_key "chats", "users", name: "fk_chats_user_id"
  add_foreign_key "customer_data", "customers"
  add_foreign_key "kiosks", "units"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "messages", "chats", name: "fk_messages_chat_id"
  add_foreign_key "messages", "users", name: "fk_messages_user_id"
  add_foreign_key "poll_results", "polls"
  add_foreign_key "questions", "polls"
  add_foreign_key "rating_tablets", "polls"
  add_foreign_key "reports", "users"
  add_foreign_key "service_points", "units"
  add_foreign_key "service_points_subservices", "service_points", name: "fk_service_points_subservices_service_point_id"
  add_foreign_key "service_points_subservices", "subservices", name: "fk_service_points_subservices_subservice_id"
  add_foreign_key "services", "units"
  add_foreign_key "slides", "tvpanels"
  add_foreign_key "subservices", "services", name: "fk_subservices_service_id"
  add_foreign_key "subservices", "units", name: "fk_subservices_unit_id"
  add_foreign_key "subservices_users", "subservices", name: "fk_subservices_users_subservice_id"
  add_foreign_key "subservices_users", "users", name: "fk_subservices_users_user_id"
  add_foreign_key "timeslots", "services"
  add_foreign_key "tvpanels", "units"
  add_foreign_key "user_logins", "users"
  add_foreign_key "users", "roles"
end
