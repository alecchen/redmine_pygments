require 'redmine'
require 'coderay_patch'

Redmine::Plugin.register :redmine_pygments do
  name 'Redmine Pygments plugin'
  author 'Alec Chen'
  description 'This is a syntax highlight plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/alecchen/redmine_pygments'
  author_url 'http://about.me/alecchen'
end
