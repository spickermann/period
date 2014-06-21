module Period #:nodoc:
  module VERSION #:nodoc:
    MAJOR = 0
    MINOR = 0
    BUILD = 1
    PRE   = 'pre'

    STRING = [MAJOR, MINOR, BUILD, PRE].compact.join('.')
  end
end
