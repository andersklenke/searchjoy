class <%= migration_class_name %> < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :searchjoy_searches do |t|
      t.references :user
      t.string :search_type
      t.string :query
      t.string :normalized_query
      t.integer :results_count
      t.timestamp :created_at
      t.references :convertable, polymorphic: true, index: {name: "index_searchjoy_searches_on_convertable"}
      t.timestamp :converted_at
    end

    add_index :searchjoy_searches, [:created_at]
    add_index :searchjoy_searches, [:search_type, :created_at]
    add_index :searchjoy_searches, [:search_type, :normalized_query, :created_at], name: "index_searchjoy_searches_on_search_type_query" # autogenerated name is too long
  end
end
