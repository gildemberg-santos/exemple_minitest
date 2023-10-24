# frozen_string_literal: true

require 'pry'
require 'pry-reload'
require 'httparty'
require 'active_record'
require_relative 'lib/service/application_service'
require_relative 'lib/service/address/create'
require_relative 'lib/service/address/find'
require_relative 'lib/service/address/delete'

# Crie seu programa aqui

# Service::Address::Create.new(cep: '01001000').call
# Service::Address::Find.new(cep: '01001-000').call
# Service::Address::Delete.new(cep: '01001000').call

Pry.start(binding)
