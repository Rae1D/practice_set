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
    output reg [RES_depth_bits-1:0] RES_read_address, 
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

    assign RES_read_en = Start_Sigmoid;
    assign SIG_write_en = Start_Sigmoid;

    always @(posedge clk) begin
        case (state)
            IDLE: begin
                if (Start_Sigmoid) begin
                    row <= 0;
                    End_Sigmoid <= 0;
                    state <= WRITE_FIXED;
                    RES_read_address <= 0;
                end else begin
                    End_Sigmoid <= 0;
                end
            end

            WRITE_FIXED: begin
                // 读取 row 对应的两个值
                RES_read_address <= row * 2;
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
                SIG_write_data_in <= (RES_read_data_out < 4) ? 8'd12 :
                                     (RES_read_data_out < 7) ? 8'd13 :
                                     (RES_read_data_out < 10) ? 8'd14 :
                                     (RES_read_data_out < 13) ? 8'd15 :
                                     (RES_read_data_out < 16) ? 8'd16 :
                                     (RES_read_data_out < 18) ? 8'd17 :
                                     (RES_read_data_out < 21) ? 8'd18 :
                                     (RES_read_data_out < 23) ? 8'd19 :
                                     (RES_read_data_out < 25) ? 8'd20 :
                                     (RES_read_data_out < 28) ? 8'd21 :
                                     (RES_read_data_out < 30) ? 8'd22 :
                                     (RES_read_data_out < 32) ? 8'd23 :
                                     (RES_read_data_out < 34) ? 8'd24 :
                                     (RES_read_data_out < 35) ? 8'd25 :
                                     (RES_read_data_out < 37) ? 8'd26 :
                                     (RES_read_data_out < 39) ? 8'd27 :
                                     (RES_read_data_out < 41) ? 8'd28 :
                                     (RES_read_data_out < 42) ? 8'd29 :
                                     (RES_read_data_out < 44) ? 8'd30 :
                                     (RES_read_data_out < 45) ? 8'd31 :
                                     (RES_read_data_out < 47) ? 8'd32 :
                                     (RES_read_data_out < 48) ? 8'd33 :
                                     (RES_read_data_out < 50) ? 8'd34 :
                                     (RES_read_data_out < 51) ? 8'd35 :
                                     (RES_read_data_out < 53) ? 8'd36 :
                                     (RES_read_data_out < 54) ? 8'd37 :
                                     (RES_read_data_out < 55) ? 8'd38 :
                                     (RES_read_data_out < 57) ? 8'd39 :
                                     (RES_read_data_out < 58) ? 8'd40 :
                                     (RES_read_data_out < 59) ? 8'd41 :
                                     (RES_read_data_out < 60) ? 8'd42 :
                                     (RES_read_data_out < 61) ? 8'd43 :
                                     (RES_read_data_out < 63) ? 8'd44 :
                                     (RES_read_data_out < 64) ? 8'd45 :
                                     (RES_read_data_out < 65) ? 8'd46 :
                                     (RES_read_data_out < 66) ? 8'd47 :
                                     (RES_read_data_out < 67) ? 8'd48 :
                                     (RES_read_data_out < 68) ? 8'd49 :
                                     (RES_read_data_out < 69) ? 8'd50 :
                                     (RES_read_data_out < 70) ? 8'd51 :
                                     (RES_read_data_out < 71) ? 8'd52 :
                                     (RES_read_data_out < 72) ? 8'd53 :
                                     (RES_read_data_out < 73) ? 8'd54 :
                                     (RES_read_data_out < 74) ? 8'd55 :
                                     (RES_read_data_out < 75) ? 8'd56 :
                                     (RES_read_data_out < 76) ? 8'd57 :
                                     (RES_read_data_out < 77) ? 8'd58 :
                                     (RES_read_data_out < 78) ? 8'd59 :
                                     (RES_read_data_out < 79) ? 8'd60 :
                                     (RES_read_data_out < 80) ? 8'd61 :
                                     (RES_read_data_out < 81) ? 8'd62 :
                                     (RES_read_data_out < 82) ? 8'd63 :
                                     (RES_read_data_out < 83) ? 8'd64 :
                                     (RES_read_data_out < 84) ? 8'd66 :
                                     (RES_read_data_out < 85) ? 8'd67 :
                                     (RES_read_data_out < 86) ? 8'd68 :
                                     (RES_read_data_out < 87) ? 8'd69 :
                                     (RES_read_data_out < 88) ? 8'd70 :
                                     (RES_read_data_out < 89) ? 8'd72 :
                                     (RES_read_data_out < 90) ? 8'd73 :
                                     (RES_read_data_out < 91) ? 8'd74 :
                                     (RES_read_data_out < 92) ? 8'd75 :
                                     (RES_read_data_out < 93) ? 8'd76 :
                                     (RES_read_data_out < 94) ? 8'd78 :
                                     (RES_read_data_out < 95) ? 8'd79 :
                                     (RES_read_data_out < 96) ? 8'd80 :
                                     (RES_read_data_out < 97) ? 8'd82 :
                                     (RES_read_data_out < 98) ? 8'd83 :
                                     (RES_read_data_out < 99) ? 8'd84 :
                                     (RES_read_data_out < 100) ? 8'd86 :
                                     (RES_read_data_out < 101) ? 8'd87 :
                                     (RES_read_data_out < 102) ? 8'd88 :
                                     (RES_read_data_out < 103) ? 8'd90 :
                                     (RES_read_data_out < 104) ? 8'd91 :
                                     (RES_read_data_out < 105) ? 8'd92 :
                                     (RES_read_data_out < 106) ? 8'd94 :
                                     (RES_read_data_out < 107) ? 8'd95 :
                                     (RES_read_data_out < 108) ? 8'd97 :
                                     (RES_read_data_out < 109) ? 8'd98 :
                                     (RES_read_data_out < 110) ? 8'd99 :
                                     (RES_read_data_out < 111) ? 8'd101 :
                                     (RES_read_data_out < 112) ? 8'd102 :
                                     (RES_read_data_out < 113) ? 8'd104 :
                                     (RES_read_data_out < 114) ? 8'd105 :
                                     (RES_read_data_out < 115) ? 8'd107 :
                                     (RES_read_data_out < 116) ? 8'd108 :
                                     (RES_read_data_out < 117) ? 8'd110 :
                                     (RES_read_data_out < 118) ? 8'd111 :
                                     (RES_read_data_out < 119) ? 8'd113 :
                                     (RES_read_data_out < 120) ? 8'd114 :
                                     (RES_read_data_out < 121) ? 8'd116 :
                                     (RES_read_data_out < 122) ? 8'd117 :
                                     (RES_read_data_out < 123) ? 8'd119 :
                                     (RES_read_data_out < 124) ? 8'd120 :
                                     (RES_read_data_out < 125) ? 8'd122 :
                                     (RES_read_data_out < 126) ? 8'd123 :
                                     (RES_read_data_out < 127) ? 8'd125 :
                                     (RES_read_data_out < 128) ? 8'd126 :
                                     (RES_read_data_out < 129) ? 8'd128 :
                                     (RES_read_data_out < 130) ? 8'd129 :
                                     (RES_read_data_out < 131) ? 8'd130 :
                                     (RES_read_data_out < 132) ? 8'd132 :
                                     (RES_read_data_out < 133) ? 8'd133 :
                                     (RES_read_data_out < 134) ? 8'd135 :
                                     (RES_read_data_out < 135) ? 8'd136 :
                                     (RES_read_data_out < 136) ? 8'd138 :
                                     (RES_read_data_out < 137) ? 8'd139 :
                                     (RES_read_data_out < 138) ? 8'd141 :
                                     (RES_read_data_out < 139) ? 8'd142 :
                                     (RES_read_data_out < 140) ? 8'd144 :
                                     (RES_read_data_out < 141) ? 8'd145 :
                                     (RES_read_data_out < 142) ? 8'd147 :
                                     (RES_read_data_out < 143) ? 8'd148 :
                                     (RES_read_data_out < 144) ? 8'd150 :
                                     (RES_read_data_out < 145) ? 8'd151 :
                                     (RES_read_data_out < 146) ? 8'd153 :
                                     (RES_read_data_out < 147) ? 8'd154 :
                                     (RES_read_data_out < 148) ? 8'd156 :
                                     (RES_read_data_out < 149) ? 8'd157 :
                                     (RES_read_data_out < 150) ? 8'd158 :
                                     (RES_read_data_out < 151) ? 8'd160 :
                                     (RES_read_data_out < 152) ? 8'd161 :
                                     (RES_read_data_out < 153) ? 8'd163 :
                                     (RES_read_data_out < 154) ? 8'd164 :
                                     (RES_read_data_out < 155) ? 8'd165 :
                                     (RES_read_data_out < 156) ? 8'd167 :
                                     (RES_read_data_out < 157) ? 8'd168 :
                                     (RES_read_data_out < 158) ? 8'd169 :
                                     (RES_read_data_out < 159) ? 8'd171 :
                                     (RES_read_data_out < 160) ? 8'd172 :
                                     (RES_read_data_out < 161) ? 8'd173 :
                                     (RES_read_data_out < 162) ? 8'd175 :
                                     (RES_read_data_out < 163) ? 8'd176 :
                                     (RES_read_data_out < 164) ? 8'd177 :
                                     (RES_read_data_out < 165) ? 8'd179 :
                                     (RES_read_data_out < 166) ? 8'd180 :
                                     (RES_read_data_out < 167) ? 8'd181 :
                                     (RES_read_data_out < 168) ? 8'd182 :
                                     (RES_read_data_out < 169) ? 8'd183 :
                                     (RES_read_data_out < 170) ? 8'd185 :
                                     (RES_read_data_out < 171) ? 8'd186 :
                                     (RES_read_data_out < 172) ? 8'd187 :
                                     (RES_read_data_out < 173) ? 8'd188 :
                                     (RES_read_data_out < 174) ? 8'd189 :
                                     (RES_read_data_out < 175) ? 8'd191 :
                                     (RES_read_data_out < 176) ? 8'd192 :
                                     (RES_read_data_out < 177) ? 8'd193 :
                                     (RES_read_data_out < 178) ? 8'd494 :
                                     (RES_read_data_out < 179) ? 8'd195 :
                                     (RES_read_data_out < 180) ? 8'd196 :
                                     (RES_read_data_out < 181) ? 8'd197 :
                                     (RES_read_data_out < 182) ? 8'd198 :
                                     (RES_read_data_out < 183) ? 8'd199 :
                                     (RES_read_data_out < 184) ? 8'd200 :
                                     (RES_read_data_out < 185) ? 8'd201 :
                                     (RES_read_data_out < 186) ? 8'd202 :
                                     (RES_read_data_out < 187) ? 8'd203 :
                                     (RES_read_data_out < 188) ? 8'd204 :
                                     (RES_read_data_out < 189) ? 8'd205 :
                                     (RES_read_data_out < 190) ? 8'd206 :
                                     (RES_read_data_out < 191) ? 8'd207 :
                                     (RES_read_data_out < 192) ? 8'd208 :
                                     (RES_read_data_out < 193) ? 8'd209 :
                                     (RES_read_data_out < 194) ? 8'd210 :
                                     (RES_read_data_out < 196) ? 8'd211 :
                                     (RES_read_data_out < 197) ? 8'd212 :
                                     (RES_read_data_out < 198) ? 8'd213 :
                                     (RES_read_data_out < 199) ? 8'd214 :
                                     (RES_read_data_out < 200) ? 8'd215 :
                                     (RES_read_data_out < 202) ? 8'd216 :
                                     (RES_read_data_out < 203) ? 8'd217 :
                                     (RES_read_data_out < 204) ? 8'd218 :
                                     (RES_read_data_out < 206) ? 8'd219 :
                                     (RES_read_data_out < 207) ? 8'd220 :
                                     (RES_read_data_out < 209) ? 8'd221 :
                                     (RES_read_data_out < 210) ? 8'd222 :
                                     (RES_read_data_out < 212) ? 8'd223 :
                                     (RES_read_data_out < 213) ? 8'd224 :
                                     (RES_read_data_out < 215) ? 8'd225 :
                                     (RES_read_data_out < 216) ? 8'd226 :
                                     (RES_read_data_out < 218) ? 8'd227 :
                                     (RES_read_data_out < 220) ? 8'd228 :
                                     (RES_read_data_out < 222) ? 8'd229 :
                                     (RES_read_data_out < 223) ? 8'd230 :
                                     (RES_read_data_out < 225) ? 8'd231 :
                                     (RES_read_data_out < 227) ? 8'd232 :
                                     (RES_read_data_out < 229) ? 8'd233 :
                                     (RES_read_data_out < 232) ? 8'd234 :
                                     (RES_read_data_out < 234) ? 8'd235 :
                                     (RES_read_data_out < 236) ? 8'd236 :
                                     (RES_read_data_out < 239) ? 8'd237 :
                                     (RES_read_data_out < 241) ? 8'd238 :
                                     (RES_read_data_out < 244) ? 8'd239 :
                                     (RES_read_data_out < 247) ? 8'd240 :
                                     (RES_read_data_out < 250) ? 8'd241 :
                                     (RES_read_data_out < 253) ? 8'd242 : 8'd243;
                RES_read_address <= row * 2 + 1;
                state <= WRITE_LUT2;
            end

            WRITE_LUT2: begin
                // 写 SIG 第三列，读取 RES[row][1]
                // temp_data2 <= RES_read_data_out;
                SIG_write_address <= row * 3 + 2;
                SIG_write_data_in <= (RES_read_data_out < 4) ? 8'd12 :
                                     (RES_read_data_out < 7) ? 8'd13 :
                                     (RES_read_data_out < 10) ? 8'd14 :
                                     (RES_read_data_out < 13) ? 8'd15 :
                                     (RES_read_data_out < 16) ? 8'd16 :
                                     (RES_read_data_out < 18) ? 8'd17 :
                                     (RES_read_data_out < 21) ? 8'd18 :
                                     (RES_read_data_out < 23) ? 8'd19 :
                                     (RES_read_data_out < 25) ? 8'd20 :
                                     (RES_read_data_out < 28) ? 8'd21 :
                                     (RES_read_data_out < 30) ? 8'd22 :
                                     (RES_read_data_out < 32) ? 8'd23 :
                                     (RES_read_data_out < 34) ? 8'd24 :
                                     (RES_read_data_out < 35) ? 8'd25 :
                                     (RES_read_data_out < 37) ? 8'd26 :
                                     (RES_read_data_out < 39) ? 8'd27 :
                                     (RES_read_data_out < 41) ? 8'd28 :
                                     (RES_read_data_out < 42) ? 8'd29 :
                                     (RES_read_data_out < 44) ? 8'd30 :
                                     (RES_read_data_out < 45) ? 8'd31 :
                                     (RES_read_data_out < 47) ? 8'd32 :
                                     (RES_read_data_out < 48) ? 8'd33 :
                                     (RES_read_data_out < 50) ? 8'd34 :
                                     (RES_read_data_out < 51) ? 8'd35 :
                                     (RES_read_data_out < 53) ? 8'd36 :
                                     (RES_read_data_out < 54) ? 8'd37 :
                                     (RES_read_data_out < 55) ? 8'd38 :
                                     (RES_read_data_out < 57) ? 8'd39 :
                                     (RES_read_data_out < 58) ? 8'd40 :
                                     (RES_read_data_out < 59) ? 8'd41 :
                                     (RES_read_data_out < 60) ? 8'd42 :
                                     (RES_read_data_out < 61) ? 8'd43 :
                                     (RES_read_data_out < 63) ? 8'd44 :
                                     (RES_read_data_out < 64) ? 8'd45 :
                                     (RES_read_data_out < 65) ? 8'd46 :
                                     (RES_read_data_out < 66) ? 8'd47 :
                                     (RES_read_data_out < 67) ? 8'd48 :
                                     (RES_read_data_out < 68) ? 8'd49 :
                                     (RES_read_data_out < 69) ? 8'd50 :
                                     (RES_read_data_out < 70) ? 8'd51 :
                                     (RES_read_data_out < 71) ? 8'd52 :
                                     (RES_read_data_out < 72) ? 8'd53 :
                                     (RES_read_data_out < 73) ? 8'd54 :
                                     (RES_read_data_out < 74) ? 8'd55 :
                                     (RES_read_data_out < 75) ? 8'd56 :
                                     (RES_read_data_out < 76) ? 8'd57 :
                                     (RES_read_data_out < 77) ? 8'd58 :
                                     (RES_read_data_out < 78) ? 8'd59 :
                                     (RES_read_data_out < 79) ? 8'd60 :
                                     (RES_read_data_out < 80) ? 8'd61 :
                                     (RES_read_data_out < 81) ? 8'd62 :
                                     (RES_read_data_out < 82) ? 8'd63 :
                                     (RES_read_data_out < 83) ? 8'd64 :
                                     (RES_read_data_out < 84) ? 8'd66 :
                                     (RES_read_data_out < 85) ? 8'd67 :
                                     (RES_read_data_out < 86) ? 8'd68 :
                                     (RES_read_data_out < 87) ? 8'd69 :
                                     (RES_read_data_out < 88) ? 8'd70 :
                                     (RES_read_data_out < 89) ? 8'd72 :
                                     (RES_read_data_out < 90) ? 8'd73 :
                                     (RES_read_data_out < 91) ? 8'd74 :
                                     (RES_read_data_out < 92) ? 8'd75 :
                                     (RES_read_data_out < 93) ? 8'd76 :
                                     (RES_read_data_out < 94) ? 8'd78 :
                                     (RES_read_data_out < 95) ? 8'd79 :
                                     (RES_read_data_out < 96) ? 8'd80 :
                                     (RES_read_data_out < 97) ? 8'd82 :
                                     (RES_read_data_out < 98) ? 8'd83 :
                                     (RES_read_data_out < 99) ? 8'd84 :
                                     (RES_read_data_out < 100) ? 8'd86 :
                                     (RES_read_data_out < 101) ? 8'd87 :
                                     (RES_read_data_out < 102) ? 8'd88 :
                                     (RES_read_data_out < 103) ? 8'd90 :
                                     (RES_read_data_out < 104) ? 8'd91 :
                                     (RES_read_data_out < 105) ? 8'd92 :
                                     (RES_read_data_out < 106) ? 8'd94 :
                                     (RES_read_data_out < 107) ? 8'd95 :
                                     (RES_read_data_out < 108) ? 8'd97 :
                                     (RES_read_data_out < 109) ? 8'd98 :
                                     (RES_read_data_out < 110) ? 8'd99 :
                                     (RES_read_data_out < 111) ? 8'd101 :
                                     (RES_read_data_out < 112) ? 8'd102 :
                                     (RES_read_data_out < 113) ? 8'd104 :
                                     (RES_read_data_out < 114) ? 8'd105 :
                                     (RES_read_data_out < 115) ? 8'd107 :
                                     (RES_read_data_out < 116) ? 8'd108 :
                                     (RES_read_data_out < 117) ? 8'd110 :
                                     (RES_read_data_out < 118) ? 8'd111 :
                                     (RES_read_data_out < 119) ? 8'd113 :
                                     (RES_read_data_out < 120) ? 8'd114 :
                                     (RES_read_data_out < 121) ? 8'd116 :
                                     (RES_read_data_out < 122) ? 8'd117 :
                                     (RES_read_data_out < 123) ? 8'd119 :
                                     (RES_read_data_out < 124) ? 8'd120 :
                                     (RES_read_data_out < 125) ? 8'd122 :
                                     (RES_read_data_out < 126) ? 8'd123 :
                                     (RES_read_data_out < 127) ? 8'd125 :
                                     (RES_read_data_out < 128) ? 8'd126 :
                                     (RES_read_data_out < 129) ? 8'd128 :
                                     (RES_read_data_out < 130) ? 8'd129 :
                                     (RES_read_data_out < 131) ? 8'd130 :
                                     (RES_read_data_out < 132) ? 8'd132 :
                                     (RES_read_data_out < 133) ? 8'd133 :
                                     (RES_read_data_out < 134) ? 8'd135 :
                                     (RES_read_data_out < 135) ? 8'd136 :
                                     (RES_read_data_out < 136) ? 8'd138 :
                                     (RES_read_data_out < 137) ? 8'd139 :
                                     (RES_read_data_out < 138) ? 8'd141 :
                                     (RES_read_data_out < 139) ? 8'd142 :
                                     (RES_read_data_out < 140) ? 8'd144 :
                                     (RES_read_data_out < 141) ? 8'd145 :
                                     (RES_read_data_out < 142) ? 8'd147 :
                                     (RES_read_data_out < 143) ? 8'd148 :
                                     (RES_read_data_out < 144) ? 8'd150 :
                                     (RES_read_data_out < 145) ? 8'd151 :
                                     (RES_read_data_out < 146) ? 8'd153 :
                                     (RES_read_data_out < 147) ? 8'd154 :
                                     (RES_read_data_out < 148) ? 8'd156 :
                                     (RES_read_data_out < 149) ? 8'd157 :
                                     (RES_read_data_out < 150) ? 8'd158 :
                                     (RES_read_data_out < 151) ? 8'd160 :
                                     (RES_read_data_out < 152) ? 8'd161 :
                                     (RES_read_data_out < 153) ? 8'd163 :
                                     (RES_read_data_out < 154) ? 8'd164 :
                                     (RES_read_data_out < 155) ? 8'd165 :
                                     (RES_read_data_out < 156) ? 8'd167 :
                                     (RES_read_data_out < 157) ? 8'd168 :
                                     (RES_read_data_out < 158) ? 8'd169 :
                                     (RES_read_data_out < 159) ? 8'd171 :
                                     (RES_read_data_out < 160) ? 8'd172 :
                                     (RES_read_data_out < 161) ? 8'd173 :
                                     (RES_read_data_out < 162) ? 8'd175 :
                                     (RES_read_data_out < 163) ? 8'd176 :
                                     (RES_read_data_out < 164) ? 8'd177 :
                                     (RES_read_data_out < 165) ? 8'd179 :
                                     (RES_read_data_out < 166) ? 8'd180 :
                                     (RES_read_data_out < 167) ? 8'd181 :
                                     (RES_read_data_out < 168) ? 8'd182 :
                                     (RES_read_data_out < 169) ? 8'd183 :
                                     (RES_read_data_out < 170) ? 8'd185 :
                                     (RES_read_data_out < 171) ? 8'd186 :
                                     (RES_read_data_out < 172) ? 8'd187 :
                                     (RES_read_data_out < 173) ? 8'd188 :
                                     (RES_read_data_out < 174) ? 8'd189 :
                                     (RES_read_data_out < 175) ? 8'd191 :
                                     (RES_read_data_out < 176) ? 8'd192 :
                                     (RES_read_data_out < 177) ? 8'd193 :
                                     (RES_read_data_out < 178) ? 8'd494 :
                                     (RES_read_data_out < 179) ? 8'd195 :
                                     (RES_read_data_out < 180) ? 8'd196 :
                                     (RES_read_data_out < 181) ? 8'd197 :
                                     (RES_read_data_out < 182) ? 8'd198 :
                                     (RES_read_data_out < 183) ? 8'd199 :
                                     (RES_read_data_out < 184) ? 8'd200 :
                                     (RES_read_data_out < 185) ? 8'd201 :
                                     (RES_read_data_out < 186) ? 8'd202 :
                                     (RES_read_data_out < 187) ? 8'd203 :
                                     (RES_read_data_out < 188) ? 8'd204 :
                                     (RES_read_data_out < 189) ? 8'd205 :
                                     (RES_read_data_out < 190) ? 8'd206 :
                                     (RES_read_data_out < 191) ? 8'd207 :
                                     (RES_read_data_out < 192) ? 8'd208 :
                                     (RES_read_data_out < 193) ? 8'd209 :
                                     (RES_read_data_out < 194) ? 8'd210 :
                                     (RES_read_data_out < 196) ? 8'd211 :
                                     (RES_read_data_out < 197) ? 8'd212 :
                                     (RES_read_data_out < 198) ? 8'd213 :
                                     (RES_read_data_out < 199) ? 8'd214 :
                                     (RES_read_data_out < 200) ? 8'd215 :
                                     (RES_read_data_out < 202) ? 8'd216 :
                                     (RES_read_data_out < 203) ? 8'd217 :
                                     (RES_read_data_out < 204) ? 8'd218 :
                                     (RES_read_data_out < 206) ? 8'd219 :
                                     (RES_read_data_out < 207) ? 8'd220 :
                                     (RES_read_data_out < 209) ? 8'd221 :
                                     (RES_read_data_out < 210) ? 8'd222 :
                                     (RES_read_data_out < 212) ? 8'd223 :
                                     (RES_read_data_out < 213) ? 8'd224 :
                                     (RES_read_data_out < 215) ? 8'd225 :
                                     (RES_read_data_out < 216) ? 8'd226 :
                                     (RES_read_data_out < 218) ? 8'd227 :
                                     (RES_read_data_out < 220) ? 8'd228 :
                                     (RES_read_data_out < 222) ? 8'd229 :
                                     (RES_read_data_out < 223) ? 8'd230 :
                                     (RES_read_data_out < 225) ? 8'd231 :
                                     (RES_read_data_out < 227) ? 8'd232 :
                                     (RES_read_data_out < 229) ? 8'd233 :
                                     (RES_read_data_out < 232) ? 8'd234 :
                                     (RES_read_data_out < 234) ? 8'd235 :
                                     (RES_read_data_out < 236) ? 8'd236 :
                                     (RES_read_data_out < 239) ? 8'd237 :
                                     (RES_read_data_out < 241) ? 8'd238 :
                                     (RES_read_data_out < 244) ? 8'd239 :
                                     (RES_read_data_out < 247) ? 8'd240 :
                                     (RES_read_data_out < 250) ? 8'd241 :
                                     (RES_read_data_out < 253) ? 8'd242 : 8'd243;

                if (row < 63) begin
                    row <= row + 1;
                    state <= WRITE_FIXED;
                end else begin
                    state <= DONE;
                end
            end

            DONE: begin
                End_Sigmoid <= 1;
                state <= IDLE;
            end

            default: begin
                state <= IDLE;
            end
        endcase
    end
endmodule