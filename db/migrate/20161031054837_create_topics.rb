class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.references  :story
      t.text        :content
      t.string      :image
      t.text        :caption
      t.timestamps
    end
  end
end
