class Song
  attr_accessor :name, :artist

  def self.new_by_filename(file_name)
    file_data = file_name.split(/[-]|[.]/)
    file_data.map { |value| value.strip!} 
    name = file_data[1]
    artist = file_data[0]

    song = self.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.artist.add_song(song)

    song
  end

  def initialize(name)
    self.name = name
  end
end