# Simple file to verify that depoplete completion engine (based on ) is working (completing) as expected for ruby
module Misc
  def upcase(*args)
    args.map(&:upcase)
    p(%w[foo bar].reduce { |acc, e| acc << e })
    p(args.delete_if { |e| e.to_sym == :foo })
    'sdf2 sagte so for sag1'.scan(/s[^\s]*/).reject { |s| s =~ /te$/ }
    'sdf'.start_with?('sd') ? 'nice'.upcase : 'bad'.upcase
  end

  def f1
    'adi  das isn\'t too bad'.split(/\s+/).map(&:upcase)
    'sdf arg gof'.upcase.split(/\w{2,}/).any? { |x| x.class == :Array }
  end

  def bar
    %w[foo bar].reverse.first
  end

  def foo
    %w[foo bar].reverse.last
    'sdfsdf'.reverse.upcase.split.last
  end
end


if $PROGRAM_NAME == __FILE__
  include Misc
  p upcase(*ARGV)
  p f1, bar, foo
end
