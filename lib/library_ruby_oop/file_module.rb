module LibraryRubyOop
module WorkWithFile

  FILE_BOOK = 'files/books.txt'
  FILE_AUTHOR = 'files/authors.txt'
  FILE_ORDER = 'files/orders.txt'
  FILE_READER = 'files/readers.txt'

  #get file for id
  def get_file_for_id(number)
    case number
      when 1
        FILE_BOOK
      when 2
        FILE_AUTHOR
      when 3
        FILE_ORDER
      else
        FILE_READER
    end
  end

  #method for get object
  def get_new_object(number,i)
    case number
      when 1
        @books << Book.new(title: i[0], author: i[1])
        @books.uniq!
      when 2
        @authors << Author.new(name: i[0], biography: i[1])
        @authors.uniq!
      when 3
        @orders << Order.new(book: i[0], reader: i[1], date: i[2])
        @orders.uniq!
      else
        @readers << Reader.new(name: i[0], email: i[1], city: i[2], street: i[3], house: i[4])
        @readers.uniq!
    end
  end

  #method for add info to file
  def set_new_object(number,i)
    case number
      when 1
        @books.each {|k| i.puts "#{k.title}/ #{k.author}"}
      when 2
        @authors.each {|k| i.puts "#{k.name}/ #{k.biography}"}
      when 3
        @orders.each {|k| i.puts "#{k.book}/ #{k.reader}/ #{k.date}"}
      else
        @readers.each {|k| i.puts "#{k.name}/ #{k.email}/ #{k.city}/ #{k.street}/ #{k.house}"}
    end
  end

  #write in files
  def write_in_file
    (1..4).each do |i|
      begin
      File.open(get_file_for_id(i), 'w') do |f|
        set_new_object i, f
      end
      rescue Exception => e
        puts 'Some trouble for set to file'
        puts e.message
        end
    end
  end

  #read from file
  def read_from_file
    (1..4).each do |i|
      begin
        fields = File.readlines get_file_for_id i
        fields.map! { |f| f.chomp.split('/') }
        fields.each { |f| get_new_object i, f }
      rescue Exception => e
        puts 'Some trouble for read from file'
        puts e.message
      end
    end
  end

end
end