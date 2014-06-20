module Period
  class Year
    attr_reader :year

    def initialize(args = {})
      @year = args.fetch(:year)
    end
  end
end
