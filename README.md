#tweetHaiku
Check it out at tweethaik.us

###What is it?
tweetHaiku is a Rails app I made in my spare time that parses the twitter feed and finds tweets that are accidentally haikus (i.e., have a 5/7/5 syllable breakdown). The best of these tweets are then posted to tweethaik.us where users can log in to upvote them and view the top tweets. I used Rails for the site with Ruby for the actual twitter API parsing, plus materialize.css to help styling.


###How does it work?
A little Ruby script I wrote parses the twitter feed using the twitter gem. It filters tweets first by only those written in english (I was using the whatlanguage gem, but I'm transitioning it to il8n as I'm interested in internationalization), then filters out tweets with non-syllabic symbols such as "@", "RT", and URLs. The Rails app is a simple CRUD app with authentication and authorization.

###Can I contribute?
Yes! Please submit a pull request, or [drop me a line](http://lev.io).

###Moving forwards
Like I said, I want to start using the il8n gem instead of the whatlanguage gem. I also want to increase the filter quality to a degree where I no longer have to get rid of tweets that slip by my criteria. What I'm most afraid of is perfectly valid tweethaikus being posted that are incredibly offensive - I've found a number of tweets that I feel entirely uncomfortable posting. But this endeavor has been made worth it by the rest of the tweets, which cover the emotional spectrum ranging from tragic to funny to profound.
