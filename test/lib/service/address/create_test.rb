# frozen_string_literal: true

require 'minitest/autorun'
require 'active_record'
require 'httparty'
require 'service/application_service'
require 'service/address/create'

module Service
  module Address
    class CreateTest < Minitest::Test
      def test_call_success
        $address = nil
        assert_equal true, address('01001-000')
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

      def test_call_fail
        $address = nil
        assert_equal false, address(nil)
      end

      def address(cep)
        Service::Address::Create.new(cep: cep).call
      end
    end
  end
end
