require_relative '../lib/album'

RSpec.describe Album do

  let (:album) { album = Album.new('12_id', 'Traphouse 3', 'Gucci Mane', 'Step')}

  it "has id" do
    expect(album.id).to eq('12_id')
  end

  it 'has artist' do
    expect(album.artist).to eq('Gucci Mane')
  end

  it 'has album_name' do
    expect(album.album_name).to eq('Traphouse 3')
  end

  it 'has tracks' do
    expect(album.tracks).to eq('Step')
  end

end
