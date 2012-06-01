require 'sprockets'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets'
  run environment
end

map '/' do
  run Rack::File.new 'zengarden-sample.html'
end
