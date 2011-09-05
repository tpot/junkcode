directory "#{ENV['HOME']}/.emacs.d" do
  mode 0755
  action :create
end

cookbook_file "#{ENV['HOME']}/.emacs.d/init.el" do
  source "init.el"
  mode 0644
end

