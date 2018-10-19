class Done
  attr_accessor :file_db

  def initialize(file_db)
    @file_db = file_db
  end

  def good?
    TownhallsAdderToDb.new(@file_db).perform
    TownhallsMailer.new(@file_db).send_mail
    TownhallsFollower.new.perform
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
