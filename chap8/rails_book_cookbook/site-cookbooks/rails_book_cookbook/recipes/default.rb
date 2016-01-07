#
# Cookbook Name:: rails_book_cookbook
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w[openssl libssl-dev libreadline-dev].each do |pkg|
    package pkg do
        action :install
    end
end
