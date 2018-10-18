class Done
  attr_accessor :file

  def initialize(file)
    @file_f = file
  end

  def good?
    TownhallsAdderToDb.new(@file_f).perform
    return true
  end

  def bad
    puts "All isn't going well"
  end

  def perform
    if good?
    else bad
    end
  end

end
