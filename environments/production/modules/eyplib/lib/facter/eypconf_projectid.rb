if File.exists?('/opt/eypconf/id/projectid.sh') then
  userid = Facter::Util::Resolution.exec('bash /opt/eypconf/id/projectid.sh').to_s
else
  userid = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/projectid ]; then cat /opt/eypconf/id/projectid | paste -sd,; fi\'').to_s
end

unless userid.nil? or userid.empty?
  Facter.add('eypconf_projectid') do
      setcode do
        userid
      end
  end

  Facter.add('eypconf_projectid_uppercase') do
      setcode do
        userid.upcase
      end
  end

  Facter.add('eypconf_projectid_lowercase') do
      setcode do
        userid.downcase
      end
  end
end
