require_relative('library_ruby_oop/version')
require_relative('library_ruby_oop/file_module')
require_relative('library_ruby_oop/library')
require_relative('library_ruby_oop/book')
require_relative('library_ruby_oop/author')
require_relative('library_ruby_oop/order')
require_relative('library_ruby_oop/reader')

module LibraryRubyOop

  library = Library.new

  if ARGV[0] == 'want set library'
    book = Book.new(title: 'Murder on the Links', author: 'Agatha Christie')
    author = Author.new(name: 'Agatha Christie', biography: 'Agatha Mary Clarissa Mallowan , nee Miller')
    order = Order.new(book: 'Murder on the Links', reader: 'Bob', date: Time.now)
    order2 = Order.new(book: 'Robinson Crusoe', reader: 'Jack', date: Time.now)
    order3 = Order.new(book: 'Oliver Twist', reader: 'Justin', date: Time.now)
    reader = Reader.new(name: 'Bob', email: 'bob@gmail.com', city: 'Kiev', street: 'Xreshtik', house: '14/2')

    library.add_info_to_library(book, 'book')
    library.add_info_to_library(author, 'author')
    library.add_info_to_library(order, 'order')
    library.add_info_to_library(order2, 'order')
    library.add_info_to_library(order3, 'order')
    library.add_info_to_library(reader, 'reader')

    library.write_in_file
  else
    #get all library data from file
    library.read_from_file
  end

#most popular book
  library.most_active :book
#most popular reader in library
  library.most_active :reader
#count people who ordered one of the three most popular books
  library.most_popular_book
end
