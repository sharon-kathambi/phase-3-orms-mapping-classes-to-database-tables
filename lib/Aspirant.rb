class Aspirant

  attr_accessor :name, :party

  def initialize(name:, party:, id: nil)
    @id = id
    @name = name
    @party = party
  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS aspirants(
      id INTEGER PRIMARY KEY,
      name TEXT,
      party TEXT
    )
    SQL

  DB[:conn].execute(sql)
  end

  def save 
    sql = <<-SQL
     INSERT INTO aspirants(name, party)
     VALUES(?, ?)
     SQL

     #insert the aspirant
    DB[:conn].execute(sql, self.name, self.party)

   # get the aspirant ID from the database and save it to the Ruby instance
   self.id = DB[:conn].execute("SELECT last_insert_rowid() FROM aspirants")[0][0]

   # return the Ruby instance
   self 

  end

end

ruto = Aspirant.new(name: "William Ruto", party: "UDA")

