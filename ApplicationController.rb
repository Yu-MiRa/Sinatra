require'sinatra'
require 'rubygems'
require 'bundler'
require 'ApplicationController'
Bundler.require

class ApplicationController < Sinatra::Base
  get '/' do
    "<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
  end

  end
  run ApplicationController