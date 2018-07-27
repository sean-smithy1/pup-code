if File.exists?('/opt/eypconf/id/magic.sh') then
  magichash = Facter::Util::Resolution.exec('bash /opt/eypconf/id/magic.sh').to_s
else
  magichash = Facter::Util::Resolution.exec('bash -c \'if [ -f /opt/eypconf/id/.magic ]; then cat /opt/eypconf/id/.magic | paste -sd,; else echo "deadbeef"; fi\'').to_s
end

unless magichash.nil? or magichash.empty?
  Facter.add('eypconf_magic_hash') do
      setcode do
        magichash
      end
  end
end
