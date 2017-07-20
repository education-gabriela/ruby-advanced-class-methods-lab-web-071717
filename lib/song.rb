class Song
  @@all = []

  attr_accessor :name, :artist_name
  
  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song

    song
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    new_song = new_by_name(name)
    self.all << new_song

    new_song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    !song ? self.create_by_name(name) : song
  end

  def self.alphabetical
    songs = self.all.sort_by do |song|
      song.name
    end

    songs
  end

  def self.new_from_filename(filename)
    filename_array = filename.partition(" - ")
    song_name = filename_array.last.split(".").first

    song = self.new_by_name(song_name)
    song.artist_name = filename_array.first

    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
