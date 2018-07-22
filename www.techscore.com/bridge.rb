class Sorter
  def initialize(sort_imple)
    @sort_imple = sort_imple
  end

  def sort(obj)
    @sort_imple.sort(obj)
  end
end

class QuickSorter
  def sort
  end
end

class BubbleSorter
  def sort
  end
end

sorter = Sorter.new(QuickSorter.new)
sorter.sort

sorter = Sorter.new(BubbleSorter.new)
sorter.sort

class TimerSorter < Sorter
  def initialize(sort_imple)
    super(sort_imple)
  end

  def time_sort(obj)
    start_time = Time.now
    sort(obj)
    end_time = Time.now
    puts "time: #{end_time - start_time}"
  end
end

sorter = TimerSorter.new(QuickSorter.new)
sorter.sort
