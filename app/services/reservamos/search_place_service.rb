# frozen_string_literal: true

module Reservamos
  class SearchPlaceService < ApplicationService
    attr_reader :q

    def initialize(q)
      @q = q
    end

    def call
      reservamos_api = Api.new
      places = reservamos_api.places(@q)
      places[0]
    end
  end
end
