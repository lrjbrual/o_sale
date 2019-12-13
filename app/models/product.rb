class Product < ApplicationRecord
  ## creation with validation / Active record validation
  validates :name, presence: true
  validates :description, presence: true
  ## all numbers validates number must equal to zero
  #validates :price, numericality: true # instead
  validates :price, numericality: {
    greater_than_or_equal_to: 0.0
  }

  # validation
  # rails c
  # prod = Product.new
  # prod.save
  # test for erros
  # prod.errors.any? 
  # prod.errors['name']
  ######
  # Product.create!(name: ...) !bang will through directly the error
  # Product.first.valid?
  # Product.first.destroy or User.first.destroy
  validates :quantity, numericality: {
    ## validate and must be 0 not nul
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  belongs_to :user ##we cannot create a product without user id
  has_many :comments, dependent: :destroy ##when you remove product it will remove comments

  #this will authorise owner only
  def owned_by?(owner)
    user == owner
  end
end
