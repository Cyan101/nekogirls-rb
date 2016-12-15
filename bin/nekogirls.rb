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


get '/' do
  '<h2> Personal image hosting website <a href="https://github.com/Cyan101/nekogirls-rb">Nekogirls-rb</a></h2>'
  # Temporary "Home" Page
end

get '/p/:file' do
  send_file('./public/p/' + params[:file])
end

get '/upload/?' do
  haml :upload, format: :html5
end

post '/upload/?' do
  fileid = get_unqiue_id
  filetype = File.extname(params['file_to_upload'][:filename])
  unless $banned_ext.include?(filetype.downcase)
    File.open('./public/p/' + fileid + filetype, 'w') do |f|
      f.write(params['file_to_upload'][:tempfile].read)
    end
  end
  return "http://#{$domain}/#{$savefolder}/#{fileid}#{filetype.downcase}"
end

not_found do
  status 404
  '<h2>shit erm... we seem to have lost that page....</h2>' # Temporary 404 Page
end



#---------------------------------------------------
def get_unqiue_id
  return DateTime.now.strftime('%Q').to_i.to_s52
end

class Numeric
  Alpha52 = ("a".."z").to_a + ("A".."Z").to_a
  def to_s52
    return "" if self < 1
    s, q = "", self
    loop do
      q, r = (q - 1).divmod(52)
      s.prepend(Alpha52[r])
      break if q.zero?
    end
    s
  end
end