# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  before_filter :set_facebook_session
  
  include AuthenticatedSystem
  
  layout "application"

  helper_method :facebook_session

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  # Paginate item list if present, else call default paginate method.
def paginate(arg, options = {})
  if arg.instance_of?(Symbol) or arg.instance_of?(String)
# Use default paginate function.
  collection_id = arg # arg is, e.g., :specs or "specs"
  super(collection_id, options)
  else
# Paginate by hand.
  items = arg # arg is a list of items, e.g., users
  items_per_page = options[:per_page] || 10
  page = (params[:page] || 1).to_i
  result_pages = Paginator.new(self, items.length, items_per_page, page)
  offset = (page - 1) * items_per_page
 [result_pages, items[offset..(offset + items_per_page - 1)]]
   end
 end
 
end
