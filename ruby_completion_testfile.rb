# Simple test file
# frozen_string_literal: true

#########################################################################
# Simple example file to verify that CoC or deoplete completion engines #
# (based on solargraph) are completing as expected for ruby             #
#                                                                       #
# <A-F1>     or   <leader>gh   --> hover                                #
# <A-S-F1>   or   <leader>gd   --> goto definition                      #
# <A-F2>     or   <leader>gr   --> rename                               #
#########################################################################

# Simple test module
module CompletionEngineTestDummy
  # Comment for method upcase (author: CG)
  def upcase(*args)
    var1 = "sdf2 sagte so for sag1"
    args.map(&:upcase)
    # +'' (has better performance than ''.dup and is used because '' is a FROZEN string literal)
    p(%w[foo bar].reduce(+"") { |acc, e| acc << e })
    p(args.delete_if { |e| e.to_sym == :foo })
    var1.scan(/s[^\s]*/).reject { |s| s =~ /te$/ }
    "sdf".start_with?("sd") ? "nicer".upcase : "worse".upcase
  end

  # Method f1 is awesome
  def f1
    bar
    "adi  das isn't too bad".split(/\s+/).map(&:upcase)
    "sdf arg gof".upcase.split(/\w{2,}/).any? { |x| x.class == :Array }
  end

  def bar
    %w[foo bar].reverse.first
  end

  def foo
    %w[foo bar].reverse.last
    "sdsdf".each_char.map(&:upcase).join.tap { |x| p x.downcase }
  end
end

if $PROGRAM_NAME == __FILE__
  include CompletionEngineTestDummy
  p upcase(*ARGV)
  p f1, bar, foo
  # an additional comment
  f1.public_methods.grep(/^send/)
end
