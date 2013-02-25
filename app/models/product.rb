class Product < ActiveRecord::Base
   attr_accessible :name, :category_id, :category_attributes

   belongs_to :category   

   accepts_nested_attributes_for :category

   validates_presence_of :name
end