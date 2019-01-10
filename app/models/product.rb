class Product < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :product_orders
  has_many :rates
  belongs_to :category
  mount_uploader :image, PictureUploader
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true

  scope :search_name, -> (name) {where("name like ?", "#{name}%")}
  scope :search_category, -> (category_id) {where(category_id: category_id)}
  scope :min_max_price, -> (min,max) {where(price: min..max)}
end
