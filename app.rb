require_relative 'config/environment'

class App < Sinatra::Base

    configure do
        enable :sessions
        set :session_secret, 'flatiron'
      end


    get '/' do 
        erb :index
    end


    post '/checkout' do
        session[:user] = params[:user]
        session[:payment_method] = params[:payment_method]
        session[:item] = params[:item]
        


        @user = params[:user]
        @shipping_address = params[:shipping_address]
        @payment = params[:payment_method]
        @special_item = params[:item]
        @special_item_price = params[:item_cost]

        @items =  params[:items]
       
      
        @item_name = []
        @item_price  = []
        @item_quantity = []
        @item_total = []

        @items.each do |item|
            @item_name << item[:name]
            @item_price << item[:price]
            @item_quantity << item[:quantity]
            @item_total << (item[:price].to_f * item[:quantity].to_f).to_s
        end

        @session = session
        erb :checkout
 
    end


    
end