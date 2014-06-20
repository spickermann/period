module Period
  class Year
    attr_reader :year

    def initialize(args = {})
      @year = args.fetch(:year)
    end

    def self.from_time(time)
      new(:year => time.year)
    end

    def self.current
      from_time(Period.current_time)
    end
  end
end
