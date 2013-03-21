module Matcher
  extend self

  def flag(targets, compares)
    f = compares.reduce(false) { |flag, compare| flag ||= targets.all? { |target| !match(target, compare) } }
    targets.reduce(f) { |flag, target| flag ||= compares.all? { |compare| !match(target, compare) } }
  end

  def match(target, compare)
    (tokenize(target) - tokenize(compare)).empty?
  end

  def tokenize(string)
    string.split(' ')
  end

end
