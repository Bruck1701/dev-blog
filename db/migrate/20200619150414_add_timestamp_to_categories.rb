class AddTimestampToCategories < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :categories, null: true

    #add_timestamps :animals, null: true 
    long_ago = DateTime.new(2000, 1, 1)
    Category.update_all(created_at: long_ago, updated_at: long_ago)
    
    change_column_null :categories, :created_at, false
    change_column_null :categories, :updated_at, false

  end
end
