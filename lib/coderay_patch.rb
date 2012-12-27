require_dependency 'redmine/syntax_highlighting'

module Redmine
  module SyntaxHighlighting
    module CodeRay
      require 'pygments.rb'

      class << self
        def highlight_by_filename(text, filename)
          begin
            language = Pygments.lexer_name_for(:filename => filename)
          rescue
            language = 'text'
          end
          language = 'perl' if language == 'prolog'
          language ? highlight_by_language(text, language, false) : ERB::Util.h(text)
        end

        def highlight_by_language(text, language, with_lineno=true)
          options = with_lineno ? {:linenos => 'inline'} : {}
          result = Pygments.highlight(text, :lexer => language, :formatter => 'html', :options => options)
          result.gsub!(/^<div class="highlight"><pre>/, '')
          result.gsub!(/<\/pre>\n<\/div>\n$/, '</span>')
          result.gsub!(/^/m, '<span class="highlight">')
          result.gsub!(/$/m, '</span>')
          result
        end
      end
    end
  end
end
