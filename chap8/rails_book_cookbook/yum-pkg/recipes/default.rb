#
# Cookbook Name:: yum-pkg
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
%w[openssl libssl-dev libreadline-dev].each do |pkg|
    package pkg do
        action :install
    end
end
