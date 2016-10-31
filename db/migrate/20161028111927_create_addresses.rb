class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references  :user
      t.integer     :zipcode1
      t.integer     :zipcode2
      t.string      :prefecture
      t.string      :address1
      t.string      :address2
      t.integer     :telnumber
      t.timestamps
    end
  end
end
