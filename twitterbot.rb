require 'twitter'
require 'pry'

#Streaming de tweet
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end


#Connexion


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end


#Spam Journalists

list_journalist = ["@LColcomb","@Zlauwereys","@MeLonguet","@DorotheeLN","@NolwennCosson","@ADaboval","@Remibaldy","@bderveaux","@amandechap","@ELODIESOULIE","@charles_dacquay"]

list_journalist.each do |x|   
#Fetch the most recents tweets of a user (par IDs) 
tweet_id = client.user_timeline(x)

#Puts the tweets IDs
puts (tweet_id)

#Like the list of tweet
client.favorite(tweet_id)
end


# Judge bot

itsyou_replies = [
                   	"It's definitely you.",
					"It's you.",
					"It's you. It's always been you.",
					"Let me think about that... it's you.",
					"Let me think about that... it's definitely you.",
					"Let me think about that... it's you. It's always been you.",
					"Let me think about that... Yup. It's definitely you.",
					"Let me think about that... Yup. It's you.",
					"Let me think about that... Definitely you.",
					"Definitely you.",
					"Just you.",
					"Sorry, but it's you.",
					"It's you. Sorry!",
					"Sorry, just you.",
					"It's definitely you. Sorry!",
					"Only you.",
					"It's only you.",
					"Nope. Just you.",
					"Nope. Only you.",
					"Nope. Definitely you.",
					"Nope. Just you. Sorry!",
					"Nope. Only you. Sorry!",
					"Nope. Definitely you. Sorry!"
                  ]

itsyou = itsyou_replies.sample

client.search("%22is+it+me+or%22", result_type: "recent").take(1).each do |tweet|

  client.update("@#{tweet.user.screen_name} #{itsyou}", in_reply_to_status_id: tweet.id)

end




