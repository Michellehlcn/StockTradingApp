configure :development do
	set :database, "sqlite:///database.db"
end

configure :production do
	db =URI.parse(ENV['postgres://rhkvqzksaqbiee:48ea816c29af000381884bc2f151e98338dbd2f567d8ad408228acee3adb758c@ec2-184-73-243-101.compute-1.amazonaws.com:5432/d6vrrq18avm5l6'] || 'postgres://localhost/mydb')

	ActiveRecord::Base.establish_connection(
		:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
		:host    => db.host,
		:username=> db.user,
		:password=> db.password,
		:database=> db.path[1..-1],
		:encoding=> 'utf8'
	)
end