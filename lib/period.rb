require 'active_support'
require 'active_support/core_ext'

require 'period/version'

require 'period/year'

module Period
  def self.current_time
    Time.now
  end
end
