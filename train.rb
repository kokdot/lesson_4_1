# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные 
# указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или 
# уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не 
# движется. Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но 
# только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
class Train
  attr_writer :route
  attr_reader :type, :quantity_vans
  def initialize(number, type = true, vans)
    @number = number
    @type = type
    @vans = vans
    @speed = 0
    @station_index = 0
  end

  def speed(delta)
    if @speed + delta < 0 
        @speed = 0
    else
      @speed += delta
    end
  end

  def station
    @route.stations[@station_index]
  end

  def station_before
    @route.stations[@station_index - 1]
  end 

  def station_next
    @route.stations[@station_index + 1]
  end  
  
  def move_ahead
    if @route == nil
      puts "Вы не можете начать движение, потому что у Вас нет маршрута"
    else
      if @station_index == @route.stations.size - 1
        puts "Вы не можете двигаться вперед, потому что это последняя станция вашего маршрута"
      else
        @station_index += 1
      end
    end
  end

  def move_back
    if @route == nil
      puts "Вы не можете начать движение, потому что у Вас нет маршрута"
    else
      if @station_index == 0
        puts "Вы не можете двигаться назад, потому что это первая станция вашего маршрута"
      else
         @station_index -= 1
      end
    end
  end

  def van_add
    if speed != 0
      puts "Операции с вагонами можно производить только во время остановки поезда!"
    else
      @vans += 1
    end
  end

  def van_remove
    if speed != 0
      puts "Операции с вагонами можно производить только во время остановки поезда!"
    else
      if @vans == 0
        puts "Вы не можете отцеплять вагоны, потому что у Вас их больше нет"
      else
          @vans -= 1
      end
    end
  end
  
  def vans
    @vans
  end
end
      