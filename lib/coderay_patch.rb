require_dependency 'redmine/syntax_highlighting'

module Redmine
  module SyntaxHighlighting
    module CodeRay
      require 'pygments.rb'

      class << self
        def highlight_by_language(text, language)
          result = Pygments.highlight(text, :lexer => language, :formatter => 'html', :options => {:linenos => 'inline'})
          result.gsub!(/^<div class="highlight"><pre>/, '<span class="highlight">')
          result.gsub!(/<\/pre>\n<\/div>\n$/, '</span>')
          result
        end
      end
    end
  end
end
