module PaperTrailGlobalid
  module PaperTrail
    def whodunnit=(value)
      value = value.is_a?(ActiveRecord::Base) ? value.to_gid : value
      if defined?(request)
        request.whodunnint = value
      else
        super(value)
      end
    end

    def actor
      ::GlobalID::Locator.locate(whodunnit) || whodunnit
    end
  end
end
