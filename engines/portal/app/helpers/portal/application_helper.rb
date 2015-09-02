module Portal
  module ApplicationHelper
    def link_each(category)
      @category = Cms::NavCategory.find_by_name(category)
      if @category.present? && @category.navs.present?
        @category.navs.each do |n|
          yield n
        end
      end
    end

    def batata(categories)
  		@sliderss = categories
  		if @sliderss == 'habitação'
  				@sliderss = 'habitacao'
  		elsif @sliderss == 'regularização'
  				@sliderss = 'regularizacao'
  		else
  			@sliderss = categories
  		end

  			yield @sliderrs
  	end

    def link_to_nav(nav)
      if nav.pagina?
        link_to nav.name, portal.page_path(nav.link_page.id), target: nav.target if nav.link_page.present?
      else
        link_to nav.name, nav.link_external, target: nav.target
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
