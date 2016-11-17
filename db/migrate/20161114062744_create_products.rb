class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references  :company
      t.string      :name
      t.integer     :price
      t.text        :description
      t.string      :url
      t.timestamps
    end
  end
end
