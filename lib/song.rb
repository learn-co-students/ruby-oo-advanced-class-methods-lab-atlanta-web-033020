require 'pry'

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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    # new_song.save
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(song_name)
    found = nil
    @@all.each do |song|
      if song.name == song_name
        found = song
      end
    end
    found
  end

  def self.find_or_create_by_name(song)
    if find_by_name(song)
      find_by_name(song)
    else
      create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    data = filename.gsub(/\.mp3/, '')
    artist, title = data.split(" - ")
    song = create_by_name(title)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end


end
