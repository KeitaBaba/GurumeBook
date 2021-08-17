class RenameContentstringColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :contentstring, :content
  end
end
