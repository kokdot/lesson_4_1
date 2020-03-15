# Класс Route (Маршрут):
# Имеет начальную и конечную станцию, а также список промежуточных станций. 
# Начальная и конечная станции указываютсся при создании маршрута, 
# а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
class Route
	attr_reader :first, :last, :stations
	def initialize(first, last)
		@first = first
		@last = last
		@stations = []
	end
	def station=(station)
		if !@stations.include?(station) && @first != station && @last != station
			@stations << station 
			puts "Станция #{station.name} добавлена"
		else
			puts "Станция #{station.name} уже была добавлена в этот маршрут ранее!"
		end
	end
	def remove_station=(station)
		if @stations.include?(station) 
			@stations.delete(station)
			puts "Станция #{station.name} удалена"
		else
			puts "Станции #{station.name} нет на данном маршруте"

		end
	end
	def stations
		list_stations=[]
		@stations.each do |st|
			list_stations << st.name
		end
		list_stations.unshift(@first.name).push(@last.name)
	end
end
