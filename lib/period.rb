require 'active_support'
require 'active_support/core_ext/date'
require 'active_support/core_ext/time'

require 'period/version'

require 'period/year'

module Period
  def self.current_time
    Time.now
  end
end
