class Article < ApplicationRecord

  #belongs_to :category
  
  belongs_to :user

  has_many :article_categories
  has_many :categories, through: :article_categories

  # validations of field: 
  validates :title, presence: true, length: {minimum:6, maximum:100}
  validates :content, presence: true, length: {minimum:10, maximum: 10000 }

  def title=(s)
    super s.capitalize
  end

end