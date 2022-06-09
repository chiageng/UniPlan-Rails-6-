module ApplicationHelper
    def readable_time(time)
        time.strftime("%I:%M %p")
    end

    def compare_time(work, starttime, endtime)
        work.starttime.strftime( "%H%M%S%N" ) >= starttime.utc.strftime( "%H%M%S%N" ) && work.starttime.strftime( "%H%M%S%N" ) <= endtime.utc.strftime( "%H%M%S%N" )
        
    end 
end
