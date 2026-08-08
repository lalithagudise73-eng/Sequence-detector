`timescale 1ns/1ps

module sequence_detector_tb;

    reg clk;
    reg reset;
    reg data_in;

    wire detected;

    // Instantiate DUT
    sequence_detector uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .detected(detected)
    );

    // Clock generation
    initial begin
        clk = 1'b0;

        forever #5 clk = ~clk;
    end

    // Waveform generation
    initial begin
        $dumpfile("sequence_detector.vcd");
        $dumpvars(0, sequence_detector_tb);
    end

    // Monitor signals
    initial begin
        $monitor(
            "Time=%0t | Reset=%b | Data=%b | Detected=%b",
            $time, reset, data_in, detected
        );
    end

    // Apply input sequence
    initial begin

        // Reset
        reset = 1'b1;
        data_in = 1'b0;

        #12;
        reset = 1'b0;

        // Sequence: 1
        #10 data_in = 1'b1;

        // Sequence: 10
        #10 data_in = 1'b0;

        // Sequence: 101
        #10 data_in = 1'b1;

        // Sequence: 1011 -> DETECTED
        #10 data_in = 1'b1;

        // Additional data
        #10 data_in = 1'b0;
        #10 data_in = 1'b1;
        #10 data_in = 1'b1;

        #10 $finish;

    end

endmodule