require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    artist = Artist.create(name: 'Carly Rae Jaspen')
    song = artist.songs.create!(title: "I Really Like You", length: 200, play_count: 2345134)
    song_2 = artist.songs.create!(title: "asdf", length: 34, play_count: 9087)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create(name: 'Carly Rae Jaspen')
    song = artist.songs.create!(title: "I Really Like You", length: 200, play_count: 2345134)
    song_2 = artist.songs.create!(title: "asdf", length: 34, play_count: 9087)
    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_content(artist.name)
  end
end
