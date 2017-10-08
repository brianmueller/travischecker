require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    
    user_repo_url = "https://github.com/bmuellerhstat/01-methods-parameters-lab"
    user_name = "bmuellerhstat"
    user_repo = get_repo_name(user_repo_url)
    user_name_repo = "#{user_name}/#{user_repo}"
    
    get_prs(user_name_repo)
    Pr.all.each do |pr|
        get_info(pr,user_name_repo,pr.sha)
    end
    
    
    
    erb :index
  end
  
end
