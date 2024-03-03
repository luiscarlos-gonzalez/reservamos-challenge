module Reservamos
  class ReservamosApi
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
