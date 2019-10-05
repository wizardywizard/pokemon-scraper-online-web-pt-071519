require 'pry'
class Pokemon

    attr_accessor :name, :type, :id, :db, :hp

    def initialize (id:, name:, type:, db:, hp: nil)
      @id = id
      @name = name
      @type = type
      @hp = hp
      @db = db
    end
  
    def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES (?, ?);
      SQL
      db.execute(sql, [name, type])
    end

    def self.find(id, db)
        sql = <<-SQL
          SELECT * FROM pokemon WHERE id = (?);
        SQL
        pokemon = db.execute(sql, [id]).flatten
       # binding.pry
         Pokemon.new(id: id, name: pokemon[1], type: pokemon[2], db: db)
      end

end
