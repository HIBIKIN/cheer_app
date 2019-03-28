module ApplicationHelper
  def like_status
    case current_user.likes_count
    when 0..100
      return "F"
    when 101..200
      return "E"
    when 201..400
      return "D"
    when 401..600
      return "C"
    when 601..900
      return "B"
    when 901..1200
      return "B+"
    when 1201..1500
      return "A"
    when 1501..2000
      return "A+"
    when 2001..2500
      return "S"
    when 2501..3000
      return "S+"
    end
  end
end
