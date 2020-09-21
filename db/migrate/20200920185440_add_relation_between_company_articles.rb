class AddRelationBetweenCompanyArticles < ActiveRecord::Migration
  def change
    add_column :articles, :company_id, :integer
  end
end