class Scribble < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  paginates_per 5
  max_paginates_per 10

  attr_accessor :markup
  after_find :markup_content

  scope :published, -> { where(on: true) }

  default_scope -> { order('created_at desc') }

  private

  def markup_content
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, prettify: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true, fenced_code_blocks: true)
    self.markup = markdown.render self.content
  end
end
