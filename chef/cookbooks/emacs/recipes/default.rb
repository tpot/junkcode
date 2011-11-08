directory "#{ENV['HOME']}/.emacs.d" do
  mode 0755
  action :create
end

["init.el", "feature-mode.el"].each do |file|
  cookbook_file "#{ENV['HOME']}/.emacs.d/#{file}" do
    source "#{file}"
    mode 0644
  end
end
