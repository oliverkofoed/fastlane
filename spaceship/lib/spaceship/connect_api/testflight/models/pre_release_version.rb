require_relative '../../model'
module Spaceship
  module ConnectAPI
    module TestFlight
      class PreReleaseVersion
        include Spaceship::ConnectAPI::Model

        attr_accessor :version
        attr_accessor :platform

        attr_mapping({
          "version" => "version",
          "platform" => "platform"
        })

        def self.type
          return "preReleaseVersions"
        end
      end
    end
  end
end
