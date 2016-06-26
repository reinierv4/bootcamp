class Timezone

def time_in(city)

		case city
		when "New York"
			Time.now-6/24
		when "Madrid"
			Time.now
		when "Tokyo"
			Time.now+8/24
		end
	end

end
