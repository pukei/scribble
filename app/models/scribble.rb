class Scribble < ActiveRecord::Base
  # friendly ID config
  extend FriendlyId
  friendly_id :title, use: :slugged

  # kamninari configs
  max_paginates_per 10
  paginates_per 5

  # scopes
  default_scope -> { order('created_at desc') }
  scope :published, -> { where(on: true) }

  has_many :comments

  include RenderMarkdown
  def markup
    markdown.render self.content
  end
end
