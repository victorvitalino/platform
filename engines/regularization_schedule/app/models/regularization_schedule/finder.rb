class Finder
  include ActiveModel::Model
    extend  ActiveModel::Naming
  extend  ActiveModel::Translation

  attr_accessor :cpf, :name

  validates :cpf, cpf: true, allow_blank: true

  def search(code)
    @reference = Regularization::Requeriment.where('?' code)
  end
end