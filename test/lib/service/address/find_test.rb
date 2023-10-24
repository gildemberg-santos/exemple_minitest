# frozen_string_literal: true

require 'minitest/autorun'
require 'active_record'
require 'httparty'
require 'service/application_service'
require 'service/address/find'

module Service
  module Address
    class FindTest < Minitest::Test
      def test_call
        $address = []
        address_create
        assert_equal '01001-000', address_find.cep
        assert_equal 'Praça da Sé', address_find.logradouro
        assert_equal 'lado ímpar', address_find.complemento
        assert_equal 'Sé', address_find.bairro
        assert_equal 'São Paulo', address_find.localidade
        assert_equal 'SP', address_find.uf
        assert_equal '3550308', address_find.ibge
        assert_equal '1004', address_find.gia
        assert_equal '11', address_find.ddd
        assert_equal '7107', address_find.siafi
      end

      def address_create
        @address_create ||= Service::Address::Create.new(cep: '01001-000').call
      end

      def address_find
        @address_find ||= Service::Address::Find.new(cep: '01001-000').call
      end
    end
  end
end
