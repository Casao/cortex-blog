require 'sinatra/base'
module Cortex
  class Blog < ::Sinatra::Base

    set :root, File.dirname(__FILE__)

    def feed(params=nil)
      [{title: "Post 1", body: "Lorem Ipsum"}, {title: "Post 2", body: "Lorem Ipsum"}, {title: "Post 3", body: "Lorem Ipsum"}]
    end

    def index
      @posts = feed
      haml :feed
    end

    get '/' do
      @posts = feed
      haml :feed, layout: true
    end
  end
end