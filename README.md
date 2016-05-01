Printer 2016
====

The idea here is to do something like the 2014 printer, except:

* Replace the orange bucket with an aquarium: http://www.walmart.com/ip/29114303
* Replace the bicycle chain with four stepper motors, one in each corner, wired in parallel.
  - NEMA-17 steppers $14: https://www.adafruit.com/products/324
  - Stepper drivers (12 volts OK) $5: https://www.adafruit.com/products/2448
  - Stepper couplers $5: https://www.adafruit.com/products/1175
  - Total cost for steppers and associated stuff $96
  - Control the steppers with a Teensy 3.1 driving four stepper drivers. Provide a language that allows for individual stepper motor movements, and pairs of steppers for leveling, as well as just up and down.
* Replace plywood with RRC. The frame clamps to the top of the aquarium.
* Vertical threaded rods are affixed to the stepper motors by couplers and engage captive nuts affixed to the build platform. The threaded rods are easily replaceable, because they'll get gooey and maybe rusty.
* Limit switch for the build platform????? Never needed one before.
* First-surface mirror (https://www.youtube.com/watch?v=IaEaaeajCSI) with a RRC holder. Etsy is a good source for mirrors.
* Projector stand is RRC.
* Some electronics goes on the mechanics
  - the Teensy
  - the stepper drivers
* Electronics goes to the side, not on the mechanics
  - a switching regulator
  - a Raspberry Pi 2
  - a screen $14: https://www.adafruit.com/products/2454
  - a keyboard $10: http://www.quill.com/corded-keyboards/cbs/348576.html
* Alternatively, electronics can be in a separate box on the side, with some kind of multi-wire cable connecting to the mechanics. Leave enough connections for limit switches, if I ever get around to that.
* The cause of bottom-side blobbing is partially solidified resin. It may be preventable if the resin can be kept moving with a little stirrer to keep the liquid slowly moving. If it moves too fast, you'll get bubbles.
