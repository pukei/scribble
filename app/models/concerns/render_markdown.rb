module RenderMarkdown
  extend ActiveSupport::Concern

  def markdown
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, prettify: true)
    Redcarpet::Markdown.new(renderer, autolink: true, tables: true, fenced_code_blocks: true)
  end
end
