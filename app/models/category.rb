class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  default_scope -> { order(created_at: :desc)}

  scope :search_name, -> (name) {where("name like ?", "#{name}%")}
  scope :search_category, -> (category_id) {where(category_id: category_id)}
end
