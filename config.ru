require 'sprockets'
require 'handlebars_assets'

map '/assets' do
  env= Sprockets::Environment.new
  puts HandlebarsAssets.path
  env.append_path HandlebarsAssets.path
  env.append_path 'assets/js'
  env.append_path 'assets/css'
  run env
end

map '/' do
  run Rack::File.new 'index.html'
end

map '/404' do
  run Rack::File.new '404.html'
end
