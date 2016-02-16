module Cms
  class NavCategory < ActiveRecord::Base
    has_many :navs, foreign_key: 'category_id'

    audited
    
    default_scope { where(status: true ) }
    validates_presence_of :name, :description
  end
end
