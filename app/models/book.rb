class Book < ApplicationRecord
  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors

  def average_rating
    if self.reviews.any?
      self.reviews.average(:rating).round(1)
    else
      0
    end
  end

  def total_reviews
    self.reviews.count(:rating)
  end

  def self.sort_pages(order)
    Book.order(pages: :"#{order}")
  end

  def self.sort_reviews(order)
    Book.left_outer_joins(:reviews)
        .select('count(reviews.rating)as total_reviews, books.*')
        .group('books.id')
        .order("count(reviews.rating) #{order}")
  end

  def self.sort_rating(order)
    Book.left_outer_joins(:reviews)
        .select('books.*, coalesce(avg(reviews.rating),0) as avg_rating')
        .group('books.id')
        .order("coalesce(avg(reviews.rating),0) #{order}")
  end

end
