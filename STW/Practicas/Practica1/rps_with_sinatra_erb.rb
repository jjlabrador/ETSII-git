require 'sinatra'
require 'erb'

# before we process a route we'll set the response as plain text
# and set up an array of viable moves that a player (and the
# computer) can perform
before do
  @defeat = { rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end

get '\/' do
	erb :intro
end

get '/throw' do
	redirect "/throw/#{@params[:play].to_sym}"
end

get '/throw/:type?' do
  # the params hash stores querystring and form data
  halt(403, "Empty string doesn't allow!") if params[:type].nil? 

  @player_throw = params[:type].to_sym.downcase
  
  halt(403, "You must throw one of the following: '#{@throws.join(', ')}'") unless @throws.include? @player_throw
  
  @computer_throw = @throws.sample

  if @player_throw == @computer_throw 
    @answer = "There is a tie"
  elsif @player_throw == @defeat[@computer_throw]
    @answer = "Computer wins; #{@computer_throw} defeats #{@player_throw}"
  else
    @answer = "Well done. #{@player_throw} beats #{@computer_throw}"
  end
  erb :index
end
