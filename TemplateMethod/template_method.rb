class Report
  def initialize
    @title = "html report title"
    @text = ["report line 1", "report line 2", "report line 3"]
  end

  def output_report
    output_start
    output_body
    output_end
  end

  def output_start
  end

  def output_body
    @text.each do |line|
      output_line(line)
    end
  end

  def output_line(line)
    raise 'Called abstract method !!'
  end

  def output_end
  end
end

class HTMLReport < Report
  def output_start
    puts "<html><head><title>#{@title}</title></head><body>"
  end

  def output_line(line)
    puts "<p>#{line}</p>"
  end

  def output_end
    puts '</body></html>'
  end
end

class PlaneTextReport < Report
  def output_start
    puts "**** #{@title} ****"
  end

  def output_line(line)
    puts line
  end
end

html_report = HTMLReport.new
html_report.output_report

plane_report = PlaneTextReport.new
plane_report.output_report
