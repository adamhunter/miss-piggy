module Matcher
  extend self

  def flag(targets, compares)
    compare(targets, compares) || compare(compares, targets)
  end

  def compare(targets, compares)
    targets.reduce(false) { |flag, target| flag ||= compares.all? { |compare| !match(target, compare) } }
  end

  def match(target, compare)
    (tokenize(target) - tokenize(compare)).empty?
  end

  def tokenize(string)
    string.split(' ')
  end

end
