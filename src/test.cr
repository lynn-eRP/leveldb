# TODO: Write documentation for `Test`
require "leveldb"

module Test
  VERSION = "0.1.0"
  db = LevelDB::DB.new("./db")
  begin
    batch = LevelDB::Batch.new

    batch.put("name","Martin")
    batch.put("age","25")
    batch.put("location","Bariloche")
    batch.delete("age")

    # write batch to the db in atomic way
    db.write(batch)

    puts db.get("name")
    puts db.get("age") # nil
    puts db.get("location")
  ensure
    # free memory 
    #batch.destroy 
    # close the database
    db.close
  end

end
