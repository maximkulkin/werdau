class ApplicationController < ActionController::Base
  protect_from_forgery

  cache_sweeper :taxon_sweeper
end
