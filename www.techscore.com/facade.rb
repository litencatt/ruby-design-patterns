class BookList
  def search_book(book_name)
  end
end

class LendingList
  def check(book_name)
  end
end

class Librarian
  def search_book(book_name)
    book_list = BookList.new
    location = book_list.search_book(book_name)
    if location
      lending_list = LendingList.new
      if lending_list.check(book_name)
        return "貸出中です"
      else
        return location
      end
    else
      return "その本は所蔵していません"
    end
  end
end

class Visitor
  def main
    nakamura = Librarian.new
    location = nakamura.search_book("昆虫図鑑")
    if location == "貸出中"
      puts "貸出中かよ..."
    elsif location == "その本は所蔵していません"
      puts "なんだ、ないのか"
    else
      puts "サンキュ"
    end
  end
end
