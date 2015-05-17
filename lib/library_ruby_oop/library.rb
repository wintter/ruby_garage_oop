module LibraryRubyOop
  class Library
    include WorkWithFile
    attr_accessor :books, :authors, :orders, :readers

    def initialize
      @books = Array.new
      @authors = Array.new
      @orders = Array.new
      @readers = Array.new
    end

    def add_info_to_library(obj, to)
      case to
        when 'book'
          @books.push obj
        when 'author'
          @authors.push obj
        when 'order'
          @orders.push obj
        else
          @readers.push obj
      end
    end

    def most_active(type)
      arr = Array.new
      @orders.each { |order| arr.push order.send(type) }
      hash = arr.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
      case type
        when :book
          puts 'The most popular book is "' << arr.max_by { |v| hash[v] } << '"'
        else
          puts arr.max_by { |v| hash[v] } << ' often takes the books'
      end
    end

    def most_popular_book
      book_arr = Array.new
      arr = Array.new
      @orders.each { |order| arr.push order.book }
      freq = arr.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
      a = freq.sort_by { |key, value| value }.to_a
      @orders.each { |val| book_arr.push(val.reader) if val.book == a[-1][0] || val.book == a[-2][0] || val.book == a[-3][0] }
      puts book_arr.uniq!.count.to_s << ' people ordered one of the three most popular books'
    end

  end
end