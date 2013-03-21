module Matcher
  extend self

  def flag(targets, compares)
    compare(targets, compares) || compare(compares, targets)
  end

  def compare(targets, compares)
    targets.detect { |target| compares.all? { |compare| !match(target, compare) } }
  end

  def match(target, compare)
    (tokenize(target) - tokenize(compare)).empty?
  end

  def tokenize(string)
    string.split(' ')
  end

end
