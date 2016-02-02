module Address
  class ApplicationController < ActionController::Base
       layout 'remark'
  	helper ::ApplicationHelper

       include Pundit

  end
end
