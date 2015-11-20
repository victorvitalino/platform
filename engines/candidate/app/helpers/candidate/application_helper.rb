module Candidate
  module ApplicationHelper
    def paginate(count = 0, current_page = 1)
      pages = count / 10
      p = []
      5.times do |index|
        current_page_x = (current_page.to_i > 1) ? current_page.to_i - 1 : 1  
        p << current_page_x + index
      end
      html = <<-HTML
        <nav>
          <ul class="pagination">
      HTML
      p.each do |l|
        html += <<-HTML
          <li><a href="#{url_for(page: l)}">#{l}</a></li>
        HTML
      end 
      html += <<-HTML 
          </ul>
        </nav>
      HTML

      html.html_safe
    end
  end
end
