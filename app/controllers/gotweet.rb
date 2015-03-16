get '/user/:id/tweets' do
   @twitter_user = Twitteruser.find(params[:id])
   @tweets = @twitter_user.tweets.order('id DESC').limit(10)

erb :gotweet

end

post '/user/:id/tweets' do

	@twitter_user = Twitteruser.find(params[:id])
	@tweet = Tweet.create(twitteruser_id: params[:id], text: params[:tweet])

	$client.update(@tweet.text)
	@tweets = @twitter_user.tweets.order('id DESC').limit(10)

	erb :gotweet, layout: false

end