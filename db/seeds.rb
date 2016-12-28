# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create(:first_name => 'Filet', :last_name => 'Minyon', :username => 'admin', :email => 'admin@test.com', :password => '12345')

subject_list = [
[ "Subject 1", 1, 1 ],
[ "Subject 2", 2, 1 ]
]
subject_list.each do |name, position, visible| Subject.create( name: name, position: position, visible: visible )
end

pages_list = [
[ 1, "Subject 1 Page 1", "subject-1-page-1", 1, 1 ],
[ 1, "Subject 1 Page 2", "subject-1-page-2", 2, 1 ],
[ 2, "Subject 2 Page 1", "subject-2-page-1", 1, 1 ],
[ 2, "Subject 2 Page 2", "subject-2-page-2", 2, 1 ]
]
pages_list.each do |subject_id, name, permalink, position, visible| Page.create( subject_id:subject_id, name: name, permalink: permalink, position: position, visible: visible )
end

sections_list = [
[ 1, "Subject 1 Page 1 Section 1", 1, 1, 'HTML', "Content for Subject 1 Page 1 <h4>Section 1</h4>"],
[ 1, "Subject 1 Page 1 Section 2", 2, 1, 'HTML', "Content for Subject 1 Page 2 <h4>Section 2</h4>"],
[ 1, "Subject 1 Page 1 Section 3", 3, 1, 'HTML', "Content for Subject 1 Page 3 <h4>Section 3</h4>"],
[ 2, "Subject 1 Page 2 Section 1", 1, 1, 'HTML', "Content for Subject 1 Page 1 <h4>Section 1</h4>"],
[ 2, "Subject 1 Page 2 Section 2", 2, 1, 'HTML', "Content for Subject 1 Page 2 <h4>Section 2</h4>"],
[ 2, "Subject 1 Page 2 Section 3", 3, 1, 'HTML', "Content for Subject 1 Page 3 <h4>Section 3</h4>"],
[ 3, "Subject 2 Page 1 Section 1", 1, 1, 'HTML', "Content for Subject 2 Page 1 <h4>Section 1</h4>"],
[ 3, "Subject 2 Page 1 Section 2", 2, 1, 'HTML', "Content for Subject 2 Page 2 <h4>Section 2</h4>"],
[ 3, "Subject 2 Page 1 Section 3", 3, 1, 'HTML', "Content for Subject 2 Page 3 <h4>Section 3</h4>"],
[ 4, "Subject 2 Page 2 Section 1", 1, 1, 'HTML', "Content for Subject 2 Page 1 <h4>Section 1</h4>"],
[ 4, "Subject 2 Page 2 Section 2", 2, 1, 'HTML', "Content for Subject 2 Page 2 <h4>Section 2</h4>"],
[ 4, "Subject 2 Page 2 Section 3", 3, 1, 'HTML', "Content for Subject 2 Page 3 <h4>Section 3</h4>"]
]
sections_list.each do |page_id, name, position, visible, content_type, content| Section.create( page_id:page_id, name:name, position:position, visible:visible, content_type:content_type, content:content )
end


