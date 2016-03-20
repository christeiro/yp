class AddCategoryToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :category, index: true, foreign_key: true
  end
end
