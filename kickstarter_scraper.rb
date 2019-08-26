require 'nokogiri'

def create_project_hash
  projects = {:projects => {}}
  
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  
  projects_array =  kickstarter.css("li.project.grid_4")
  
  
  projects_array.each do |el|
    title = el.css("h2.bbcard_name strong a").text 
    
    img = el.css("div.project-thumbnail a img").attribute("src").value 
    
    
    description = el.css("p.bbcard_blurb").text
    
    location = el.css("ul.project-meta span.location-name").text 
    
    stats = el.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    
    projects[title.to_sym] = {
      :image_link => img,
      :description => description, 
      :location => location ,
      :percent_funded => stats
    }
    
  end
 projects
end