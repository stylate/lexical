require 'sinatra'
require './special_lexicon.rb'

set :haml, :format => :html5

configure do
  set :lexicon, SpecialLexicon.new
end

get '/' do
  haml :index
end

get '/anagrams/:word' do
  output = settings.lexicon.get_anagrams(params[:word])
  if output.is_a? String
    return output
  end
  output.join(', ')
end

get '/prefixed/:pre' do
  output = settings.lexicon.get_prefixed_words(params[:pre])
  if output.is_a? String
    return output
  end
  output.join(', ')
end

get '/word_ladder/:start/:end' do
  output = settings.lexicon.get_word_ladder(params[:start], params[:end])
  # error handling
  if output.is_a? String
    return output
  end
  output.join(' -> ')
end
