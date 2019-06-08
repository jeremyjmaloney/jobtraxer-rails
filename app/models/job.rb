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

end
