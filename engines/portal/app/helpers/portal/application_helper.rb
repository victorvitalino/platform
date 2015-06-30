module Portal
  module ApplicationHelper
    def link_each(category)
      @nav = Cms::Nav.where(category: category, publish: true )
    end

    def slider_each(limit = 10, order = 'ASC')
      @slider = Cms::Post.where(slider: true ,publish: true).limit(limit).order("created_at #{order}")

      @slider.each do |s|
        yield s
      end
    end

    def post_each(limit = 10, order = 'ASC')
      @post = Cms::Post.where(publish: true).limit(limit).order("created_at #{order}")

      @post.each do |p|
        yield p
      end
    end
  end
end
