require 'sinatra'
require 'syntaxi'

class String
  
  def formatted_body(lang)
    styles = {:ruby => "syntax_ruby", :xml => "xml", :yaml => "yaml"}
    source = "[code lang='#{lang.to_s}']
    #{self}
    [/code]"
    html = Syntaxi.new(source).process
    %Q{
      <div class="syntax #{styles[lang.to_sym]}">
      #{html}
      </div>
    }
  end
end

get '/' do
  erb :new
end

post '/' do
  input = params[:body]
  type_language = params[:language] || "ruby"
  erb :show, :locals => {:highlight => input, :type => type_language}
end