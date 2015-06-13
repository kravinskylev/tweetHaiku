require 'syllables'
require 'twitter'
require 'whatlanguage'

class SyllableCount

  def count(text)
    count = 0
    Syllables.new(text.downcase).to_h.each do | word, val |
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
        puts tweet.text unless tweet.text.include?("@") || tweet.text.include?("/\d/") || tweet.text.include?("http") || tweet.text.include?("#")
      end
    end
  end
end

x = TweetParser.new
x.filter

#a = SyllableCount.new
#puts a.count("I don't tweet much but in this moment I feel like saying Won't he do it!").values.reduce(:+)

#Many people lose the small joys in the hope for the big happiness
#This is the kind of woman I would want to be with in partnership.
#You see that tweet and instantly wonder " Who's responsible for this ?? "
#Hurry up September! I'm trying to be done with school already
#can i charm box of pasta with a spell so my pipi can get licked
#Worry is a form of praying for what you don't want ~ Bhagavan Das
#How you spend your day determines if you'll have a good workout or not.
#don't know what's it like to be the most hated? ask me, I'll fill ya in.
#I wish there was a pill I can take to make me not upset and stressed..
#Justin Bieber's mom wanted to be an actress when she was younger
#Can today please end the way I need it to. That'd be magnificent
#I hate waiting for my fake tan to dry before I can get in to bed
#Getting a bloody nose at work is about as classy as it gets
#Let's count how many people give me looks for my music being loud
