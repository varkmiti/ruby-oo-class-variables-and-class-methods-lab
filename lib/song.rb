require 'pry'

class Song 

    attr_accessor :name 
    attr_accessor :artist 
    attr_accessor :genre

    @@count = 0
    @@genres = []
    @@artists = []

    def initialize(name, artist, genre)
        @name = name 
        @genre = genre 
        @artist = artist
        @@count = @@count + 1 
        @@genres << self.genre
        @@artists << self.artist
    end 

    def self.count 
        @@count
    end 

    def self.genres
        @@genres.uniq()
    end 

    def self.artists 
        @@artists.uniq()
    end

    def self.genre_count
        # I had to look up this interation  
        Hash[*@@genres.group_by{ |v| v }.flat_map{ |k, v| [k, v.size] }]
    end 

    def self.artist_count
        # I had to look up this interation  
        Hash[*@@artists.group_by{ |v| v }.flat_map{ |k, v| [k, v.size] }]
    end 
end