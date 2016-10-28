class CreateSocials < ActiveRecord::Migration[5.0]
  def change
    create_table :socials do |t|
      t.references    :user
      t.string        :facebook
      t.string        :twitter
      t.string        :youtube
      t.string        :instagram
      t.string        :wantedly
      t.timestamps
    end
  end
end
