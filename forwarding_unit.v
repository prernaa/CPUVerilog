//module for forwarding the arithmetic instructions and preventing data hazards
module forwarding_unit
  ( 
  rf_waddr_exmem,
  rf_waddr_memwb,
  inst_curr_IDEX_7_4_rs,
  inst_curr_IDEX_3_0_rt,
  rf_wen_exmem,
  rf_wen_memwb,
  mem2reg_memwb,
  forwardA,
  forwardB
  );
  
  input [3:0] rf_waddr_exmem;
  input [3:0] rf_waddr_memwb;
  input [3:0] inst_curr_IDEX_7_4_rs;
  input [3:0] inst_curr_IDEX_3_0_rt;
  input rf_wen_exmem;
  input rf_wen_memwb;
  input mem2reg_memwb;
  output [1:0] forwardA;
  output [1:0] forwardB;
  
  
  //just doing it for basic arithmetic data hazards at the moment
  assign forwardA = ((rf_wen_exmem === 1'b1) && (!(rf_waddr_exmem === 4'b0000)) 
              && (rf_waddr_exmem === inst_curr_IDEX_7_4_rs))? 2'b10 : 
              (((rf_wen_memwb === 1'b1) && (!(rf_waddr_memwb === 4'b0000))
              && (!(rf_waddr_exmem === inst_curr_IDEX_7_4_rs)) 
              && (rf_waddr_memwb === inst_curr_IDEX_7_4_rs)
              && (mem2reg_memwb === 1'b1)) ? 2'b01 : 2'b00);
  
  assign forwardB =  ((rf_wen_exmem === 1'b1) && (!(rf_waddr_exmem === 4'b0000)) 
              && (rf_waddr_exmem === inst_curr_IDEX_3_0_rt))? 2'b10 : 
              (((rf_wen_memwb === 1'b1) && (!(rf_waddr_memwb === 4'b0000))
              && (!(rf_waddr_exmem === inst_curr_IDEX_3_0_rt)) 
              && (rf_waddr_memwb === inst_curr_IDEX_3_0_rt)
              && (mem2reg_memwb === 1'b1)) ? 2'b01 : 2'b00);
              
endmodule                 
    
    

