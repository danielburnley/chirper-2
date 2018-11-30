module Chirper
  module Domain
    class Chirp
      attr_accessor :title, :body
    end
  end

  module UseCase
    class CreateChirp
      def initialize(chirp_gateway:)
        @chirp_gateway = chirp_gateway
      end

      def execute(*)
        chirp = Chirper::Domain::Chirp.new
        chirp.title = "Meow"
        chirp.body = "Cat"
        @chirp_gateway.create(chirp)
      end
    end
  end
end