module CarrierWave
  class SanitizedFile
    def self.sanitize_regexp
      @sanitize_regexp ||= /[:word:]+/
    end
  end
end
