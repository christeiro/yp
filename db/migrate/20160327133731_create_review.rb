class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :company, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
