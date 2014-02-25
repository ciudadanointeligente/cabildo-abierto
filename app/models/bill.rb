class Billit::Bill
  def icon
    case self.status.strip
    when "Archivado"
      return 'filed.png'
    when "Publicado"
      return 'published.png'
    when "En tramitación"
      return 'paperwork.png' #icono pendiente 
    when "Rechazado"
      return 'rejected.png' 
    when "Retirado"
      return 'discarded.png' 
    else
      return ''
    end
  end
end