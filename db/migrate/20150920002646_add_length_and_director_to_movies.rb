class AddLengthAndDirectorToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :length, :integer
    add_column :movies, :director, :string
  end
end
