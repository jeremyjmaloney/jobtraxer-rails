class Job

  DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'jobtraxer-rails_development'})

  def self.find(status)
    results = DB.exec("SELECT * FROM jobs WHERE status LIKE '#{status}' ;")
    return results.map do |result|
      {
        "id" => result["id"].to_i,
        "title" => result["title"],
        "company" => result["company"],
        "link" => result["link"],
        "status" => result["status"]
      }
    end
  end

  def self.create(opts)
    results = DB.exec(
      <<-SQL
        INSERT INTO jobs (title, company, link, status)
        VALUES ('#{opts["title"]}', '#{opts["company"]}', '#{opts["link"]}', '#{opts["status"]}')
        RETURNING id, title, company, link, status;
      SQL
    )
    return {
      "id" => results.first["id"].to_i,
      "title" => results.first["title"],
      "company" => results.first["company"],
      "link" => results.first["link"],
      "status" => results.first["status"]
    }
  end

  def self.delete(id)
    results = DB.exec("DELETE FROM jobs WHERE id=#{id;}")
    return {"deleted" => true}
  end

end
