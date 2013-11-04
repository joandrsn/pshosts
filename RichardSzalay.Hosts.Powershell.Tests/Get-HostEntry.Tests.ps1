$hostsFile = $env:temp + "\pshosts_hosts"

Import-Module ..\RichardSzalay.Hosts.Powershell\bin\Debug\PsHosts.psd1

Describe "HasEntries" {
    Context "When there are host entries" {
        "127.0.0.1 hostname`n127.0.0.1 hostname2" > $hostsFile
        
        $results = Get-HostEntry -HostsFile $hostsFile
    
        It "returns them as entries" {
            $results.length | Should Be 2
        }
    }
}