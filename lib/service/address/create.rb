# frozen_string_literal: true

module Service
  module Address
    class Create < ApplicationService
      attr_reader :cep, :logradouro, :complemento, :bairro, :localidade, :uf, :ibge, :gia, :ddd, :siafi

      validates :cep, :logradouro, :complemento, :bairro, :localidade, :uf, :ibge, :gia, :ddd, :siafi, presence: true

      def initialize(cep:)
        @cep = cep
        $address ||= []
      end

      def call
        address(request)
        return false unless valid?

        delete
        $address << self
        true
      end

      private

      def delete
        Service::Address::Delete.new(cep: @cep).call
      end

      def request
        HTTParty.get(url, headers: headers)
      end

      def url
        "https://viacep.com.br/ws/#{@cep}/json/"
      end

      def headers
        { 'Content-Type': 'application/json' }
      end

      def address(response)
        @cep = response['cep']
        @logradouro = response['logradouro']
        @complemento = response['complemento']
        @bairro = response['bairro']
        @localidade = response['localidade']
        @uf = response['uf']
        @ibge = response['ibge']
        @gia = response['gia']
        @ddd = response['ddd']
        @siafi = response['siafi']
      end
    end
  end
end
