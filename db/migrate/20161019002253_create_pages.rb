class CreatePages < ActiveRecord::Migration[5.0]
  def up
    create_table :pages do |t|
      # foreign key
      # could write t.references "subject_id"
    	t.integer "subject_id"
    	# class columns
    	t.string "name"
    	t.string "permalink"
    	t.integer "position"
    	t.boolean "visible", :default => false
      t.timestamps
    end
    add_index('pages', 'subject_id')
    add_index('pages', 'permalink')
  end

	def down
		drop_table :pages
	end

end
