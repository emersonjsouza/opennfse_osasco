# Biblioteca de integração de NFS-e via API com sistema da prefeitura de Osasco

## Descrição

A biblioteca opennfse_osasco em Ruby possui total integração com serviço de nfse-e da prefeitura de Osasco.

##Instalação

 - Adicione a biblioteca ao seu Gemfile.

```ruby
gem 'opennfse_osasco'
```
 - Execute o comando bundle install.

## Emissão de NFS-e

 - Para iniciar uma emissão de NFS-e, você precisa criar uma instancia da classe 'OpennfseOsasco::Nfse' e informar sua chave de acesso do para emissão de NFS-e via API

```ruby
nfse = OpennfseOsasco::Nfse.new("CHAVE-ACESSO")

nfse.valor = 0.10
nfse.tributacao = {atividade: 1.08}
nfse.tomador = {cnpj: "00000000000000", bairro: "Jd Veloso", nome: "Empresa",
                cidade: "São Paulo", complemento: "4° andar", uf: "SP",
                logradouro: "Benedito Alves turibio", numero: "10", pais: "Brasil", tipo_logradouro: "Rua"}

nfse.register
```

 - Para emitir NFS-e em homologação a propriedade homologacao da classe 'OpennfseOsasco::Nfse' precisa estar true

```ruby
nfse.homologacao = true
```

## Contribuições

Achou e corrigiu um bug ou tem alguma feature em mente e deseja contribuir?

* Faça um fork
* Adicione sua feature ou correção de bug (`git checkout -b my-new-feature`)
* Commit suas mudanças (`git commit -am 'Added some feature'`)
* Rode um push para o branch (`git push origin my-new-feature`)
* Envie um Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
