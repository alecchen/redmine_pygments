require_dependency 'redmine/syntax_highlighting'
require 'nokogiri'

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
          output = Nokogiri::HTML(Pygments.highlight(text, :lexer => language, :formatter => 'html', :options => options))
          # Get first <pre> and rewrite to div
          highlighted_code = output.xpath('//pre')[0]
          highlighted_code.name = 'div'
          highlighted_code.set_attribute("class", "highlight")
          # Return rewrite html
          highlighted_code.to_s
        end
      end
    end
  end
end
