module car(
    input SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK, TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV,
    output START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN, BAT_WARN, AIRBAG_WARN, TEMP_WARN
);
    //Assignemnets for direct warnings
    assign DOOR_WARN = ~DOOR & KEY;
    assign HOOD_WARN = ~HOOD & KEY;
    assign TRUNK_WARN = ~TRUNK & KEY;
    assign BAT_WARN = ~BAT_OK & KEY;
    assign AIRBAG_WARN = ~AIB_OK & KEY;
    assign TEMP_WARN = ~TMP_OK & KEY;

    //Seatbelt warning
    assign SEAT_WARN = KEY & (~SB | (PASS_OCC & ~SB_P)); //If driver seatbelt not fastened or if the passenger seat is occupied and their seatbelt is not on, send warning

    //Priority Warnings
    assign WARN_PRI1 = BAT_WARN | AIRBAG_WARN | TEMP_WARN; //Warning 1 if any essential functions are not working
    assign WARN_PRI2 = DOOR_WARN | HOOD_WARN | TRUNK_WARN | SEAT_WARN; //Warning 2 if any non-essential functions are warning

    //Chime
    assign CHIME = WARN_PRI2; //If any low priorty warnings like open door or seatbelt not on

    //Allow engine on
    assign START_PERMIT = KEY & (SRV & BAT_OK | (PBRK & PARK & BRK & ~WARN_PRI1) & HOOD & SB);
    //Allow start if in service mode and the battery is working or if parking break is on, car is in park, break is held, no critical warnings, and seatbelt is on
endmodule