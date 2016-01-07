# Cookbook Name:: rails_book_cookbook
# Recipe:: iptables
include_recipe "simple_iptables"

# set INPUT as DROP as default policy
simple_iptables_policy "INPUT" do
    policy "DROP"
end

# allow local loopback
simple_iptables_rule "local" do
    rule "--in-interface lo"
    jump "ACCEPT"
end

# allow connection which has already established
simple_iptables_rule "established" do
    rule "-m conntrack --ctstate ESTABLISHED,RELATED"
    jump "ACCEPT"
end

# allow SSH
simple_iptables_rule "ssh" do
    rule "--proto tcp --dport 22"
    jump "ACCEPT"
end

# allow HTTP, HTTPS
simple_iptables_rule "http" do
    rule [ "--proto tcp --dport 22",
           "--proto tcp --dport 443" ]
    jump "ACCEPT"
end
