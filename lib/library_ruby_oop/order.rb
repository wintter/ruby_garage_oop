module LibraryRubyOop

  class Order < Library
    attr_accessor :book, :reader, :date

    def initialize(book:, reader:, date:)
      @book = book
      @reader = reader
      @date = date
    end

  end
end