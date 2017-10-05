require( 'pg' )

class SqlRunner

  def self.run( sql, values )
    begin
      db = PG.connect({
        dbname: 'animal-shelter-database',
        host: 'ec2-54-163-237-25.compute-1.amazonaws.com',
        port: 5432,
        user: 'hknzviiixxtnbc',
        password: 'e398edc7b8117fd0829f7040311c82c0dbf615a75ea5265adb100e9c3f3d0f34'
      })
      # db = PG.connect({ dbname: 'animal_shelter', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close
    end
    return result
  end

end
