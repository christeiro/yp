class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :country
      t.string :phone
      t.string :email
      t.string :website_url
      t.string :small_cover_url
      t.string :large_cover_url
      t.string :logo_url
      t.timestamps
    end
  end
end
