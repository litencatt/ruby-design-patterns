class SimpleWriter
  def initialize(path)
    @file = File.open(path, "w")
  end

  def write_line(line)
    @file.print(line)
    @file.print("\n")
  end

  def pos
    @file.pos
  end

  def rewind
    @file.rewind
  end

  def close
    @file.close
  end
end

require 'forwardable'

class WriterDecorator
  extend Forwardable

  def_delegators :@real_writer, :write_line, :pos, :rewind, :close

  def initialize(real_writer)
    @real_writer = real_writer
  end
end

class NumberingWriter < WriterDecorator
  def initialize(real_writer)
    super(real_writer)
    @line_number = 1
  end
  def write_line(line)
    @real_writer.write_line("#{@line_number} : #{line}")
  end
end

class TimestampingWriter < WriterDecorator
  def write_line(line)
    @real_writer.write_line("#{Time.now} : #{line}")
  end
end


#writer = SimpleWriter.new('sample1.txt')
#writer.write_line('simple one line')
#writer.close

f = NumberingWriter.new(SimpleWriter.new('file1.txt'))
f.write_line("Hello out there")
f.close

f = TimestampingWriter.new(SimpleWriter.new('file2.txt'))
f.write_line("Hello out there")
f.close

f = TimestampingWriter.new(NumberingWriter.new(SimpleWriter.new('file3.txt')))
f.write_line("Hello out there")
f.close
