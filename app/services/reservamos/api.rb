# frozen_string_literal: true

module Reservamos
  class Api
    include HTTParty
    base_uri 'https://search.reservamos.mx/api'

    def places(query)
      self.class.get('/v2/places', {
                       query: {
                         q: query
                       }
                     })
    end
  end
end
