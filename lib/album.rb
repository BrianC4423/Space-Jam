class Track
  attr_reader :album_id, :id, :title, :track_number, :duration_ms

  def initialize(album_id, id, title, track_number, duration_ms)
    @album_id = album_id
    @id = id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
  end
end

class Album
  attr_reader :id, :album_name, :artist, :tracks

  def initialize(id, album_name, artist, tracks)
    @id = id
    @artist = artist
    @album_name = album_name
    @tracks = tracks
  end

  def track_duration_min
    duration = 0
    @tracks.inject(0) do |sum, track|
      if track.album_id == @id
        sum += track.duration_ms.to_i
      end
      duration = sum
    end
    duration_min = (duration/60000.to_f).round(2)
  end

  def track_list_string
    track_list = String.new
    @tracks.each do |track|
      if track.album_id == @id
        track_list += "#{track.track_number}. #{track.title}\n"
      end
    end
    track_list
  end

  def summary

    string = String.new
    string += "\nName: #{@album_name}\n"
    string += "Artist(s): #{@artist}\n"
    string += "Duration (min.): #{track_duration_min}\n"
    string += "Tracks:\n#{track_list_string}"
    return string
  end
end
