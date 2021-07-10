module Jekyll
  class WobblyText < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      @input = input
    end

    def render(context)
      chars = @input.split('')
      strength = 3
      return "<span>" + chars.each_with_index.map { |c,i|
        "<span style='display: inline-block; transform: translateY(#{Math.cos(i.to_f * Math::PI / 2) * strength}px);'>#{c}</span>"
      }.join + "</span>"
    end
  end
end

Liquid::Template.register_tag('wobbly_text', Jekyll::WobblyText)
