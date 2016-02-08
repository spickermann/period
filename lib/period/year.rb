module Period #:nodoc:
  class Year #:nodoc:
    attr_reader :start, :finish
    attr_reader :year

    def initialize(year: Period.current_time.year)
      @year = year

      time = Time.local(year)

      @start  = time.beginning_of_year
      @finish = time.end_of_year
    end

    def self.from(time: Period.current_time, string: nil)
      if string
        new(year: string.to_i)
      else
        new(year: time.year)
      end
    end

    def previous
      self.class.new(year: year - 1)
    end
    alias prev previous

    def next
      self.class.new(year: year + 1)
    end

    def ==(other)
      other.instance_of?(self.class) && year == other.year
    end

    def cover?(time)
      to_r.cover?(time)
    end

    def to_r
      (start..finish)
    end

    def to_s
      year.to_s
    end
  end
end
