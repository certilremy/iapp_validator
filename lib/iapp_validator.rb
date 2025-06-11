# frozen_string_literal: true

require_relative "iapp_validator/version"

module IappValidator
  class Error < StandardError; end
  require "google/apis/androidpublisher_v3"
  require "googleauth"

   class GooglePlayValidator
    AndroidPublisher = Google::Apis::AndroidpublisherV3

    def initialize(json_key_path: nil)
      json_key_path ||= File.expand_path("config/credentials/google_play_service_account.json", Dir.pwd)
      scope = "https://www.googleapis.com/auth/androidpublisher"

      @service = AndroidPublisher::AndroidPublisherService.new
      @service.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
        json_key_io: File.open(json_key_path),
        scope: scope
      )
    end

    def verify_purchase(package_name, product_id, token)
  begin
    purchase = @service.get_purchase_product(package_name, product_id, token)
    {
      success: purchase.purchase_state == 0,
      error: nil
    }
  rescue Google::Apis::Error => e
    {
      success: false,
      error: e.message
    }
  end
end
  end
end
