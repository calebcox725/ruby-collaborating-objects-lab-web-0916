require 'pry'

class Artist
  @@all = []

  attr_accessor :name, :songs

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist = self.all.detect { |artist| artist.name == name}
    artist ||= Artist.new(name)
  end

  def initialize(name)
    self.name = name
    self.songs = []
    save
  end

  def save
    @@all << self
  end

  def add_song(song)
    songs << song
  end

  def print_songs
    songs.each { |song| puts song.name}
  end
end