DEFAULT_TABLES = Proc.new do
  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "user_id"
    t.decimal  "price"
    t.integer  "in_stock_quantity"
    t.integer  "on_order_quantity"
    t.boolean  "active"
    t.string   "uuid"
    t.integer  "status"
    t.integer  "size"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "status"
    t.string   "uuid"
    t.boolean  "deleted"
    t.datetime "deleted_at"
    t.datetime "deliver_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "widgets", :force => true do |t|
    t.string "uuid"
    t.string  "email_address"
    t.string  "subdomain"
    t.string  "website"
    t.integer  "status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "things", :force => true do |t|
    t.string "name"
    t.string "uuid"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "people", :force => true do |t|
    t.string "name"
    t.string "uuid"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "staplers", :force => true do |t|
    t.string "name"
    t.string "type"
    t.integer "attribute_set_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "swingline_stapler_attribute_sets", :force => true do |t|
    t.float "speed"
    t.string "owner"

    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end
end
