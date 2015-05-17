module LibraryRubyOop
  class Book < Library

    attr_accessor :title, :author

    def initialize(title:, author:)
      @title = title
      @author = author
    end

  end

end