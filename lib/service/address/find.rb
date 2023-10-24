# frozen_string_literal: true

module Service
  module Address
    class Find < ApplicationService
      attr_reader :cep

      validates :cep, presence: true

      def initialize(cep:)
        @cep = cep
        $address ||= []
      end

      def call
        return nil unless valid?

        @call ||= $address.select { |address| address.cep == @cep }.first
      end
    end
  end
end
