# frozen_string_literal: true

require 'minitest/autorun'
require 'active_record'
require 'httparty'
require 'service/application_service'
require 'service/address/delete'

module Service
  module Address
    class DeleteTest < Minitest::Test
      def test_call
        $address = []
        address_create
        assert_equal true, address_delete
        assert_equal false, address_delete
      end

      def address_create
        @address_create ||= Service::Address::Create.new(cep: '01001-000').call
      end

      def address_delete
        Service::Address::Delete.new(cep: '01001-000').call
      end
    end
  end
end
