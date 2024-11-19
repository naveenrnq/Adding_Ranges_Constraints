class generator;

  randc bit [3:0] a,b;  // rand or randc
  bit [3:0] y;
 
  constraint data { a inside {[0:8], [10:11], 15}; // 0 1 2 3 4 5  6 7 8 10 11 15
                   b inside {[3:11]}; // 3, 4, 5,.., 11
                  }

endclass

module tb;
 generator g;
 int i = 0;
 int status = 0; // this is to store the result of randomization
 
 initial begin
   g = new();
   for(i = 0; i < 20; i++) begin

     status = g.randomize(); // So we understood it gives 1 when randomization is successfull
     
     if(!g.randomize()) begin
       $display("Randomization Failed at %0t", $time);
       $finish(); // As soon as randomization fails stop simulation
     end
     
    
     $display("Value of a: %0d and b: %0d with status: %0d", g.a,g.b,status);
     #10; 
   end
 end

endmodule
