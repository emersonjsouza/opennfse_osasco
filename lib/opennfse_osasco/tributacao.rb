module OpennfseOsasco
  class Tributacao
      include Extensions::MassAssignment

      attr_accessor :aliquota

      attr_accessor :substituicao_tributaria

      attr_accessor :valor_csll

      attr_accessor :valor_cofins

      attr_accessor :valor_deducao

      attr_accessor :valor_inss

      attr_accessor :valor_ir

      attr_accessor :valor_outros_impostos

      attr_accessor :valor_pis_pasep

      attr_accessor :atividade

      private
      def before_initialize
        self.aliquota = 0
        self.substituicao_tributaria = false
        self.valor_csll = 0
        self.valor_cofins = 0
        self.valor_deducao = 0
        self.valor_inss = 0
        self.valor_ir = 0
        self.valor_outros_impostos = 0
        self.valor_pis_pasep = 0
      end
    end
end
