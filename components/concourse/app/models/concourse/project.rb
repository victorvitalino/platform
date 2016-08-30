module Concourse
  class Project < ActiveRecord::Base

    extend FriendlyId
    
    audited
    
    friendly_id :title, use: :slugged
    
    scope :sliders, -> {where(slider: true)}
    scope :active, -> { where(status: true )}
    
    has_many :pages
    has_many :navs
    has_many :subscribes
    has_many :candidates, through: :subscribes
    has_many :candidate_participations, through: :candidates
    has_many :participations
    has_many :consults
    has_many :winners
    has_many :resources
    
    enum step: ['desenvolvimento', 'previsto', 'aberto', 'finalizado']

    scope :waiting,     -> {where(step:[0,1], status: true)}
    scope :opens,       -> {where(step: 2)}
    scope :finisheds,   -> {where(step: 3)}

    validates_presence_of :title, :mini_description, :apresentation
    validates_date :start, before: :end, presence: true
    validates_date :end, after: :start, presence: true
    
    validates_date :consultation_start, before: :end, presence: true
    validates_date :consultation_end,   after: :start, presence: true
    
    mount_uploader :image_logo,   ImageUploader
    mount_uploader :image_header, ImageUploader
    mount_uploader :image_footer, ImageUploader
    mount_uploader :image_slider, ImageUploader
    mount_uploader :result_document, FileUploader

    def consultation_time?
        (self.consultation_start <= Date.today && self.consultation_end >= Date.today)
    end

    def should_generate_new_friendly_id?
        new_record?
    end
  end
end
