class ChangeTextToDescription < ActiveRecord::Migration
  def change
  	  	rename_column :movies, :text, :description
  end
end
