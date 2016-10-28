class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.references    :user
      t.string        :name
      t.string        :kana
      t.string        :custom_url
      t.string        :contact_person_name
      t.string        :contact_person_kana
      t.string        :logo
      t.string        :cover_image
      t.string        :homepage_url
      t.string        :industry_type
      t.text          :profile
      t.text          :vision
      t.integer       :establish_y
      t.integer       :establish_m
      t.integer       :establish_d
      t.string        :recruit_url
      t.string        :about_url
      t.timestamps
    end
  end
end
