require 'syllables'
require 'twitter'
require 'whatlanguage'

class SyllableCount

  def count(text)
    count = 0
    Syllables.new(text.downcase).to_h.each do |word, val|
      count += val
    end
  end
end

class TweetParser
  attr_accessor :client, :tweet_count
  CHARS = ("a".."z").to_a.join(",")

  def initialize
    @client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "qEoKMuB52Gsw3s9nJjOWxAa4A"
      config.consumer_secret     = "cA0tXqkViv5Dx46zbIEVlHbgq6T6Fv2nTaf2ICP4ilmrF69z5Q"
      config.access_token        = "3118649162-IqXyf9G7qGMmFSOwlbg2RhctoA0QVXTVnw2eMAO"
      config.access_token_secret = "pSoXyuJQ0mO7KoBOfMXi1O8h3H3NiOnz9JIGukiKhITj6"
    end
  end

  def filter
    @tweet_count = SyllableCount.new
    @client.filter(track: CHARS) do |tweet|
      if tweet.text.language == :english &&  @tweet_count.count(tweet.text).values.reduce(:+) == 17
        puts tweet.text unless
        tweet.text.include?("@") || tweet.text.include?("/\d/") || tweet.text.include?("http") || tweet.text.include?("#")
      end
    end
  end
end

feed = TweetParser.new
feed.filter


