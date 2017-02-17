class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_attached_file :image, :styles => { :medium => "700x700>", :thumb => "200x200" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :name, :description, :image, :price, :presence => true
end
