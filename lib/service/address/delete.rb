# frozen_string_literal: true

module Service
  module Address
    class Delete < ApplicationService
      attr_accessor :cep

      validates :cep, presence: true

      def initialize(cep:)
        @cep = cep
        $address ||= []
      end

      def call
        tmp_present = !delete?
        delete
        tmp_present && delete?
      end

      private

      def delete
        $address.delete_if { |address| address.cep == @cep }
      end

      def delete?
        Service::Address::Find.new(cep: @cep).call.nil?
      end
    end
  end
end
