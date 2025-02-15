require_relative '../../model'
module Spaceship
  module ConnectAPI
    module TestFlight
      class BuildDelivery
        include Spaceship::ConnectAPI::Model

        attr_accessor :cf_build_version
        attr_accessor :cf_build_short_version_string
        attr_accessor :platform
        attr_accessor :uploaded_date

        attr_mapping({
          "cfBundleVersion" => "cf_build_version",
          "cfBundleShortVersionString" => "cf_build_short_version_string",
          "platform" => "platform",
          "uploadedDate" => "uploaded_date"
        })

        def self.type
          return "buildDeliveries"
        end

        #
        # API
        #

        def self.all(app_id: nil, version: nil, build_number: nil)
          resps = testflight_client.get_build_deliveries(
            filter: { app: app_id, cfBundleShortVersionString: version, cfBundleVersion: build_number },
            limit: 1
          ).all_pages
          return resps.map(&:to_models).flatten
        end
      end
    end
  end
end
