require 'active_support/all'

require 'period/version'
require 'period/year'

module Period #:nodoc:
  def self.current_time
    Time.current
  end
end
