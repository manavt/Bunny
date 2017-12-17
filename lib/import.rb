class Import
  def self.import_from_link
    r = RestClient.get ("http://localhost:4000/products/download_in_json.json")
    data  = JSON.load(r.body)
    data.each do | each_record |
      each_record.delete_if {|key, _| key == "id"}
      if p = Product.create!(each_record)
        Rails.logger.info "Successfully saved the object #{p}"
      else
        Rails.logger.debug "Something went wrong with object #{p.errors}"
      end
    end
  end
end
