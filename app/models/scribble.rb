class Scribble < ActiveRecord::Base
  attr_accessor :markup
  after_find :markup_content

  private

  def markup_content
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    self.markup = markdown.render self.content
  end
end
