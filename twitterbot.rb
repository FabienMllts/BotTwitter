require 'twitter'
require 'pry'

#Streaming de tweet
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "Ho9QYdye8TohywVWSW3CfTaN6"
  config.consumer_secret     = "CVce3fXmoYmtM6VL4K51sn73a7XBxj98Z1dffPZbuDIwFqDbl0"
  config.access_token        = "953572764547518465-yxfEpb4DVw2V8BymrKz3Jl9MGSxBu7a"
  config.access_token_secret = "JDeIvorOE2NdXwtPJpbQZtDOBmxnbG2uIS7jNMpojVpiU"
end


#Connexion


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "Ho9QYdye8TohywVWSW3CfTaN6"
  config.consumer_secret     = "CVce3fXmoYmtM6VL4K51sn73a7XBxj98Z1dffPZbuDIwFqDbl0"
  config.access_token        = "953572764547518465-yxfEpb4DVw2V8BymrKz3Jl9MGSxBu7a"
  config.access_token_secret = "JDeIvorOE2NdXwtPJpbQZtDOBmxnbG2uIS7jNMpojVpiU"
end


#Spam Journalists

#Fetch the most recents tweets of a user (par IDs) 
tweet_id = client.user_timeline("@emiliel3","@EliseLucet","@OlivierMarin1","@alaurefremont","@mwesfreid","@ChBaDe","@pmathon","@theobaldmarie","@marclandre","@paoliniesther","@Feertchak","@JBLitzler","@GuillaumeErrard","@quentinperinel","@TristanQM","@mlbo","@constancejamet","@LoraTerrazas","@emiliegeffray","@Mathilde_Sd","@CaroPiquet","@DCanivez")

#Puts the tweets IDs
puts (tweet_id)

#Like the list of tweet
client.favorite(tweet_id)


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




