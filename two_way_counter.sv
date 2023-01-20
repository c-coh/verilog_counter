module two_way_counter #(
parameter N = 4
) (
  input logic clock,
  input logic up,
  input logic set_b,
  input logic enable_b,
  input logic [N-1:0] set,
  output logic carry_b,
  output logic [N-1:0] q
  
  );
  always_ff @(posedge clock) begin
    if (~en_b) begin
      if (set_b) begin
          if(up) begin
            q = (q + 1);
          end
          else begin
            q = (q - 1);
          end
        end
        else begin
          q <= set;
        end
       end
     end
    assign carry_b = ~((&q & up) + (~(|q) & ~up));
endmodule
