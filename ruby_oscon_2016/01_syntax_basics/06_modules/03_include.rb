module Enumerable
  def find_all
    # ...
  end
  def partition
    # ...
  end
  def sort
    # ...
  end
end

class Array
  include Enumerable
end

class Dir
  include Enumerable
end
