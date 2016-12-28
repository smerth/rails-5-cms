class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      # foreign key
      # could write t.references "page_id"
      t.integer "page_id"
      # class columns
    	t.string "name"
    	t.integer "position"
    	t.boolean "visible", :default => false
    	t.string "content_type"
    	t.text "content"
      t.timestamps
    end
    add_index('sections', 'page_id')
  end

  def down
    drop_table :sections
  end
end
