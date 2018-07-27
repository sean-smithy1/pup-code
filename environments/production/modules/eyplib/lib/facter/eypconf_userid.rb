if File.exists?('/opt/eypconf/id/userid.sh') then
  userid = Facter::Util::Resolution.exec('bash /opt/eypconf/id/userid.sh').to_s
else
  userid = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/userid ]; then cat /opt/eypconf/id/userid | paste -sd,; fi\'').to_s
end

unless userid.nil? or userid.empty?
  Facter.add('eypconf_userid') do
      setcode do
        userid
      end
  end

  Facter.add('eypconf_userid_uppercase') do
      setcode do
        userid.upcase
      end
  end

  Facter.add('eypconf_userid_lowercase') do
      setcode do
        userid.downcase
      end
  end
end
