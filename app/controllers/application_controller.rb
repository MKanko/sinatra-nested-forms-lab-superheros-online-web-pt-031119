require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end 

    post '/teams' do
        
        @team = (params[:team][:name])
        @motto = (params[:team][:motto]) 

        @hero_names = []
        @hero_powers =[] 
        @hero_bios = []   
        
        params[:team][:members].each do |member_info|
            @hero_names << member_info[:name] 
            @hero_powers << member_info[:power]
            @hero_bios << member_info[:bio]                                    
        end
        #binding.pry  
        erb :team 
    end 

end
