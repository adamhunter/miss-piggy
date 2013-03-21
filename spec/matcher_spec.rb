require 'spec_helper'

describe Matcher do
  it "is a module" do
    expect(Matcher).to be_a Module
  end

  describe "flagging" do
    describe "flags" do

      {
        [1, 'Adam Hunter']               => ['Some Other Dude'],
        [2, 'Adam Hunter']               => ['Some Dude', 'Adam Hunter'],
        [3, 'Adam Hunter', 'Miss Piggy'] => ['Adam DJ Hunter'],
        [4, 'Adam Hunter', 'Miss Piggy'] => ['Adam Hunter', 'Little Mermaid'],
        [5, 'Adam Hunter', 'Miss Piggy'] => ['Some Other Dude'],
        [6, 'Miss Piggy']                => ['Piggy Adam'],

      }.each do |targets, compares|
        targets.shift
        it "#{targets.join(' and ')} when compared to #{compares.join(' and ')}" do
          expect(targets).to flag(compares)
        end
      end
    end

    describe "doesn't flag" do

      {
        ['Adam Hunter', 'Miss Piggy']  => ['Adam Hunter', 'Miss Piggy'],
        ['Miss Piggy',  'Adam Hunter'] => ['Adam Hunter', 'Miss Piggy'],
        ['Adam Hunter']                => ['Adam Hunter'],
        ['Miss Piggy']                 => ['Piggy Miss'],

      }.each do |targets, compares|
        it "#{targets.join(' and ')} when compared to #{compares.join(' and ')}" do
          expect(targets).not_to flag(compares)
        end
      end
    end
  end

  describe "matching" do
    let(:name) { 'Adam Hunter' }

    describe "matches" do

      tests = {

        'exact names'                   => 'Adam Hunter',
        'names with different initials' => 'Adam DC Hunter',
        'names with suffixes'           => 'Adam Hunter Jr',
        'names in a different order'    => 'Hunter Adam',
        'all parts in the target name'  => 'Adam Van Hunter',
        'despite presence of 2nd name'  => 'Adam Hunter & Miss Piggy'

      }.each do |description, compare|
        it description do
          expect(name).to match(compare)
        end
      end

    end

    describe "doesn't match" do
      tests = {

        'completely different names' => 'James Earl Jones',
        'partial names'              => 'Rebecca Hunter'

      }.each do |description, compare|
        it description do
          expect(name).not_to match(compare)
        end
      end
    end
  end

end
