class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :industry
      t.integer :turn_over
      t.date :established_date
      t.string :type_of_company
      t.timestamps null: false
    end
  end
end
