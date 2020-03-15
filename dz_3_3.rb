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
	attr_accessor :speed
	attr_writer :route
	attr_reader :type, :quantity_vans
	def initialize(number, type = true, quantity_vans)
		@number = number
		@types = ["грузовой", "пассажирский"]
		if type
			@type = @types[0]
		else
			@type = @types[1]
		end
		@quantity_vans = quantity_vans
		@speed = 0
		@station_index = 0
		# @stations = []
	end
	# def route=(route)
	# 	@route = route
	# 	# @stations = @route.stations.unshift(@route.first).push(@route.last)
	# end
	def near_stations
		if @route == nil
			puts "У вас нет ближайших станций, потому что у Вас нет маршрута"
		else
			if @station_index == 0
				puts "Вы находитесь на первой станции маршрута"
				puts "Следующая станция #{@route.stations[1]}"
			elsif @station_index == @route.stations.size - 1
				puts "Вы находитесь на последней станции маршрута"
				puts "Предыдущая станция: #{@route.stations[-2]}"
			else
				puts "Вы находитесь на #{@route.stations[@station_index]} станции маршрута"
				puts "Следующая станция #{@route.stations[@station_index + 1]}"
				puts "Предыдущая станция: #{@route.stations[@station_index - 1]}"
			end
		end
	end
	def move(direction = true)
		if @route == nil
			puts "Вы не можете начать движение, потому что у Вас нет маршрута"
		else
			if direction
				if @station_index == @route.stations.size - 1
					puts "Вы не можете двигаться вперед, потому что это последняя станция вашего маршрута"
				else
					@station_index += 1
				end
			else
				if @station_index == 0
					puts "Вы не можете двигаться назад, потому что это первая станция вашего маршрута"
				else
					@station_index += 1
				end
			end
		end
	end
	def add_van(add = true)
		if speed != 0
			puts "Операции с вагонами можно производить только во время остановки поезда!"
		else
			if add
				@quantity_vans += 1
			else
				if @quantity_vans == 0
					puts "Вы не можете отцеплять вагоны, потому что у Вас их больше нет"
				else
					@quantity_vans -= 1
				end
			end
		end
	end
	def vans
		return @quantity_vans
	end
end