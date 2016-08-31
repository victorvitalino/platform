module Entity
  class Cadastre < ActiveRecord::Base

    belongs_to :city, class_name: "Address::City"

    has_many :situations
    has_many :inspections
    has_many :situation_status, through: :situations

    has_many :documents
    has_many :document_categories, through: :documents
    has_many :members
    has_many :candidates
    has_many :candidate, through: :candidates

    has_many :realties
    has_many :activities

    audited

    scope :situation, -> (status) {
      Entity::Cadastre.joins(:situations)
      .where('entity_situations.situation_status_id = (SELECT MAX(entity_situations.situation_status_id)
              FROM entity_situations WHERE entity_situations.cadastre_id = entity_cadastres.id)')
      .where('entity_situations.situation_status_id = ?', status)
    }

    scope :senders, -> {
      where(id: Entity::Document.all.map(&:cadastre_id))
    }

    scope :active_documents, -> {
      Entity::Document.where(document_category_id: Entity::DocumentCategory.actives.map(&:id))
    }

    scope :complete, -> {
      count = active_documents.select('cadastre_id')
                              .group('cadastre_id')
                              .having('count(cadastre_id) >= 11')

      where(id: count)
    }

    scope :cnpj,  -> (cnpj) {where(cnpj: cnpj)}
    scope :name_entity,  -> (name_entity) {where(name: name_entity)}
    scope :fantasy_name,  -> (fantasy_name) {where(fantasy_name: fantasy_name)}

    attr_accessor :password_confirmation, :current_password, :change_password, :president

    validates :cnpj, cnpj: true, presence: true, uniqueness: true
    validates :name, :fantasy_name,:city, :cep, :address, :complement, :number, presence: true
    validates :email, email: true, presence: true
    validates :telephone, presence: true, numericality: true
    validates :telephone_optional, :celphone, numericality: true, allow_blank: true
    validates :password, :password_confirmation, presence: true, length: { minimum: 6, maximum: 16}, on: :create
    validate  :unique_password, on: :create


    validate  :update_password, if: :change_password?

    after_create :set_situation

    def president
      obj = self.members.where(member_job_id: 2)
      
      obj.present? ? obj.first.name : nil
    end

    def password
      "[FILTRED]"
    end

    def new_entity?
      Entity::Old.find_by_cnpj(self.cnpj) rescue false
    end

    private

    def change_password?
      self.change_password.present?
    end

    def update_password
      unless self.password == self.password_confirmation
        errors.add(:password, "senha não confere")
      end

      unless self.current_password == self.password
        errors.add(:current_password, "senha não confere")
      end
    end


    def unique_password
      errors.add(:password, "As senhas não são iguais") unless (self.password == self.password_confirmation)
    end

    def set_situation
      self.situations.create({
        situation_status_id: 1
      })
    end
  end
end
