class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments


  def categories_attributes=(categories_hashes)
    categories_hashes.each do |i, category_attributes|
      category = Category.find_or_create_by(name: category_attributes[:name])
      self.post_categories.build(:category => category)
    end 
  end 
end
