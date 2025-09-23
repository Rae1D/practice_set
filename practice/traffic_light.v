module traffic_light (
    input clk,
    input rst_n,
    input pass_request,
    output reg [7:0] clock,
    output reg [2:0] led
);
    parameter RED = 3'b001;
    parameter GREEN = 3'b010;
    parameter YELLOW = 3'b100;

    reg [2:0] cstate, nstate;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cstate <= GREEN;
        end
        else begin
            cstate <= nstate;
        end
    end

    always @(*) begin
        case (cstate)
                RED: begin
                    if (clock == 0) begin
                        nstate = GREEN;
                    end
                    else begin
                        nstate = RED;
                    end
                end 
                GREEN: begin
                    if (clock == 0) begin
                        nstate = YELLOW;
                    end
                    else begin
                        nstate = GREEN;
                    end
                end
                YELLOW: begin
                    if (clock == 0) begin
                        nstate = RED;
                    end
                    else begin
                        nstate = YELLOW;
                    end
                end
                default: nstate = GREEN;
            endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            clock <= 8'd59;
        end
        else begin
            case (cstate)
                RED: begin
                    if (clock == 0) begin
                        clock <= 8'd59;
                    end
                    else begin
                        clock <= clock - 1;
                    end
                end 
                GREEN: begin
                    if (clock == 0) begin
                        clock <= 8'd4;
                    end
                    else if (pass_request == 1 && clock > 9) begin
                        clock <= 8'd9;
                    end
                    else begin
                        clock <= clock - 1;
                    end
                end
                YELLOW: begin
                    if (clock == 0) begin
                        clock <= 8'd9;
                    end
                    else begin
                        clock <= clock - 1;
                    end
                end
                default: clock <= 8'd59;
            endcase
        end
    end

    always @(*) begin
        case (cstate)
            RED: begin
                led = 3'b001;
            end 
            GREEN: begin
                led = 3'b010;
            end
            YELLOW: begin
                led = 3'b100;
            end
            default: led = 3'b010;
        endcase
    end

endmodule