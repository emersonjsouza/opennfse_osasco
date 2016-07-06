require 'erb'
require 'savon'

require "opennfse_osasco/extensions/ensure_type"
require "opennfse_osasco/extensions/mass_assignment"
require "opennfse_osasco/tomador"
require "opennfse_osasco/tributacao"
require "opennfse_osasco/version"

module OpennfseOsasco
  class Nfse
    include Extensions::MassAssignment
    include Extensions::EnsureType

    attr_reader :tomador

    attr_reader :tributacao

    attr_reader :chave_autenticacao

    attr_accessor :homologacao

    attr_accessor :notificar_tomador_Email

    attr_accessor :valor

    def initialize(chave_autenticacao)
      @chave_autenticacao = chave_autenticacao
    end

    def tributacao=(tributacao)
      @tributacao = ensure_type(Tributacao, tributacao)
    end

    def tomador=(tomador)
      @tomador = ensure_type(Tomador, tomador)
    end

    def register
      validar_informacoes

      client = Savon.client(wsdl: url)
      client.call(:emitir, xml: to_xml).body
    end

    private
    def before_initialize
      @notificar_tomador_Email = false
    end

    def to_xml
      ERB.new(File.read(template)).result(binding)
    end

    def template
      File.join(File.dirname(__FILE__), "../etc/schemas/template_nfse_osasco.erb")
    end

    def url
      "https://www.nfeosasco.com.br/EissnfeWebServices/NotaFiscalEletronica.svc?wsdl"
    end

    def validar_informacoes
      raise NoMethodError if @valor < 0
    end
  end
end
