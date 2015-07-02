module Cms
  class NavCategory < ActiveRecord::Base
    has_many :navs, foreign_key: 'category_id'

    default_scope { where(status: true ) }

    scope :active_navs, -> (category) { find_by_name(category) }

    validates_presence_of :name, :description
  end
end
