class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    songArray = filename.split(' - ')
    artistName = songArray[0]
    songName = songArray[1].gsub('.mp3', "")

    song = self.new
    song.name = songName
    song.artist_name = artistName
    song
  end

  def self.create_from_filename(filename)
    songArray = filename.split(' - ')
    artistName = songArray[0]
    songName = songArray[1].gsub('.mp3', "")

    song = self.create
    song.name = songName
    song.artist_name = artistName
    song
  end

  def self.destroy_all
    @@all = []
  end
end
