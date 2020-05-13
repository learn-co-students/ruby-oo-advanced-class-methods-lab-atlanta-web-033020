
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
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = create
    new_song.name = name
    new_song

    # self = name
    #self.new_by_name = name
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)

    # new_song 
    if !self.find_by_name(name)
      create_by_name(name)
    else
      self.find_by_name(name)
    end

  end

  def self.alphabetical

    ## GOOGLED "sort Ruby instances": Use .sort
    ##  https://www.youtube.com/watch?v=x9G7_1RvyB8 ##
    ## COMPARISON SPACESHIP VIDEO https://www.youtube.com/watch?v=I4TD-eCWUWQ ##

    self.all.sort {|song1, song2| song1.name <=> song2.name}

  end

  def self.new_from_filename(file)
    #.strip documentation (https://www.rubyguides.com/2018/01/ruby-string-methods/)
    # Create array of artist_name & name, strip off space & .mp3, & assign those properties
    data = file.split("-")
    artist_name = data[0].rstrip
    name = data[1].lstrip.delete_suffix(".mp3")  ## delete_prefix

    # Create a song
    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(file)
    # Method call to create the song & then save it
    self.all << new_from_filename(file)
  end

  def self.destroy_all
    self.all.clear
  end

 
end







  # def self.create #(name)
  #   # Song Class Methods .create instantiates and saves the song, and it returns the new song that was created
  #   # Custom Class Constructor
 
    
  #     song = self.new #(name)
  #     song.save
  #     return song

  #   # ??Use Constants??
     

  #  # song = self.new
  #  # song.name = name
  #  # song.artist_name = artist_name
  #   #@@all << song
  # end




  # song1 = Song.new
  # song1.name = "Singing Songs"
