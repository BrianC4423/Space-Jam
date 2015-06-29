# runner.rb
# Add a `Track` class. A track should have the following attributes, with getter methods for each attribute:
#
# - `album_id`
# - `id` (`track_id` in the CSV)
# - `title`
# - `track_number`
# - `duration_ms` (duration in milliseconds)
# album_id,track_id,title,track_number,duration_ms,album_name,artists
require "pry"
require 'csv'
require_relative "album.rb"

albums = []
track_info = []

CSV.foreach('../space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash
  album = albums.find { |a| a.id == track[:album_id] }

  track_info << Track.new(track[:album_id], track[:track_id], track[:title], track[:track_number], track[:duration_ms])
  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists], track_info)
    albums << album
  end
  # add the track to the album's @tracks instance variable

end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end
