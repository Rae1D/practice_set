module Sigmoid #(
    parameter width = 8, 	
    parameter RES_depth_bits = 7, // 64*2 = 128 entries = 7 bits
    parameter SIG_depth_bits = 8     // 64*3 = 192 entries = 8 bits
)
(
    input clk, 
    input Start_Sigmoid,
    output reg End_Sigmoid, 
    
    output wire RES_read_en, 
    output wire [RES_depth_bits-1:0] RES_read_address, 
    input [width-1:0] RES_read_data_out,

    output wire SIG_write_en, 	
    output reg [SIG_depth_bits-1:0] SIG_write_address, 
    output reg [width-1:0] SIG_write_data_in
);

    reg [4:0] state;
    localparam IDLE = 5'b10000;
    localparam WRITE_FIXED = 5'b01000;
    localparam WRITE_LUT1 = 5'b00100;
    localparam WRITE_LUT2 = 5'b00010;
    localparam DONE = 5'b00001;

    reg [6:0] row; // 0 ~ 63
    // reg [width-1:0] temp_data1, temp_data2;

    // assign RES_read_en = (state == WRITE_FIXED);
    // assign SIG_write_en = (state == WRITE_FIXED || state == WRITE_LUT1 || state == WRITE_LUT2);
    
    function [width-1:0] lut;
    input [width-1:0] in;
    begin
        lut = (in < 4)   ? 8'd12  :
              (in < 7)   ? 8'd13  :
              (in < 10)  ? 8'd14  :
              (in < 13)  ? 8'd15  :
              (in < 16)  ? 8'd16  :
              (in < 18)  ? 8'd17  :
              (in < 21)  ? 8'd18  :
              (in < 23)  ? 8'd19  :
              (in < 25)  ? 8'd20  :
              (in < 28)  ? 8'd21  :
              (in < 30)  ? 8'd22  :
              (in < 32)  ? 8'd23  :
              (in < 34)  ? 8'd24  :
              (in < 35)  ? 8'd25  :
              (in < 37)  ? 8'd26  :
              (in < 39)  ? 8'd27  :
              (in < 41)  ? 8'd28  :
              (in < 42)  ? 8'd29  :
              (in < 44)  ? 8'd30  :
              (in < 45)  ? 8'd31  :
              (in < 47)  ? 8'd32  :
              (in < 48)  ? 8'd33  :
              (in < 50)  ? 8'd34  :
              (in < 51)  ? 8'd35  :
              (in < 53)  ? 8'd36  :
              (in < 54)  ? 8'd37  :
              (in < 55)  ? 8'd38  :
              (in < 57)  ? 8'd39  :
              (in < 58)  ? 8'd40  :
              (in < 59)  ? 8'd41  :
              (in < 60)  ? 8'd42  :
              (in < 61)  ? 8'd43  :
              (in < 63)  ? 8'd44  :
              (in < 64)  ? 8'd45  :
              (in < 65)  ? 8'd46  :
              (in < 66)  ? 8'd47  :
              (in < 67)  ? 8'd48  :
              (in < 68)  ? 8'd49  :
              (in < 69)  ? 8'd50  :
              (in < 70)  ? 8'd51  :
              (in < 71)  ? 8'd52  :
              (in < 72)  ? 8'd53  :
              (in < 73)  ? 8'd54  :
              (in < 74)  ? 8'd55  :
              (in < 75)  ? 8'd56  :
              (in < 76)  ? 8'd57  :
              (in < 77)  ? 8'd58  :
              (in < 78)  ? 8'd59  :
              (in < 79)  ? 8'd60  :
              (in < 80)  ? 8'd61  :
              (in < 81)  ? 8'd62  :
              (in < 82)  ? 8'd63  :
              (in < 83)  ? 8'd64  :
              (in < 84)  ? 8'd66  :
              (in < 85)  ? 8'd67  :
              (in < 86)  ? 8'd68  :
              (in < 87)  ? 8'd69  :
              (in < 88)  ? 8'd70  :
              (in < 89)  ? 8'd72  :
              (in < 90)  ? 8'd73  :
              (in < 91)  ? 8'd74  :
              (in < 92)  ? 8'd75  :
              (in < 93)  ? 8'd76  :
              (in < 94)  ? 8'd78  :
              (in < 95)  ? 8'd79  :
              (in < 96)  ? 8'd80  :
              (in < 97)  ? 8'd82  :
              (in < 98)  ? 8'd83  :
              (in < 99)  ? 8'd84  :
              (in < 100) ? 8'd86  :
              (in < 101) ? 8'd87  :
              (in < 102) ? 8'd88  :
              (in < 103) ? 8'd90  :
              (in < 104) ? 8'd91  :
              (in < 105) ? 8'd92  :
              (in < 106) ? 8'd94  :
              (in < 107) ? 8'd95  :
              (in < 108) ? 8'd97  :
              (in < 109) ? 8'd98  :
              (in < 110) ? 8'd99  :
              (in < 111) ? 8'd101 :
              (in < 112) ? 8'd102 :
              (in < 113) ? 8'd104 :
              (in < 114) ? 8'd105 :
              (in < 115) ? 8'd107 :
              (in < 116) ? 8'd108 :
              (in < 117) ? 8'd110 :
              (in < 118) ? 8'd111 :
              (in < 119) ? 8'd113 :
              (in < 120) ? 8'd114 :
              (in < 121) ? 8'd116 :
              (in < 122) ? 8'd117 :
              (in < 123) ? 8'd119 :
              (in < 124) ? 8'd120 :
              (in < 125) ? 8'd122 :
              (in < 126) ? 8'd123 :
              (in < 127) ? 8'd125 :
              (in < 128) ? 8'd126 :
              (in < 129) ? 8'd128 :
              (in < 130) ? 8'd129 :
              (in < 131) ? 8'd130 :
              (in < 132) ? 8'd132 :
              (in < 133) ? 8'd133 :
              (in < 134) ? 8'd135 :
              (in < 135) ? 8'd136 :
              (in < 136) ? 8'd138 :
              (in < 137) ? 8'd139 :
              (in < 138) ? 8'd141 :
              (in < 139) ? 8'd142 :
              (in < 140) ? 8'd144 :
              (in < 141) ? 8'd145 :
              (in < 142) ? 8'd147 :
              (in < 143) ? 8'd148 :
              (in < 144) ? 8'd150 :
              (in < 145) ? 8'd151 :
              (in < 146) ? 8'd153 :
              (in < 147) ? 8'd154 :
              (in < 148) ? 8'd156 :
              (in < 149) ? 8'd157 :
              (in < 150) ? 8'd158 :
              (in < 151) ? 8'd160 :
              (in < 152) ? 8'd161 :
              (in < 153) ? 8'd163 :
              (in < 154) ? 8'd164 :
              (in < 155) ? 8'd165 :
              (in < 156) ? 8'd167 :
              (in < 157) ? 8'd168 :
              (in < 158) ? 8'd169 :
              (in < 159) ? 8'd171 :
              (in < 160) ? 8'd172 :
              (in < 161) ? 8'd173 :
              (in < 162) ? 8'd175 :
              (in < 163) ? 8'd176 :
              (in < 164) ? 8'd177 :
              (in < 165) ? 8'd179 :
              (in < 166) ? 8'd180 :
              (in < 167) ? 8'd181 :
              (in < 168) ? 8'd182 :
              (in < 169) ? 8'd183 :
              (in < 170) ? 8'd185 :
              (in < 171) ? 8'd186 :
              (in < 172) ? 8'd187 :
              (in < 173) ? 8'd188 :
              (in < 174) ? 8'd189 :
              (in < 175) ? 8'd191 :
              (in < 176) ? 8'd192 :
              (in < 177) ? 8'd193 :
              (in < 178) ? 8'd194 :
              (in < 179) ? 8'd195 :
              (in < 180) ? 8'd196 :
              (in < 181) ? 8'd197 :
              (in < 182) ? 8'd198 :
              (in < 183) ? 8'd199 :
              (in < 184) ? 8'd200 :
              (in < 185) ? 8'd201 :
              (in < 186) ? 8'd202 :
              (in < 187) ? 8'd203 :
              (in < 188) ? 8'd204 :
              (in < 189) ? 8'd205 :
              (in < 190) ? 8'd206 :
              (in < 191) ? 8'd207 :
              (in < 192) ? 8'd208 :
              (in < 193) ? 8'd209 :
              (in < 194) ? 8'd210 :
              (in < 196) ? 8'd211 :
              (in < 197) ? 8'd212 :
              (in < 198) ? 8'd213 :
              (in < 199) ? 8'd214 :
              (in < 200) ? 8'd215 :
              (in < 202) ? 8'd216 :
              (in < 203) ? 8'd217 :
              (in < 204) ? 8'd218 :
              (in < 206) ? 8'd219 :
              (in < 207) ? 8'd220 :
              (in < 209) ? 8'd221 :
              (in < 210) ? 8'd222 :
              (in < 212) ? 8'd223 :
              (in < 213) ? 8'd224 :
              (in < 215) ? 8'd225 :
              (in < 216) ? 8'd226 :
              (in < 218) ? 8'd227 :
              (in < 220) ? 8'd228 :
              (in < 222) ? 8'd229 :
              (in < 223) ? 8'd230 :
              (in < 225) ? 8'd231 :
              (in < 227) ? 8'd232 :
              (in < 229) ? 8'd233 :
              (in < 232) ? 8'd234 :
              (in < 234) ? 8'd235 :
              (in < 236) ? 8'd236 :
              (in < 239) ? 8'd237 :
              (in < 241) ? 8'd238 :
              (in < 244) ? 8'd239 :
              (in < 247) ? 8'd240 :
              (in < 250) ? 8'd241 :
              (in < 253) ? 8'd242 : 
                           8'd243;
    end
    endfunction

    assign RES_read_en = Start_Sigmoid;
    assign SIG_write_en = Start_Sigmoid;
    assign RES_read_address = (state == WRITE_FIXED) ? row * 2 :((state == WRITE_LUT1) ? row * 2 + 1 : 0);

    always @(posedge clk) begin
        case (state)
            IDLE: begin
                if (Start_Sigmoid) begin
                    row <= 0;
                    End_Sigmoid <= 0;
                    state <= WRITE_FIXED;
                    // RES_read_address <= 0;
                end else begin
                    End_Sigmoid <= 0;
                end
            end

            WRITE_FIXED: begin
                // 读取 row 对应的两个值
                // RES_read_address <= row * 2;
                state <= WRITE_FIXED;
                // 写 SIG 第一列，固定为 255
                SIG_write_address <= row * 3;
                SIG_write_data_in <= 8'd255;
                state <= WRITE_LUT1;
            end

            WRITE_LUT1: begin
                // 写 SIG 第二列，读取 RES[row][0]
                // temp_data1 <= RES_read_data_out;
                SIG_write_address <= row * 3 + 1;
                SIG_write_data_in <= lut(RES_read_data_out);
                // RES_read_address <= row * 2 + 1;
                state <= WRITE_LUT2;
            end

            WRITE_LUT2: begin
                // 写 SIG 第三列，读取 RES[row][1]
                // temp_data2 <= RES_read_data_out;
                SIG_write_address <= row * 3 + 2;
                SIG_write_data_in <= lut(RES_read_data_out);

                if (row < 63) begin
                    row <= row + 1;
                    state <= WRITE_FIXED;
                end else begin
                    state <= DONE;
                    End_Sigmoid <= 1;
                end
            end

            DONE: begin // to make sure when back to IDLE, Start_Sigmoid=0              
                state <= IDLE;
            end

            default: begin
                state <= IDLE;
            end
        endcase
    end
endmodule