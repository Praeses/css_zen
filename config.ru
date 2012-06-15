require 'sprockets'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/js'
  environment.append_path 'assets/css'
  run environment
end

map '/' do
  run Rack::File.new 'index.html'
end

map '/404' do
  run Rack::File.new '404.html'
end
