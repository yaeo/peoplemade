class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.references :user
      t.string    :title
      t.string    :intro
      t.integer   :status
      t.timestamps
    end
  end
end
