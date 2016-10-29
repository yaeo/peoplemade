class AddColumnToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :ceo_name, :string, :after => :cover_image
  end
end
