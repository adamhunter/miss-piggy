module MissPiggy
  extend self

  def flag(targets, compares)
    !(matches(targets, compares) && matches(compares, targets))
  end

  def matches(targets, compares)
    targets.all? { |target| compares.any? { |compare| match(target, compare) } }
  end

  def match(target, compare)
    (tokenize(target) - tokenize(compare)).empty?
  end

  def tokenize(string)
    string.split(' ')
  end

end
