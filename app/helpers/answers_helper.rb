module AnswersHelper
  RENDERER = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code: true)

  def render_with_code(text)
    RENDERER.render(text).html_safe
  end
end
