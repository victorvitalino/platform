module Concourse
  class Nav < ActiveRecord::Base
    belongs_to :page

    enum page_action: [:link_interno, :inscricao, :link_externo, :envio_projeto, :consulta]
    enum target: [:normal,:blank]
    
    validates_presence_of :link, :order
    validates :page_action, inclusion: { in: Concourse::Nav.page_actions }
    validates :target, inclusion: { in: Concourse::Nav.targets }
    validates :page_id, presence: true, if: :internal_page?
    validates :external_link, presence: true, if: :external_page?

    private

    def internal_page?
      self.link_interno?
    end

    def external_page?
      self.link_externo?
    end

  end
end
