require 'nokogiri'

def create_project_hash
  projects = {:projects => {}}
  
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  
  projects_array =  kickstarter.css("li.project.grid_4")
  
  p projects_array.first.css("h2.bbcard_name strong a").text
  
  p projects_array.first.css("div.project-thumbnail a img").attribute("src").value
  p projects_array.first.css("p.bbcard_blurb").text
  
  projects_array.first.css("ul.project-stats li.first.funded strong").text
  
  projects_array.each do |el|
    title = el.css("h2.bbcard_name strong a").text 
    img = el.css("div.project-thumbnail a img").attribute("src").value 
    description = el.css("p.bbcard_blurb").text
    location = el.css("ul.project-meta span.location-name").text 
    stats = el. 
    
    projects[title.to_sym] = {
      :image_ling => img,
      :description => description 
      :location => 
    }
  end
 
end