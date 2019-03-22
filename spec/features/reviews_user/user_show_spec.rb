require 'rails_helper'
RSpec.describe 'as a visitor' do
  before :each do
    @mark = Author.create(name: 'Mark Z. Danielewski' )
    @terry = Author.create(name: 'Terry Pratchett' )
    @neil = Author.create(name: 'Neil Gaiman')
    @leaves = @mark.books.create(title: 'House of Leaves', pages: 709, year: 2000)
    @omens = Book.create(title: 'Good Omens', pages: 288, year: 1990, authors: [@terry, @neil])
    @r1 = Review.create!(title: 'House of Leaves Review', description: 'It was good.', rating: 3, book: Book.find_by(title: 'House of Leaves'), user: 'Bill')
    @r2 = Review.create!(title: 'House of Leaves Review 2', description: 'It was great.', rating: 4, book: Book.find_by(title: 'House of Leaves'), user: 'Sandy')
    @r3 = Review.create!(title: 'Good Omens Review', description: 'It was amazing.', rating: 5, book: Book.find_by(title: 'Good Omens'), user: 'Bill')

  end
  describe 'when i visit the user show page' do
    it 'shows all reviews written by that user' do
      visit user_path('Bill')
      expect(page).to have_content(@r1.title)
      expect(page).to_not have_content(@r2.title)
      expect(page).to have_content(@r1.rating)
      expect(page).to_not have_content("Rating: #{@r2.rating}")
      expect(page).to have_content(@r1.description)
      expect(page).to_not have_content(@r2.description)
      expect(page).to have_content(@r1.created_at)
      expect(page).to have_content(@leaves.title)
      expect(page).to have_content(@leaves.cover_image)
      expect(page).to have_content(@omens.title)
      expect(page).to have_content(@omens.cover_image)
    end
  end
end
