class Scribble < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessor :markup
  after_find :markup_content

  scope :published, -> { where(on: true) }

  private

  def markup_content
    renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true, prettify: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true, fenced_code_blocks: true)
    self.markup = markdown.render self.content
  end
end
