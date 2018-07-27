if File.exists?('/opt/eypconf/id/env.sh') then
  env = Facter::Util::Resolution.exec('bash /opt/eypconf/id/env.sh').to_s
else
  env = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/env ]; then cat /opt/eypconf/id/env | paste -sd,; fi\'').to_s
end

unless env.nil? or env.empty?
  Facter.add('eypconf_env') do
      setcode do
        env
      end
  end

  Facter.add('eypconf_env_uppercase') do
      setcode do
        env.upcase
      end
  end

  Facter.add('eypconf_env_lowercase') do
      setcode do
        env.downcase
      end
  end

end
