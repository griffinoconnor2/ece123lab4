1. Objectives

The purpose of this lab is to design and implement the interactions between a car’s various inputs (sensors, key ignition, and other physical switch-like features) and outputs (warning lights, engine start, etc.). Specifically, our design focuses on simulating the various safety checks incorporated in modern vehicle designs. We will simulate such a safety system by assigning our inputs to the Basys 3’s switches, writing combinational logic describing the output behavior, and mapping these outputs to the board’s LEDs.


2. Introduction

As we were given creative freedom to design the safety system in this lab, we attempted to model our system after the behaviors we’ve observed in our own vehicles. We immediately noted that, for safety systems like these, the lights in our cars only activate when the car is running. As such, an essential aspect of our design is that the KEY input signal’s high state indicates both that the key is inserted and that the vehicle is running. Consequently, many of the warning lights in our cars illuminate only when the KEY signal is high, like the door open light or battery status check light. 

Following our initial output assignments, we classified the various warnings into either low or high priority based on their severity and impact to drivability. The battery, airbag, and temperature warnings were given utmost importance, with any of their activations illuminating the highest priority warning signal. The less consequential warnings, like the door, hood, trunk, or seatbelt warnings, were assigned secondary priority, as they don’t pose an immediate impact on the operation of the vehicle. We chose to enable the CHIME signal if and only if a secondary warning was active, as they mimicked the scenarios our vehicles beep in real life. Permission to start the vehicle is only granted when the car is on and under two separate groups of conditions; First, if the battery is on and the car is in service mode (to mimic maintenance scenarios), or if the parking brake and brake are pressed, the car is in park, there are no high priority warnings, the hood is down, and the driver seatbelt is buckled.

Because this design was to be implemented using purely combinational logic, we utilized the Dataflow design style, with basic Boolean logic operators (like ‘&’, ‘|’, and ‘~’) and assign statements, to generate our output logic. We found this to be both the most effective and readable style to implement by far, as our design required no additional logic gates and displays the logic clearly in its output assignments.


3. Additional Sources

https://hilite.me/ - Used to format Appendix code in Lab Report
