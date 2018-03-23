class Settings
  class << self

    def active_admin_enabled?
      @active_admin_enabled ||= ENV.fetch('ENABLE_ACTIVE_ADMIN', 'false')
      @active_admin_enabled == 'true' || @active_admin_enabled == '1'
    end

  end
end
