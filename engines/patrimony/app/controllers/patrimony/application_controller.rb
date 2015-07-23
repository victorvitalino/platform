module Patrimony
  class ApplicationController < ActionController::Base
    layout 'layouts/material'
    include Pundit

    helper ::ApplicationHelper
  end
end
