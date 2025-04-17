// System Verilog Code

// must be defined as "packed" struct
typedef struct packed {
   int         control;
   int         data;
   byte        b;
   shortint    h;
   bit [7:0]   intr;
} dpi_struct_t;

module top;

   import "DPI-C" function void dpi_input(input dpi_struct_t sv);
   import "DPI-C" function void dpi_output(output dpi_struct_t c);

   dpi_struct_t sv = '{32'h0123_4567, 32'h89ab_cdef, 8'h31, 16'haabb, 8'hcc};
   dpi_struct_t c;


   initial begin
      $display("\nHello from SystemVerilog!");
      $display("sv_to_c struct: control=%x data=%x b=%x h=%x intr=%x\n", 
               sv.control, sv.data, sv.b, sv.h, sv.intr);

      dpi_input(sv);
      dpi_output(c);

      $display("\nHello from SystemVerilog!");
      $display("c_to_sv struct: control=%x data=%x b=%x h=%x intr=%x\n", 
               c.control, c.data, c.b, c.h, c.intr);
      
      $finish(0);
   end
   
endmodule

