#encoding: utf-8
# Inspecteur en Ruby : sérialisation rudimentaire en XML.
#---------------------------------------------------------------------

module XMLSerializer

  # Méthode principale similaire à to_yaml
  def to_xml filepath = ''
    output = ''

    # Variables d'instance uniquement.
    self.instance_variables.each do |att|
      att = att.to_s.gsub('@','').to_sym
      val = self.send att
      output += process_attribute att, val.class.name, val
    end

    output = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- Généré avec XMLSerializer. -->\n<#{self.class}>\n#{output}</#{self.class}>\n"
    if filepath.empty? then
      output
    else
      to_file filepath, output
    end
  end

private

  def process_attribute att, type, val
    # Si type est Array ou Hash, il faut accéder aux valeurs contenues.
    case type
    when "Array"
      val = array_process att
    when "Hash"
      val = hash_process att
    end

    "<#{att} type=\"#{type}\">#{val}</#{att}>\n"
  end

  # Traitement des tableaux.
  def array_process att
    ret = ''
    self.send(att).each do |elt|
      ret += "<item type=\"#{elt.class}\" value=\"#{elt}\"/>\n"
    end
    "\n#{ret}"
  end

  # Traitement quand on a affaire à une table clef - valeur.
  def hash_process att
    ret = ''
    self.send(att).each_pair do |key, val|
      ret += "<#{key}>#{process_attribute key, val.class.name, val}</#{key}>\n"
    end
    "\n#{ret}"
  end

  def to_file filepath, content
    begin
      file = File.open filepath, "w+"
      file.write content
    rescue IOError => e
      # Oh non !
    ensure
      file.close unless file == nil
    end
  end

end
