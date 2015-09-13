class Scribble < ActiveRecord::Base

  # friendly ID config
  extend FriendlyId
  friendly_id :title, use: :slugged

  # kamninari configs
  max_paginates_per 10
  paginates_per 5

  # callbacks and accessors
  after_find :markup_content
  attr_accessor :markup

  # scopes
  default_scope -> { order('created_at desc') }
  scope :published, -> { where(on: true) }

  private

  def markup_content
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, prettify: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true, fenced_code_blocks: true)
    self.markup = markdown.render self.content
  end
end
