class Movie < ActiveRecord::Base

	has_many :comments
	belongs_to :user

  	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :large => "285x400>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :title, :description, :length, :director, presence: true

end
