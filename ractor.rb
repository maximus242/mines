pipe = Ractor.new do
  loop do
    Ractor.yield Ractor.receive
  end
end


TILE = "\u2B1C ".freeze

@rn = 10_000
width = 10_000
remaining = 10_000
limit = [width, remaining].min
random = (0..limit)

@rn.times do |number|
  random = rand(0...limit)
  indices = Array.new(random) { rand(0...limit) } 
  indices.sort!
  start = 0
  Ractor.new width, indices do |width, indices, start|
    string = TILE * width
    string += "<br/>"
    File.open("test.html", "a") { |f| f.write(string) }
  end
end
