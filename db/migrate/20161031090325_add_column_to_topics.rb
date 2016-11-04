class AddColumnToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :heading, :string, :after => :story_id
  end
end
