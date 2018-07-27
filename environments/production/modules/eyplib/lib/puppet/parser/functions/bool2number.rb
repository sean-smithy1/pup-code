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
Puppet::Parser::Functions::newfunction(:bool2number, :type => :rvalue, :doc => <<-EOS
Transform a supposed boolean to 1 or 0. Other values through.
EOS
) do |args|
  raise(Puppet::ParseError, "bool2number() wrong number of arguments. Given: #{args.size} for 1)") if args.size != 1

  arg = args[0]

  if arg.nil? or arg == false or arg =~ /false/i or arg =~ /off/i or arg == :undef
    return '0'
  elsif arg == true or arg =~ /true/i or arg =~ /on/i
    return '1'
  end

  return arg.to_s
end
