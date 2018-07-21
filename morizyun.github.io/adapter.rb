class Printer
  def initialize(obj)
    @obj = obj
  end

  def print_weak
    @obj.print_weak
  end

  def print_strong
    @obj.print_strong
  end
end

class OldPrinter
  def initialize(string)
    @string = string.dup
  end

  def show_with_paren
    puts "(#{@string})"
  end

  def show_with_aster
    puts "*#{@string}*"
  end
end

class Adapter
  def initialize(string)
    @old_printer = OldPrinter.new(string)
  end

  def print_weak
    @old_printer.show_with_paren
  end

  def print_strong
    @old_printer.show_with_aster
  end
end

o = OldPrinter.new("Hello")
o.show_with_paren
o.show_with_aster

# Adapterを介してPrinterのインターフェースで
# OldPrinterのインターフェースを呼び出すことが可能とした
p = Printer.new(Adapter.new("Hello"))
p.print_weak
p.print_strong
