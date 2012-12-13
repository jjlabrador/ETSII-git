# coding: utf-8
require 'sinatra'

set server: 'thin', connections: [], h: {}

get '/' do
   halt erb(:login) unless params[:user]
   erb :chat, locals: { user: params[:user].gsub(/\W/, '') }
end

get '/stream/:user', provides: 'text/event-stream' do
   stream :keep_open do |out|
      settings.connections << out
      settings.h.store(params[:user].to_s.to_sym, out.__id__)
      settings.connections.each { |out| out << "data: #{Time.now} => --- #{params[:user]} ha entrado al chat ---\n\n" }
      out.callback { user_exit = out.__id__  # Id del usuario que sale del chat
                     settings.connections.delete(out)
                     settings.connections.each { |channel| channel << "data: #{Time.now} => --- #{settings.h.key(user_exit)} ha salido del chat ---\n\n"}
                     settings.h.delete(settings.h.key(user_exit)) # Lo borramos del hash de usuarios
                   }
   end
end

post '/' do
   str = params[:msg]
   message = str.split
   
   if !(message[1].to_s =~ /^\/.+:$/)              # Si no es individualizado hace un broadcast a todos.
                                                   # Si se manda a un usuario que no existe, el mensaje no se mostrará.
      settings.connections.each { |out| out << "data: #{Time.now} => #{params[:msg]}\n\n" }
   else
     trasmitter = message[0].to_s.delete ":"       # Emisor del mensaje
     receiver = message[1].to_s.delete "/:"        # Receptor del mensaje
     id_receiver = settings.h[receiver.to_sym]     # Id del canal del receptor
     id_trasmitter = settings.h[trasmitter.to_sym] # Id del canal del emisor
     index_receiver, index_transmitter = nil, nil
     
     settings.connections.each { |k| if k.__id__ == id_receiver
                                        index_receiver = settings.connections.index(k) # Posición del array que contiene el id del canal del receptor
                                     else if k.__id__ == id_trasmitter
                                        index_transmitter = settings.connections.index(k) # Posición del array que contiene el id del canal del emisor
                                     end
                                  end}
     
     message.delete_at(0) # Borramos el emisor del mensaje
     message.delete_at(0) # Borramos al receptor del mensaje, asi mandaremos unicamente el cuerpo del mensaje
     settings.connections[index_receiver] << "data: #{Time.now} => #{trasmitter}: #{message.join(" ")} (privat message)\n\n"
     settings.connections[index_transmitter] << "data: #{Time.now} => #Privat message to #{receiver}: #{message.join(" ")}\n\n"
   end
   204 # response without entity body
end
