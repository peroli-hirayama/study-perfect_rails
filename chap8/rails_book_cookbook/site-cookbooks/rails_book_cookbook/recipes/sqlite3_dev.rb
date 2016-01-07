# Cookbook Name:: rails_book_cookbook
# Recipe:: keys

#package "libsqlite3-dev"
package "sqlite-dev" do
    package_name value_for_platform(
        %w[centos redhat suse fedora] => { "default" => "sqlite-devel" },
        "default" => "libsqlite3-dev"
    )
end
