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

# CSS für Projekt Übersicht
class FormerBaseHtml < Redmine::Hook::ViewListener
  render_on :view_layouts_base_html_head, :partial => 'pygments_css'
end
