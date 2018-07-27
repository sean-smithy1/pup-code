if File.exists?('/opt/eypconf/id/servergroup.sh') then
  servergroup = Facter::Util::Resolution.exec('bash /opt/eypconf/id/servergroup.sh').to_s
else
  servergroup = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/servergroup ]; then cat /opt/eypconf/id/server; fi\'')
end

unless servergroup.nil? or servergroup.empty?
  Facter.add('eypconf_servergroup') do
      setcode do
        servergroup
      end
  end

  Facter.add('eypconf_servergroup_uppercase') do
      setcode do
        servergroup.upcase
      end
  end

  Facter.add('eypconf_servergroup_lowercase') do
      setcode do
        servergroup.downcase
      end
  end
end
