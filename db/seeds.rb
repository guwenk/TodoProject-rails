# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
seed_file = File.join(Rails.root, 'db', 'seeds.yml')
hash = HashWithIndifferentAccess.new(YAML::load_file(seed_file))

hash["projects"].each do |project|
	project_obj = Project.create(title: project["title"])
	project["todos"].each do |todo|
		Todo.create(text: todo["text"], isCompleted: todo["isCompleted"], project_id: project_obj.id)
	end
end
#project = Project.create(title: "test")
#Todo.create(text: "123", isCompleted: true, project_id: project.id)


#Project.create(config["projects"])
#Todo.create(config["todos"])