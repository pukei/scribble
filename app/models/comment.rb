class Comment < ActiveRecord::Base
  belongs_to :scribble

  include RenderMarkdown
  def markup
    markdown.render self.comment
  end
end
