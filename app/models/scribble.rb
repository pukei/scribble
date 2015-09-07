class Scribble < ActiveRecord::Base
  before_save :markup_markdown

  private

  def markup_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    self.content = markdown.render self.content
  end
end
