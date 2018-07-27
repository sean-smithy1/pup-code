# shamesly stolen from: https://github.com/puppetlabs/puppetlabs-apache/blob/master/lib/puppet/parser/functions/bool2httpd.rb
# with minor changes
#
#
#Copyright (C) 2012 Puppet Labs Inc
#
#Puppet Labs can be contacted at: info@puppetlabs.com
#
#Licensed under the Apache License, Version 2.0 (the "License");
#
#
Puppet::Parser::Functions::newfunction(:bool2yn, :type => :rvalue, :doc => <<-EOS
Transform a supposed boolean to yes or no. Pass all other values through.
Given a nil value (undef), bool2yn will return 'N'
EOS
) do |args|
  raise(Puppet::ParseError, "bool2yn() wrong number of arguments. #{args.size} vs 1)") if args.size != 1

  arg = args[0]

  if arg.nil? or arg == false or arg =~ /false/i or arg =~ /no/i or arg == :undef
    return 'N'
  elsif arg == true or arg =~ /true/i or arg =~ /yes/i
    return 'Y'
  end

  return arg.to_s
end
