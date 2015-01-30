require_relative 'app/cortex_blog'
require 'sprockets'
require 'sprockets/bowerrc'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.append_path 'bower_components/foundation'
  environment.append_bowerrc
  run environment
end

map '/' do
  run Cortex::Blog
end
