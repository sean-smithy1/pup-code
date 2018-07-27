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
Puppet::Parser::Functions::newfunction(:yesno2bool, :type => :rvalue, :doc => <<-EOS
Transform a supposed string ('yes', 'true' or 'no', 'false') to a bool (true or false).
Unexpected values will return true and nil value (undef) will return false
EOS
) do |args|
  raise(Puppet::ParseError, "bool2yesno() wrong number of arguments. #{args.size} vs 1)") if args.size != 1

  arg = args[0]

  if arg.nil? or arg == false or arg =~ /false/i or arg =~ /no/i or arg == :undef
    return false
  else
    return true
  end
end
