module Attendance
  class MirrorService
    
    attr_accessor :cadastre_id, :mirror_id

    def clone_to_mirror(cadastre_id)
      @cadastre = Candidate::Cadastre.find(cadastre_id) rescue nil
      return false if @cadastre.nil?

      @mirror   = @cadastre.cadastre_mirrors.new
  
      @cadastre.attributes.each do |key, value|
        unless %w(id created_at updated_at).include? key
          @mirror[key] = value if @mirror.attributes.has_key?(key)
        end
      end

      if @mirror.save
        self.mirror_id = @mirror.id
        clone_dependents(@mirror.id, @cadastre.id) 
      end
    end

    private

    def clone_dependents(mirror_id, cadastre_id)
      @mirror     = Candidate::CadastreMirror.find(mirror_id)
      @dependents = Candidate::Dependent.where(cadastre_id: cadastre_id)
      
      @dependents.each do |dependent|
        @new_dependent = @mirror.dependent_mirrors.new 
        dependent.attributes.each do |key, value|
          unless %w(id created_at updated_at).include? key 
            @new_dependent[key] = value
          end
        end

        @new_dependent.save
      end
    end
  end
end