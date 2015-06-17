require 'nori'

module Mundipagg
	# Class who handles Mundipagg post notification XML
	class PostNotification
	
	    # This method parse the Xml sent by Mundipagg when notify a change in a transaction.
	    # 
	    # @param request [String] XML received in the Mundipagg POST request.
	    # @return [Hash<Symbol, String>] A hash collection containing the XML data parsed.
		def self.ParseNotification(xml)

			nori = Nori.new(:convert_tags_to => lambda { |tag| tag.snakecase.to_sym })
			first_pass = CGI::unescape(xml)
			xml_hash  = nori.parse(CGI::unescapeHTML(first_pass))

			return xml_hash
		end


	end
end