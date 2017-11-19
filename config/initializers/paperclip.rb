module Paperclip
  # do not require any validations
  REQUIRED_VALIDATORS = []

  # do not complain when missing validations
  class Attachment
    def missing_required_validator?
      false
    end
  end

  # skip media type spoof detection
  module Validators
    class MediaTypeSpoofDetectionValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        true
      end
    end
  end

end