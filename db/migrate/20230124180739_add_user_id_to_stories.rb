class AddUserIdToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :user_id, :string
  end
end
