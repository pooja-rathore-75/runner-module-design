# runner-module-design

=============================
module Runner
  # you have to write code here

end

## Don't change below code
class A
  include Runner

  def process
    puts 'A'
    {nameA: 'A'}
  end
end

class B
  include Runner

  run A

  def process
    puts 'B'
    {nameB: 'B'}
  end
end

class C < B
  def process
    puts 'C'
    {nameC: 'C'}
  end
end

class D < B
  run C

  def process
    puts 'D'
    {nameD: 'D'}
    super

    run A
  end

end

D.new({asd: 33}).()

#output there
# D
# B
# A
# C
# A
# A
============================

