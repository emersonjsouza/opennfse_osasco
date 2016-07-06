module OpennfseOsasco
  class Tomador
    include Extensions::MassAssignment

    attr_accessor :cnpj

    attr_accessor :bairro

    attr_accessor :cidade

    attr_accessor :complemento

    attr_accessor :uf

    attr_accessor :logradouro

    attr_accessor :numero

    attr_accessor :pais

    attr_accessor :tipo_logradouro

    attr_accessor :nome

    private
    def before_initialize
      self.pais = "Brasil"
    end
  end
end
