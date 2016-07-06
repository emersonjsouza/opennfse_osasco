require 'spec_helper'

describe OpennfseOsasco do

  it "chave de acesso deve ser obrigatoria para emissao NFS-e" do
    expect { OpennfseOsasco::Nfse.new }.to raise_error(StandardError)
  end

  it "deve ser obrigatorio informar o valor da NFS-e antes de emitir" do
    nfse = OpennfseOsasco::Nfse.new("CHAVE-ACESSO")
    expect { nfse.register }.to raise_error(StandardError)
  end

  it "deve ser obrigatorio numero NFS-e após emitir" do
    nfse = OpennfseOsasco::Nfse.new("CHAVE-ACESSO")
    nfse.homologacao = true
    nfse.valor = 0.10
    nfse.tributacao = {atividade: 1.08}
    nfse.notificar_tomador_Email = true
    nfse.tomador = {cnpj: "17855616000147", bairro: "Cidade Monções", nome: "Empresa",
                    cidade: "São Paulo", complemento: "4° andar", uf: "SP",
                    logradouro: "Arizona", numero: "10", pais: "Brasil", tipo_logradouro: "Rua"}

    response = nfse.register
    expect(response[:emitir_response][:emitir_result][:erro]).to eq(false)
  end
end
