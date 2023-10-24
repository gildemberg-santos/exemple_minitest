# frozen_string_literal: true

require 'minitest/autorun'
require 'active_record'
require 'httparty'
require 'service/application_service'
require 'service/address/create'

module Service
  module Address
    class CreateTest < Minitest::Test
      def test_call
        $address = nil
        assert_equal true, address_create
      end

      def test_call_address
        $address = nil
        address_create
        assert_equal '01001-000', $address.first.cep
        assert_equal 'Praça da Sé', $address.first.logradouro
        assert_equal 'lado ímpar', $address.first.complemento
        assert_equal 'Sé', $address.first.bairro
        assert_equal 'São Paulo', $address.first.localidade
        assert_equal 'SP', $address.first.uf
        assert_equal '3550308', $address.first.ibge
        assert_equal '1004', $address.first.gia
        assert_equal '11', $address.first.ddd
        assert_equal '7107', $address.first.siafi
      end

      def address_create
        @address_create ||= Service::Address::Create.new(cep: '01001-000').call
      end
    end
  end
end
