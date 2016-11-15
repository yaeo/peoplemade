class CreateStoriesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :stories_products do |t|
      t.references :product
      t.references :story
      t.timestamps
    end
  end
end
