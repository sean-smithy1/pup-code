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
Puppet::Parser::Functions::newfunction(:retcode2bool, :type => :rvalue, :doc => <<-EOS
Tranform a return code to a bool:
0: true
other return codes: false
EOS
) do |args|
  raise(Puppet::ParseError, "retcode2bool() wrong number of arguments. #{args.size} vs 1)") if args.size != 1

  arg = args[0]

  if arg == 0
    return true
  else
    return false
  end
end
