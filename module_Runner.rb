module Runner

  def self.included(base)
    base.extend(ClassMethods)
  end

  def initialize(args = {})
  end

  def call
    process
  end

  def run(runner)
    self.class.run(runner, :append)
    runner.process
  end

  module ClassMethods
    def process
      new.process
      @@arr.each {|arr| arr.process }
    end

    def run(klass, method = :prepend)
      @@arr ||= []
      @@arr.send(method, klass.new)
    end
  end
end

class A
  include Runner

  def process
    puts 'A'
    { nameA: 'A' }
  end
end

class B
  include Runner
  run A

  def process
    puts 'B'
    { nameB: 'B' }
  end
end

class C < B
  def process
    puts 'C'
    { nameC: 'C' }
  end
end

class D < B
  run C
  
  def process
    puts 'D'
    { nameD: 'D' }
    super

    run A
  end
end

D.new({ asd: 33 }).()
