class MP3Importer
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    dir = Dir.new(path)
    song_array = dir.each_with_object([]) { |song, array| array << song }.
      drop(2)
  end

  def import
    files.each { |file_name| 
      Song.new_by_filename(file_name) }
  end
end