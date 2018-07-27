require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'systemd timer type' do
  context 'timer setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'systemd': }

      systemd::service { 'test':
        execstart => '/bin/sleep 60',
        before    => Service['test'],
      }

      systemd::timer { 'test':
        on_boot_sec => '1',
        before    => Service['test'],
      }

      service { 'test.timer':
        ensure  => 'running',
        require => Class['::systemd'],
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file("/etc/systemd/system/test.timer") do
      it { should be_file }
      its(:content) { should match 'on_boot_sec=1' }
    end

    it "systemctl status" do
      expect(shell("systemctl status test.timer").exit_code).to be_zero
    end

    it "check sleep" do
      expect(shell("ps -fea | grep sleep").exit_code).to be_zero
    end
  end
end
