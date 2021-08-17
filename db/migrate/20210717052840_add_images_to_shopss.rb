class AddImagesToShopss < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :images, :json
  end
end
