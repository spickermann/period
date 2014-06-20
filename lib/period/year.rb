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

    def previous
      self.class.new(:year => year - 1)
    end
    alias :prev :previous

    def next
      self.class.new(:year => year + 1)
    end

    def ==(other)
      other.instance_of?(self.class) && year == other.year
    end
  end
end
