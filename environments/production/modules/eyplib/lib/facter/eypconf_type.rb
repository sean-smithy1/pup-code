if File.exists?('/opt/eypconf/id/type.sh') then
  nodetype = Facter::Util::Resolution.exec('bash /opt/eypconf/id/type.sh').to_s
else
  nodetype = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/type ]; then cat /opt/eypconf/id/type | paste -sd,; fi\'')
end

unless nodetype.nil? or nodetype.empty?
  Facter.add('eypconf_type') do
      setcode do
        nodetype
      end
  end

  Facter.add('eypconf_type_uppercase') do
      setcode do
        nodetype.upcase
      end
  end

  Facter.add('eypconf_type_lowercase') do
      setcode do
        nodetype.downcase
      end
  end
end
