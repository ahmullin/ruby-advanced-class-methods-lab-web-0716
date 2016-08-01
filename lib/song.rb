require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = self.new
    # song.name = name
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end


  def self.alphabetical
    all.sort_by do |song|
      song.name
    end

  end

  def self.new_from_filename(file)
    song = self.new
    reformat = file.split(/[-.]/)
    song.artist_name = reformat[0].strip
    song.name = reformat[1].strip
    song
  end

  def self.create_from_filename(file)
    self.all << self.new_from_filename(file)
  end

  def self.destroy_all
    self.all.clear
  end

end


  # def self.find_by_name(name)
  #   result = nil
  #   self.all.each_with_index do |object|
  #     if object.name == name
  #       result = "song_#{object}"
  #
  #     end
  #
  #   end
  #   result
  #   binding.pry
  #
  # end

 #  def self.find_by_name(name)
 #   result = nil
 #   self.all.each_with_index do |object, i|
 #    if object.name == name
 #     result = "song_#{i}"
 #    end
 #  end
 #  result
 #  binding.pry
 # end


 song_1 = Song.create_by_name("Thriller")
 song_2 = Song.create_by_name("Blank Space")
 song_3 = Song.create_by_name("Call Me Maybe")
 Song.alphabetical

#
# # #
# song = Song.create_by_name("Blank Space")
# song2 = Song.create_by_name("Hello")
# Song.alphabetical
# # # Song.find_by_name("Blank Space")
# # Song.find_or_create_by_name("Blank Space")
