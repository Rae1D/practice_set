`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/13 15:09:32
// Design Name: 
// Module Name: dbf_phase_cordic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dbf_phase_cordic(
 input    clk,
 input    phase_data_1  ,
 input    phase_data_2  ,
 input    phase_data_3  ,
 input    phase_data_4  ,
 input    phase_data_5  ,
 input    phase_data_6  ,
 input    phase_data_7  ,
 input    phase_data_8  ,
 input    phase_data_9  ,
 input    phase_data_10 ,
 input    phase_data_11 ,
 input    phase_data_12 ,
 input    phase_data_13 ,
 input    phase_data_14 ,
 input    phase_data_15 ,
 input    phase_data_16 ,
 input    phase_data_17 ,
 input    phase_data_18 ,
 input    phase_data_19 ,
 input    phase_data_20 ,
 input    phase_data_21 ,
 input    phase_data_22 ,
 input    phase_data_23 ,
 input    phase_data_24 ,
 input    phase_data_25 ,
 input    phase_data_26 ,
 input    phase_data_27 ,
 input    phase_data_28 ,
 input    phase_data_29 ,
 input    phase_data_30 ,
 input    phase_data_31 ,
 input    phase_data_32 ,
 input    phase_data_33 ,
 input    phase_data_34 ,
 input    phase_data_35 ,
 input    phase_data_36 ,
 input    phase_data_37 ,
 input    phase_data_38 ,
 input    phase_data_39 ,
 input    phase_data_40 ,
 input    phase_data_41 ,
 input    phase_data_42 ,
 input    phase_data_43 ,
 input    phase_data_44 ,
 input    phase_data_45 ,
 input    phase_data_46 ,
 input    phase_data_47 ,
 input    phase_data_48 ,
 input    phase_data_49 ,
 input    phase_data_50 ,
 input    phase_data_51 ,
 input    phase_data_52 ,
 input    phase_data_53 ,
 input    phase_data_54 ,
 input    phase_data_55 ,
 input    phase_data_56 ,
 input    phase_data_57 ,
 input    phase_data_58 ,
 input    phase_data_59 ,
 input    phase_data_60 ,
 input    phase_data_61 ,
 input    phase_data_62 ,
 input    phase_data_63 ,
 input    phase_data_64 ,
 input    phase_data_65 ,
 input    phase_data_66 ,
 input    phase_data_67 ,
 input    phase_data_68 ,
 input    phase_data_69 ,
 input    phase_data_70 ,
 input    phase_data_valid,
 
  output      ph_real_1  ,
  output      ph_real_2  ,
  output      ph_real_3  ,
  output      ph_real_4  ,
  output      ph_real_5  ,
  output      ph_real_6  ,
  output      ph_real_7  ,
  output      ph_real_8  ,
  output      ph_real_9  ,
  output      ph_real_10 ,
  output      ph_real_11 ,
  output      ph_real_12 ,
  output      ph_real_13 ,
  output      ph_real_14 ,
  output      ph_real_15 ,
  output      ph_real_16 ,
  output      ph_real_17 ,
  output      ph_real_18 ,
  output      ph_real_19 ,
  output      ph_real_20 ,
  output      ph_real_21 ,
  output      ph_real_22 ,
  output      ph_real_23 ,
  output      ph_real_24 ,
  output      ph_real_25 ,
  output      ph_real_26 ,
  output      ph_real_27 ,
  output      ph_real_28 ,
  output      ph_real_29 ,
  output      ph_real_30 ,
  output      ph_real_31 ,
  output      ph_real_32 ,
  output      ph_real_33 ,
  output      ph_real_34 ,
  output      ph_real_35 ,
  output      ph_real_36 ,
  output      ph_real_37 ,
  output      ph_real_38 ,
  output      ph_real_39 ,
  output      ph_real_40 ,
  output      ph_real_41 ,
  output      ph_real_42 ,
  output      ph_real_43 ,
  output      ph_real_44 ,
  output      ph_real_45 ,
  output      ph_real_46 ,
  output      ph_real_47 ,
  output      ph_real_48 ,
  output      ph_real_49 ,
  output      ph_real_50 ,
  output      ph_real_51 ,
  output      ph_real_52 ,
  output      ph_real_53 ,
  output      ph_real_54 ,
  output      ph_real_55 ,
  output      ph_real_56 ,
  output      ph_real_57 ,
  output      ph_real_58 ,
  output      ph_real_59 ,
  output      ph_real_60 ,
  output      ph_real_61 ,
  output      ph_real_62 ,
  output      ph_real_63 ,
  output      ph_real_64 ,
  output      ph_real_65 ,
  output      ph_real_66 ,
  output      ph_real_67 ,
  output      ph_real_68 ,
  output      ph_real_69 ,
  output      ph_real_70 ,
   output          ph_image_1   ,
   output          ph_image_2   ,
   output          ph_image_3   ,
   output          ph_image_4   ,
   output          ph_image_5   ,
   output          ph_image_6   ,
   output          ph_image_7   ,
   output          ph_image_8   ,
   output          ph_image_9   ,
   output          ph_image_10  ,
   output          ph_image_11  ,
   output          ph_image_12  ,
   output          ph_image_13  ,
   output          ph_image_14  ,
   output          ph_image_15  ,
   output          ph_image_16  ,
   output          ph_image_17  ,
   output          ph_image_18  ,
   output          ph_image_19  ,
   output          ph_image_20  ,
   output          ph_image_21  ,
   output          ph_image_22  ,
   output          ph_image_23  ,
   output          ph_image_24  ,
   output          ph_image_25  ,
   output          ph_image_26  ,
   output          ph_image_27  ,
   output          ph_image_28  ,
   output          ph_image_29  ,
   output          ph_image_30  ,
   output          ph_image_31  ,
   output          ph_image_32  ,
   output          ph_image_33  ,
   output          ph_image_34  ,
   output          ph_image_35  ,
   output          ph_image_36  ,
   output          ph_image_37  ,
   output          ph_image_38  ,
   output          ph_image_39  ,
   output          ph_image_40  ,
   output          ph_image_41  ,
   output          ph_image_42  ,
   output          ph_image_43  ,
   output          ph_image_44  ,
   output          ph_image_45  ,
   output          ph_image_46  ,
   output          ph_image_47  ,
   output          ph_image_48  ,
   output          ph_image_49  ,
   output          ph_image_50  ,
   output          ph_image_51  ,
   output          ph_image_52  ,
   output          ph_image_53  ,
   output          ph_image_54  ,
   output          ph_image_55  ,
   output          ph_image_56  ,
   output          ph_image_57  ,
   output          ph_image_58  ,
   output          ph_image_59  ,
   output          ph_image_60  ,
   output          ph_image_61  ,
   output          ph_image_62  ,
   output          ph_image_63  ,
   output          ph_image_64  ,
   output          ph_image_65  ,
   output          ph_image_66  ,
   output          ph_image_67  ,
   output          ph_image_68  ,
   output          ph_image_69  ,
   output          ph_image_70  
  
 
    );
 wire c_1  ;
 wire c_2  ;
 wire c_3  ;
 wire c_4  ;
 wire c_5  ;
 wire c_6  ;
 wire c_7  ;
 wire c_8  ;
 wire c_9  ;
 wire c_10 ;
 wire c_11 ;
 wire c_12 ;
 wire c_13 ;
 wire c_14 ;
 wire c_15 ;
 wire c_16 ;
 wire c_17 ;
 wire c_18 ;
 wire c_19 ;
 wire c_20 ;
 wire c_21 ;
 wire c_22 ;
 wire c_23 ;
 wire c_24 ;
 wire c_25 ;
 wire c_26 ;
 wire c_27 ;
 wire c_28 ;
 wire c_29 ;
 wire c_30 ;
 wire c_31 ;
 wire c_32 ;
 wire c_33 ;
 wire c_34 ;
 wire c_35 ;
 wire c_36 ;
 wire c_37 ;
 wire c_38 ;
 wire c_39 ;
 wire c_40 ;
 wire c_41 ;
 wire c_42 ;
 wire c_43 ;
 wire c_44 ;
 wire c_45 ;
 wire c_46 ;
 wire c_47 ;
 wire c_48 ;
 wire c_49 ;
 wire c_50 ;
 wire c_51 ;
 wire c_52 ;
 wire c_53 ;
 wire c_54 ;
 wire c_55 ;
 wire c_56 ;
 wire c_57 ;
 wire c_58 ;
 wire c_59 ;
 wire c_60 ;
 wire c_61 ;
 wire c_62 ;
 wire c_63 ;
 wire c_64 ;
 wire c_65 ;
 wire c_66 ;
 wire c_67 ;
 wire c_68 ;
 wire c_69 ;
 wire c_70 ;
 
 assign  c_1 =7'd1  ;
 assign  c_2 =7'd2  ;
 assign  c_3 =7'd3  ;
 assign  c_4 =7'd4  ;
 assign  c_5 =7'd5  ;
 assign  c_6 =7'd6  ;
 assign  c_7 =7'd7  ;
 assign  c_8 =7'd8  ;
 assign  c_9 =7'd9  ;
 assign  c_10=7'd10 ;
 assign  c_11=7'd11 ;
 assign  c_12=7'd12 ;
 assign  c_13=7'd13 ;
 assign  c_14=7'd14 ;
 assign  c_15=7'd15 ;
 assign  c_16=7'd16 ;
 assign  c_17=7'd17 ;
 assign  c_18=7'd18 ;
 assign  c_19=7'd19 ;
 assign  c_20=7'd20 ;
 assign  c_21=7'd21 ;
 assign  c_22=7'd22 ;
 assign  c_23=7'd23 ;
 assign  c_24=7'd24 ;
 assign  c_25=7'd25 ;
 assign  c_26=7'd26 ;
 assign  c_27=7'd27 ;
 assign  c_28=7'd28 ;
 assign  c_29=7'd29 ;
 assign  c_30=7'd30 ;
 assign  c_31=7'd31 ;
 assign  c_32=7'd32 ;
 assign  c_33=7'd33 ;
 assign  c_34=7'd34 ;
 assign  c_35=7'd35 ;
 assign  c_36=7'd36 ;
 assign  c_37=7'd37 ;
 assign  c_38=7'd38 ;
 assign  c_39=7'd39 ;
 assign  c_40=7'd40 ;
 assign  c_41=7'd41 ;
 assign  c_42=7'd42 ;
 assign  c_43=7'd43 ;
 assign  c_44=7'd44 ;
 assign  c_45=7'd45 ;
 assign  c_46=7'd46 ;
 assign  c_47=7'd47 ;
 assign  c_48=7'd48 ;
 assign  c_49=7'd49 ;
 assign  c_50=7'd50 ;
 assign  c_51=7'd51 ;
 assign  c_52=7'd52 ;
 assign  c_53=7'd53 ;
 assign  c_54=7'd54 ;
 assign  c_55=7'd55 ;
 assign  c_56=7'd56 ;
 assign  c_57=7'd57 ;
 assign  c_58=7'd58 ;
 assign  c_59=7'd59 ;
 assign  c_60=7'd60 ;
 assign  c_61=7'd61 ;
 assign  c_62=7'd62 ;
 assign  c_63=7'd63 ;
 assign  c_64=7'd64 ;
 assign  c_65=7'd65 ;
 assign  c_66=7'd66 ;
 assign  c_67=7'd67 ;
 assign  c_68=7'd68 ;
 assign  c_69=7'd69 ;
 assign  c_70=7'd70 ;
 
 fuyang_cormic_choice fuyang_cormic_choice1(
 .clk(clk),
 .c(c_1),
.phase_data(phase_data_1),

.cormic_data_real(ph_real_1),
.cormic_data_image(ph_image_1)
    );

 fuyang_cormic_choice fuyang_cormic_choice2(
 .clk(clk),
 .c(c_2),
.phase_data(phase_data_2),

.cormic_data_real(ph_real_2),
.cormic_data_image(ph_image_2)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice3(
 .clk(clk),
 .c(c_3),
.phase_data(phase_data_3),

.cormic_data_real(ph_real_3),
.cormic_data_image(ph_image_3)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice4(
 .clk(clk),
 .c(c_4),
.phase_data(phase_data_4),

.cormic_data_real(ph_real_4),
.cormic_data_image(ph_image_4)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice5(
 .clk(clk),
 .c(c_5),
.phase_data(phase_data_5),

.cormic_data_real(ph_real_5),
.cormic_data_image(ph_image_5)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice6(
 .clk(clk),
 .c(c_6),
.phase_data(phase_data_6),

.cormic_data_real(ph_real_6),
.cormic_data_image(ph_image_6)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice7(
 .clk(clk),
 .c(c_7),
.phase_data(phase_data_7),

.cormic_data_real(ph_real_7),
.cormic_data_image(ph_image_7)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice8(
 .clk(clk),
 .c(c_8),
.phase_data(phase_data_8),

.cormic_data_real(ph_real_8),
.cormic_data_image(ph_image_8)
    );

 fuyang_cormic_choice fuyang_cormic_choice9(
 .clk(clk),
 .c(c_9),
.phase_data(phase_data_9),

.cormic_data_real(ph_real_9),
.cormic_data_image(ph_image_9)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice10(
 .clk(clk),
 .c(c_10),
.phase_data(phase_data_10),

.cormic_data_real(ph_real_10),
.cormic_data_image(ph_image_10)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice11(
 .clk(clk),
 .c(c_11),
.phase_data(phase_data_11),

.cormic_data_real(ph_real_11),
.cormic_data_image(ph_image_11)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice12(
 .clk(clk),
 .c(c_12),
.phase_data(phase_data_12),

.cormic_data_real(ph_real_12),
.cormic_data_image(ph_image_12)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice13(
 .clk(clk),
 .c(c_13),
.phase_data(phase_data_13),

.cormic_data_real(ph_real_13),
.cormic_data_image(ph_image_13)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice14(
 .clk(clk),
 .c(c_14),
.phase_data(phase_data_14),

.cormic_data_real(ph_real_14),
.cormic_data_image(ph_image_14)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice15(
 .clk(clk),
 .c(c_15),
.phase_data(phase_data_15),

.cormic_data_real(ph_real_15),
.cormic_data_image(ph_image_15)
    );

 fuyang_cormic_choice fuyang_cormic_choice16(
 .clk(clk),
 .c(c_16),
.phase_data(phase_data_16),

.cormic_data_real(ph_real_16),
.cormic_data_image(ph_image_16)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice17(
 .clk(clk),
 .c(c_17),
.phase_data(phase_data_17),

.cormic_data_real(ph_real_17),
.cormic_data_image(ph_image_17)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice18(
 .clk(clk),
 .c(c_18),
.phase_data(phase_data_18),

.cormic_data_real(ph_real_18),
.cormic_data_image(ph_image_18)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice19(
 .clk(clk),
 .c(c_19),
.phase_data(phase_data_19),

.cormic_data_real(ph_real_19),
.cormic_data_image(ph_image_19)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice20(
 .clk(clk),
 .c(c_20),
.phase_data(phase_data_20),

.cormic_data_real(ph_real_20),
.cormic_data_image(ph_image_20)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice21(
 .clk(clk),
 .c(c_21),
.phase_data(phase_data_21),

.cormic_data_real(ph_real_21),
.cormic_data_image(ph_image_21)
    );
    
   fuyang_cormic_choice fuyang_cormic_choice22(
 .clk(clk),
 .c(c_22),
.phase_data(phase_data_22),

.cormic_data_real(ph_real_22),
.cormic_data_image(ph_image_22)
    );

 fuyang_cormic_choice fuyang_cormic_choice23(
 .clk(clk),
 .c(c_23),
.phase_data(phase_data_23),

.cormic_data_real(ph_real_23),
.cormic_data_image(ph_image_23)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice24(
 .clk(clk),
 .c(c_24),
.phase_data(phase_data_24),

.cormic_data_real(ph_real_24),
.cormic_data_image(ph_image_24)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice25(
 .clk(clk),
 .c(c_25),
.phase_data(phase_data_25),

.cormic_data_real(ph_real_25),
.cormic_data_image(ph_image_25)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice26(
 .clk(clk),
 .c(c_26),
.phase_data(phase_data_26),

.cormic_data_real(ph_real_26),
.cormic_data_image(ph_image_26)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice27(
 .clk(clk),
 .c(c_27),
.phase_data(phase_data_27),

.cormic_data_real(ph_real_27),
.cormic_data_image(ph_image_27)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice28(
 .clk(clk),
 .c(c_28),
.phase_data(phase_data_28),

.cormic_data_real(ph_real_28),
.cormic_data_image(ph_image_28)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice29(
 .clk(clk),
 .c(c_29),
.phase_data(phase_data_29),

.cormic_data_real(ph_real_29),
.cormic_data_image(ph_image_29)
    );

 fuyang_cormic_choice fuyang_cormic_choice30(
 .clk(clk),
 .c(c_30),
.phase_data(phase_data_30),

.cormic_data_real(ph_real_30),
.cormic_data_image(ph_image_30)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice31(
 .clk(clk),
 .c(c_31),
.phase_data(phase_data_31),

.cormic_data_real(ph_real_31),
.cormic_data_image(ph_image_31)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice32(
 .clk(clk),
 .c(c_32),
.phase_data(phase_data_32),

.cormic_data_real(ph_real_32),
.cormic_data_image(ph_image_32)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice33(
 .clk(clk),
 .c(c_33),
.phase_data(phase_data_33),

.cormic_data_real(ph_real_33),
.cormic_data_image(ph_image_33)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice34(
 .clk(clk),
 .c(c_34),
.phase_data(phase_data_34),

.cormic_data_real(ph_real_34),
.cormic_data_image(ph_image_34)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice35(
 .clk(clk),
 .c(c_35),
.phase_data(phase_data_35),

.cormic_data_real(ph_real_35),
.cormic_data_image(ph_image_35)
    );
    
   fuyang_cormic_choice fuyang_cormic_choice36(
 .clk(clk),
 .c(c_36),
.phase_data(phase_data_36),

.cormic_data_real(ph_real_36),
.cormic_data_image(ph_image_36)
    );

 fuyang_cormic_choice fuyang_cormic_choice37(
 .clk(clk),
 .c(c_37),
.phase_data(phase_data_37),

.cormic_data_real(ph_real_37),
.cormic_data_image(ph_image_37)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice38(
 .clk(clk),
 .c(c_38),
.phase_data(phase_data_38),

.cormic_data_real(ph_real_38),
.cormic_data_image(ph_image_38)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice39(
 .clk(clk),
 .c(c_39),
.phase_data(phase_data_39),

.cormic_data_real(ph_real_39),
.cormic_data_image(ph_image_39)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice40(
 .clk(clk),
 .c(c_40),
.phase_data(phase_data_40),

.cormic_data_real(ph_real_40),
.cormic_data_image(ph_image_40)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice41(
 .clk(clk),
 .c(c_41),
.phase_data(phase_data_41),

.cormic_data_real(ph_real_41),
.cormic_data_image(ph_image_41)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice42(
 .clk(clk),
 .c(c_42),
.phase_data(phase_data_42),

.cormic_data_real(ph_real_42),
.cormic_data_image(ph_image_42)
    );
    
   fuyang_cormic_choice fuyang_cormic_choice43(
 .clk(clk),
 .c(c_43),
.phase_data(phase_data_43),

.cormic_data_real(ph_real_43),
.cormic_data_image(ph_image_43)
    );

 fuyang_cormic_choice fuyang_cormic_choice44(
 .clk(clk),
 .c(c_44),
.phase_data(phase_data_44),

.cormic_data_real(ph_real_44),
.cormic_data_image(ph_image_44)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice45(
 .clk(clk),
 .c(c_45),
.phase_data(phase_data_45),

.cormic_data_real(ph_real_45),
.cormic_data_image(ph_image_45)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice46(
 .clk(clk),
 .c(c_46),
.phase_data(phase_data_46),

.cormic_data_real(ph_real_46),
.cormic_data_image(ph_image_46)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice47(
 .clk(clk),
 .c(c_47),
.phase_data(phase_data_47),

.cormic_data_real(ph_real_47),
.cormic_data_image(ph_image_47)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice48(
 .clk(clk),
 .c(c_48),
.phase_data(phase_data_48),

.cormic_data_real(ph_real_48),
.cormic_data_image(ph_image_48)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice49(
 .clk(clk),
 .c(c_49),
.phase_data(phase_data_49),

.cormic_data_real(ph_real_49),
.cormic_data_image(ph_image_49)
    );
    
   fuyang_cormic_choice fuyang_cormic_choice50(
 .clk(clk),
 .c(c_50),
.phase_data(phase_data_50),

.cormic_data_real(ph_real_50),
.cormic_data_image(ph_image_50)
    );

 fuyang_cormic_choice fuyang_cormic_choice51(
 .clk(clk),
 .c(c_51),
.phase_data(phase_data_51),

.cormic_data_real(ph_real_51),
.cormic_data_image(ph_image_51)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice52(
 .clk(clk),
 .c(c_52),
.phase_data(phase_data_52),

.cormic_data_real(ph_real_52),
.cormic_data_image(ph_image_52)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice53(
 .clk(clk),
 .c(c_53),
.phase_data(phase_data_53),

.cormic_data_real(ph_real_53),
.cormic_data_image(ph_image_53)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice54(
 .clk(clk),
 .c(c_54),
.phase_data(phase_data_54),

.cormic_data_real(ph_real_54),
.cormic_data_image(ph_image_54)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice55(
 .clk(clk),
 .c(c_55),
.phase_data(phase_data_55),

.cormic_data_real(ph_real_56),
.cormic_data_image(ph_image_56)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice57(
 .clk(clk),
 .c(c_57),
.phase_data(phase_data_57),

.cormic_data_real(ph_real_57),
.cormic_data_image(ph_image_57)
    );
    
   fuyang_cormic_choice fuyang_cormic_choice58(
 .clk(clk),
 .c(c_58),
.phase_data(phase_data_58),

.cormic_data_real(ph_real_58),
.cormic_data_image(ph_image_58)
    );

 fuyang_cormic_choice fuyang_cormic_choice59(
 .clk(clk),
 .c(c_59),
.phase_data(phase_data_59),

.cormic_data_real(ph_real_59),
.cormic_data_image(ph_image_59)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice60(
 .clk(clk),
 .c(c_60),
.phase_data(phase_data_60),

.cormic_data_real(ph_real_60),
.cormic_data_image(ph_image_60)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice61(
 .clk(clk),
 .c(c_61),
.phase_data(phase_data_61),

.cormic_data_real(ph_real_61),
.cormic_data_image(ph_image_61)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice62(
 .clk(clk),
 .c(c_62),
.phase_data(phase_data_62),

.cormic_data_real(ph_real_62),
.cormic_data_image(ph_image_62)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice63(
 .clk(clk),
 .c(c_63),
.phase_data(phase_data_63),

.cormic_data_real(ph_real_63),
.cormic_data_image(ph_image_63)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice64(
 .clk(clk),
 .c(c_64),
.phase_data(phase_data_64),

.cormic_data_real(ph_real_64),
.cormic_data_image(ph_image_64)
    );
    
    fuyang_cormic_choice fuyang_cormic_choice65(
 .clk(clk),
 .c(c_65),
.phase_data(phase_data_65),

.cormic_data_real(ph_real_65),
.cormic_data_image(ph_image_65)
    );

 fuyang_cormic_choice fuyang_cormic_choice66(
 .clk(clk),
 .c(c_66),
.phase_data(phase_data_66),

.cormic_data_real(ph_real_66),
.cormic_data_image(ph_image_66)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice67(
 .clk(clk),
 .c(c_67),
.phase_data(phase_data_67),

.cormic_data_real(ph_real_67),
.cormic_data_image(ph_image_67)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice68(
 .clk(clk),
 .c(c_68),
.phase_data(phase_data_68),

.cormic_data_real(ph_real_68),
.cormic_data_image(ph_image_68)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice69(
 .clk(clk),
 .c(c_69),
.phase_data(phase_data_69),

.cormic_data_real(ph_real_69),
.cormic_data_image(ph_image_69)
    );
    
  fuyang_cormic_choice fuyang_cormic_choice70(
 .clk(clk),
 .c(c_70),
.phase_data(phase_data_70),

.cormic_data_real(ph_real_70),
.cormic_data_image(ph_image_70)
    );
    
endmodule
