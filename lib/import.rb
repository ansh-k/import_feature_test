module Import

	def get_rows
    import_request = ImportRequest.find(import_request_id)
    excel_file = open("http://s3-us-west-2.amazonaws.com/terumo-bct"+@import_request.import_file.path)
  
    case @import_request.import_file.content_type
    when "application/zip"
      import_file = Roo::Excelx.new(excel_file);
      import_file.default_sheet = import_file.sheets[0]
    when "text/plain"
      import_file = Roo::CSV.new(excel_file);
      import_file.default_sheet = import_file.sheets[0]
    else
      import_file = Roo::Excelx.new(excel_file);
      import_file.default_sheet = import_file.sheets[0]      
    end

    header_row = import_file.row(1)
	end

	class Product
	end

	class OnHandInventory
	end

	class InTransitInventory
	end

end