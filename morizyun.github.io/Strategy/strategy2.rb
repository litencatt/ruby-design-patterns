class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = 'report title'
    @text = %w(text1 text2 text3)
    @formatter = formatter
  end

  def output_report
    @formatter.call(self)
  end
end

HTML_FORMATTER = lambda do |context|
  puts ""
  context.text.each { |line| puts "" }
  puts ""
end

PLANE_TEXT_FORMATTER = lambda do |context|
  puts ""
  context.text.each { |line| puts(line) }
end

report = Report.new(&HTML_FORMATTER)
report.output_report

report = Report.new(&PLANE_TEXT_FORMATTER)
report.output_report
