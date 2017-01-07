require 'bundler/setup'
require 'date'
require 'sinatra'
require 'haml'

require_relative 'config.rb'

set :bind, $ip
set :port, 80
set :static, true
# set :public_folder, 'static'
set :views, 'views'
set :environment, :development # Change this to :production when ready

get '/' do
  '<h2> Personal image hosting website <a href="https://github.com/Cyan101/nekogirls-rb">Nekogirls-rb</a></h2>'
  # haml :index, format: :html5
end

# Disable this if Nginx is serving files for you
get '/*/:file' do
  send_file("./public/#{params['splat'].first}/" + params[:file])
end

get '/upload/?' do
  haml :upload, format: :html5
end

post '/upload/?' do
  fileid = unique_id
  filetype = File.extname(params['file_to_upload'][:filename])
  unless $banned_ext.include?(filetype.downcase)
    return 'Invalid server access code' unless params['code'] == $servercode
    File.open('./public/p/' + fileid + filetype, 'w') do |f|
      f.write(params['file_to_upload'][:tempfile].read)
    end
  end
  return "http://#{$domain}/#{$savefolder}/#{fileid}#{filetype.downcase}"
end

not_found do
  status 404
  '<h2>shit erm... we seem to have lost that page....</h2>'
  # haml :404, format: :html5
end

#---------------------------------------------------
def unique_id
  DateTime.now.strftime('%Q').to_i.to_s52
end

class Numeric
  Alpha52 = ('a'..'z').to_a + ('A'..'Z').to_a
  def to_s52
    return '' if self < 1
    s = ''
    q = self
    loop do
      q, r = (q - 1).divmod(52)
      s.prepend(Alpha52[r])
      break if q.zero?
    end
    s
  end
end