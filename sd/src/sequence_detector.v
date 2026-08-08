module sequence_detector (
    input  wire clk,
    input  wire reset,
    input  wire data_in,
    output reg  detected
);

    // State encoding
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;

    reg [2:0] current_state;
    reg [2:0] next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next-state and output logic
    always @(*) begin

        next_state = S0;
        detected = 1'b0;

        case (current_state)

            // No bits detected
            S0: begin
                if (data_in)
                    next_state = S1;
                else
                    next_state = S0;
            end

            // Detected "1"
            S1: begin
                if (data_in)
                    next_state = S1;
                else
                    next_state = S2;
            end

            // Detected "10"
            S2: begin
                if (data_in)
                    next_state = S3;
                else
                    next_state = S0;
            end

            // Detected "101"
            S3: begin
                if (data_in) begin
                    next_state = S1;
                    detected = 1'b1;
                end
                else
                    next_state = S2;
            end

            default:
                next_state = S0;

        endcase
    end

endmodule