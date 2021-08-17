class AddEvaluationToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :evaluation, :float
  end
end
