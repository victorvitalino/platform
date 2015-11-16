module Concourse
  class Project < ActiveRecord::Base

    extend FriendlyId
  
    friendly_id :title, use: :slugged
    
    default_scope { where('publish = true AND step <> 0' ) }
    scope :sliders, -> {where(slider: true)}
    scope :active, -> { where(status: true )}
    
    has_many :pages
    has_many :navs
    has_many :subscribes
    has_many :candidates, through: :subscribes
    has_many :participations
    has_many :consults

    
    enum step: ['desenvolvimento', 'previsto', 'aberto', 'finalizado']

    validates_presence_of :title, :mini_description, :apresentation, :image_logo
    validates_date :start, before: :end, presence: true
    validates_date :end, after: :start, presence: true
    
    validates_date :consultation_start, before: :end, presence: true
    validates_date :consultation_end,   after: :start, presence: true
    
    mount_uploader :image_logo,   ImageUploader
    mount_uploader :image_header, ImageUploader
    mount_uploader :image_footer, ImageUploader
    mount_uploader :image_slider, ImageUploader

    def consultation_time?
        (self.consultation_start <= Date.today && self.consultation_end >= Date.today)
    end
  end
end
