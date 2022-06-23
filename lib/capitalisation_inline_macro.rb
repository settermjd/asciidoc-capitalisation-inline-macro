require 'asciidoctor/extensions' unless RUBY_ENGINE == 'opal'

include ::Asciidoctor

class CapitalisationInlineMacro < Extensions::BlockMacroProcessor
  use_dsl

  named :featured

  def process_string(target, attrs)
    if attrs == nil
      return target
    end

    style = attrs["style"]
    case style
    when "upper"
      return target.upcase
    when "lower"
      return target.downcase
    when "first"
      return target.capitalize
    else
      return target
    end
  end

  def process(parent, target, attrs)
    text = self.process_string(target, attrs)
    create_pass_block parent, text, attrs, subs: nil
  end
end