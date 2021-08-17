class Appointment
  def initialize(location, purpose, hour, min)
    @location = location
    @purpose = purpose
    @hour = hour
    @min = min
  end
end

class MonthlyAppointment < Appointment
  def initialize(location, purpose, hour, min, day)
    super(location, purpose, hour, min)
    @day = day
  end

  def occurs_on?(day)
    @day == day
  end

  def to_s
    puts "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{@min}."
  end
end

class DailyAppointment < Appointment
  def occurs_on?(hour, min)
    @hour == hour && @min == min
  end

  def to_s
    puts "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}."
  end
end

class OneTimeAppointment < Appointment
  def initialize(location, purpose, hour, min, day, month, year)
    super(location, purpose, hour, min)
    @day = day
    @month = month
    @year = year
  end

  def occurs_on?(day, month, year)
    @day == day && @month == month && @year == year
  end

  def to_s
    puts "Reunión mensual en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}."
  end
end

ota1 = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts ota1.occurs_on?(4, 6, 2019)
puts ota1.occurs_on?(16, 8, 2021)
ota1.to_s

da1 = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts da1.occurs_on?(8, 15)
puts da1.occurs_on?(22, 30)
da1.to_s

m1 = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
puts m1.occurs_on?(23)
puts m1.occurs_on?(16)
m1.to_s
