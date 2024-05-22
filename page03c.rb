require_relative 'app'
def test_book(title, author, pages, genre, email)
  book = Book.new(title: title, author: author, pages: pages, genre: genre, email: email)

  puts "\nAttempting to save book:"
  puts "Title: #{title}, Author: #{author}, Pages: #{pages}, Genre: #{genre}, Email: #{email}"

  begin
    if book.save
      puts "Book saved successfully"
    else
      puts "Errors:"
      puts book.errors.full_messages
    end
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  end
end

# Test different books with different attributes
test_book("Book 1", "Author 1", 200, "Fiction", "author1@example.com")
test_book(nil, "Author 2", 300, "Non-Fiction", "author2@example.com")
test_book("Book 3", "1234", 400, "Fiction", "author3@example.com")
test_book("Book 4", "Author 4", -1, "Non-Fiction", "author4@example.com")
test_book("Book 5", "Author 5", 500, "Science-Fiction", "author5@example.com")
test_book("Funny Book", "Author", 200, "Fiction", "author@example.com")
test_book("invalid email book", "Author 2", 300, "Non-Fiction", "invalid-email")
