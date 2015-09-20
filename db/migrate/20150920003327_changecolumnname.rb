class Changecolumnname < ActiveRecord::Migration
  def change
  	rename_column :movies, :description, :text
  end
end
