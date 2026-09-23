`timescale 1ns/1ns

module car_tb;
    //Inputs and outputs
    reg SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK, TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV;
    wire START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN, BAT_WARN, AIRBAG_WARN, TEMP_WARN;


    car uut(SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK, TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV, START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN, BAT_WARN, AIRBAG_WARN, TEMP_WARN);

    //Perform various tests
    initial 
    begin

    //KEY = 0 (Ignition Off / Don't Care States)
    SRV = 1'bx; PBRK = 1'bx; TRUNK = 1'bx; SB_P = 1'bx; PASS_OCC = 1'bx; TMP_OK = 1'bx; AIB_OK = 1'bx; BAT_OK = 1'bx; HOOD = 1'bx; PARK = 1'bx; BRK = 1'bx; KEY = 1'b0; DOOR = 1'bx; SB = 1'bx; #10;

    //Allow Start, with normal conditions
    SRV = 1'b0; PBRK = 1'b1; TRUNK = 1'b1; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b1; AIB_OK = 1'b1; BAT_OK = 1'b1; HOOD = 1'b1; PARK = 1'b1; BRK = 1'b1; KEY = 1'b1; DOOR = 1'b1; SB = 1'b1; #10;

    //Brake pedal released, do not allow start 
    SRV = 1'b0; PBRK = 1'b1; TRUNK = 1'b1; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b1; AIB_OK = 1'b1; BAT_OK = 1'b1; HOOD = 1'b1; PARK = 1'b1; BRK = 1'b0; KEY = 1'b1; DOOR = 1'b1; SB = 1'b1; #10;

    //Service mode allow start
    SRV = 1'b1; PBRK = 1'b1; TRUNK = 1'b1; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b1; AIB_OK = 1'b1; BAT_OK = 1'b1; HOOD = 1'b1; PARK = 1'b1; BRK = 1'b1; KEY = 1'b1; DOOR = 1'b1; SB = 1'b1; #10;

    //Service mode cannot start car due to critical battery error 
    SRV = 1'b1; PBRK = 1'b0; TRUNK = 1'b1; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b1; AIB_OK = 1'b1; BAT_OK = 1'b0; HOOD = 1'b1; PARK = 1'b0; BRK = 1'b0; KEY = 1'b1; DOOR = 1'b1; SB = 1'b0; #10;

    //Seatbelt unbuckled, not allowing start 
    SRV = 1'b0; PBRK = 1'b1; TRUNK = 1'b1; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b1; AIB_OK = 1'b1; BAT_OK = 1'b1; HOOD = 1'b1; PARK = 1'b1; BRK = 1'b1; KEY = 1'b1; DOOR = 1'b1; SB = 1'b0; #10;

    //Passenger seatbelt warning
    SRV = 1'b0; PBRK = 1'b1; TRUNK = 1'b1; SB_P = 1'b0; PASS_OCC = 1'b1; TMP_OK = 1'b1; AIB_OK = 1'b1; BAT_OK = 1'b1; HOOD = 1'b1; PARK = 1'b1; BRK = 1'b1; KEY = 1'b1; DOOR = 1'b1; SB = 1'b1; #10;

    //Door open causing warning
    SRV = 1'b0; PBRK = 1'b1; TRUNK = 1'b1; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b1; AIB_OK = 1'b1; BAT_OK = 1'b1; HOOD = 1'b1; PARK = 1'b1; BRK = 1'b1; KEY = 1'b1; DOOR = 1'b0; SB = 1'b1; #10;

    //Hood open, not allowing car start
    SRV = 1'b0; PBRK = 1'b1; TRUNK = 1'b1; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b1; AIB_OK = 1'b1; BAT_OK = 1'b1; HOOD = 1'b0; PARK = 1'b1; BRK = 1'b1; KEY = 1'b1; DOOR = 1'b1; SB = 1'b1; #10;

    //Trunk open
    SRV = 1'b0; PBRK = 1'b1; TRUNK = 1'b0; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b1; AIB_OK = 1'b1; BAT_OK = 1'b1; HOOD = 1'b1; PARK = 1'b1; BRK = 1'b1; KEY = 1'b1; DOOR = 1'b1; SB = 1'b1; #10;

    //Battery error
    SRV = 1'b0; PBRK = 1'b1; TRUNK = 1'b1; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b1; AIB_OK = 1'b1; BAT_OK = 1'b0; HOOD = 1'b1; PARK = 1'b1; BRK = 1'b1; KEY = 1'b1; DOOR = 1'b1; SB = 1'b1; #10;

    //Airbag error
    SRV = 1'b0; PBRK = 1'b1; TRUNK = 1'b1; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b1; AIB_OK = 1'b0; BAT_OK = 1'b1; HOOD = 1'b1; PARK = 1'b1; BRK = 1'b1; KEY = 1'b1; DOOR = 1'b1; SB = 1'b1; #10;

    //Temperature error
    SRV = 1'b0; PBRK = 1'b1; TRUNK = 1'b1; SB_P = 1'b1; PASS_OCC = 1'b0; TMP_OK = 1'b0; AIB_OK = 1'b1; BAT_OK = 1'b1; HOOD = 1'b1; PARK = 1'b1; BRK = 1'b1; KEY = 1'b1; DOOR = 1'b1; SB = 1'b1; #10;

    $finish;
    end

endmodule