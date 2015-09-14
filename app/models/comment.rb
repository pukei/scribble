class Comment < ActiveRecord::Base
  belongs_to :scribble

  default_scope -> { order('created_at DESC') }

  include RenderMarkdown
  def markup
    markdown.render self.comment
  end
end
