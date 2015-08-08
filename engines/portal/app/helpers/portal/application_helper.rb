module Portal
  module ApplicationHelper
    def link_each(category)
      @navs = Cms::NavCategory.active_navs(category)
      @navs = @navs.navs if @navs.present? 
      @navs.each do |n|
        yield n
      end
    end

    def link_to_nav(nav)
      if nav.pagina?
        link_to nav.name, portal.page_path(nav.link_page), target: "#{(nav.target)}"
      else
        link_to nav.name, nav.link_external, target: "#{(nav.target)}"
      end
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
