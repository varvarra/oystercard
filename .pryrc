require './lib/oyster_card.rb'

oc = OysterCard.new
oc.top_up(20)
oc.touch_in("aardvark")
oc.touch_out("zebra")
