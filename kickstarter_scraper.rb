require 'nokogiri'

def create_project_hash
  projects = {:projects => {}}
  
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  
  projects_array =  kickstarter.css("li.project.grid_4")
  
  p projects_array.first
  # projects_array.each do |el|
    
  # end
 
end