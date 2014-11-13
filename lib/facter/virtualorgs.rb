# virtalorgs.rb
# provides a list of virtual organisations that are provided
# with the directory /etc/grid-security/vomsdir. i.e VOs which
# a particular service supports.

Facter.add('virtualorgs') do
  setcode do
    begin
      Dir.entries('/etc/grid-security/vomsdir').select{|entry| !(entry =='.' || entry == '..')}.join(' ')
    rescue Exception
      Facter.debug('virtualorgs - No vos in /etc/grid-security/vomsdir')
    end
  end
end

