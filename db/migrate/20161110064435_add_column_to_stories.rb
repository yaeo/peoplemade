class AddColumnToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :content, :text, :after => :intro
    add_column :stories, :image, :string, :after => :content
  end
end
