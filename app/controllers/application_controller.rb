require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post'/teams' do
        # binding.pry
        @team = Team.new(params[:team])
        
        params[:team][:super_heros].each do |details|
            Super_hero.new(details)
        end

        @superheros = Super_hero.all
        # binding.pry
        erb :team
    end

end
