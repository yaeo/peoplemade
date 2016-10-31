class ChangeDatatypeColumnOfAddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :telnumber, :string
  end
end
