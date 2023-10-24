# Serviço para Cadastro de Endereços

Estou utilizando uma variavel global `$address`

## Cadastro

Exemplo de uso para cadastrar um endereço

```ruby
Service::Address::Create.new(cep: '01001000').call

puts $address
```

## Deletrar

Exemplo de uso para deletar um endereço

```ruby
Service::Address::Delete.new(cep: '01001000').call

puts $address
```

## Pesquisa

Exemplo de uso para pesquisa um endereço

```ruby
Service::Address::Find.new(cep: '01001000').call

puts $address
```

## Test

Rodar todos os testes

```bash
rake test
```
