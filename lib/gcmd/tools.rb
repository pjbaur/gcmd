require "nokogiri"
require "open-uri"

module Gcmd
  
  # Class containing tools usefull during DIF manipulation. Although created
  # specifically with DIF manipulation in mind the methods have been made as
  # general as possible and should be easily adaptable to be used with xml
  # documents other then DIF
  #
  # [Functionality]
  #   * XML data loading (Nokogiri XML Documents)
  #   * Hash template generation from XML xml_schema files
  #
  # @see http://nokogiri.org/ Nokogiri XML/HTML parsing library
  #
  # @author Ruben Dens
  # @author Conrad Helgeland
  
  class Tools
    
    # Load DIF XML from source (File_path|String|URI)
    # This returns a Nokogiri::XML::Document

    def load_xml( source, uri = false )
      begin
        
        unless source.nil?
          if uri or source =~ /^http(s)?\:\/\//
            Nokogiri::XML::Document.parse( open( source ).read, nil, nil, Nokogiri::XML::ParseOptions::NOBLANKS )
          else
            source = File.read( source ) if File.exists? source
            Nokogiri::XML::Document.parse( source, nil, nil, Nokogiri::XML::ParseOptions::NOBLANKS )
          end
        end
        
      rescue        
        raise ArgumentError, "Invalid Source"        
      end      
    end
    
  end
end