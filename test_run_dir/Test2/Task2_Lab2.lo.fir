circuit Task2_Lab2 :
  module Task2_Lab2 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<1>
    input io_in_1 : UInt<1>
    input io_in_2 : UInt<1>
    input io_in_3 : UInt<1>
    input io_sel_0 : UInt<1>
    input io_sel_1 : UInt<1>
    input io_shift_type : UInt<1>
    output io_out_0 : UInt<1>
    output io_out_1 : UInt<1>
    output io_out_2 : UInt<1>
    output io_out_3 : UInt<1>

    node _mux1_T = add(io_sel_0, io_sel_0) @[Task2_Lab2.scala 15:19]
    node _mux1_T_1 = tail(_mux1_T, 1) @[Task2_Lab2.scala 15:19]
    node _mux1_T_2 = eq(_mux1_T_1, UInt<1>("h0")) @[Task2_Lab2.scala 15:30]
    node _mux1_T_3 = add(io_sel_0, io_sel_1) @[Task2_Lab2.scala 16:19]
    node _mux1_T_4 = tail(_mux1_T_3, 1) @[Task2_Lab2.scala 16:19]
    node _mux1_T_5 = eq(_mux1_T_4, UInt<1>("h1")) @[Task2_Lab2.scala 16:30]
    node _mux1_T_6 = add(io_sel_1, io_sel_0) @[Task2_Lab2.scala 17:19]
    node _mux1_T_7 = tail(_mux1_T_6, 1) @[Task2_Lab2.scala 17:19]
    node _mux1_T_8 = eq(_mux1_T_7, UInt<2>("h2")) @[Task2_Lab2.scala 17:30]
    node _mux1_T_9 = add(io_sel_1, io_sel_1) @[Task2_Lab2.scala 18:19]
    node _mux1_T_10 = tail(_mux1_T_9, 1) @[Task2_Lab2.scala 18:19]
    node _mux1_T_11 = eq(_mux1_T_10, UInt<2>("h3")) @[Task2_Lab2.scala 18:30]
    node _mux1_T_12 = mux(_mux1_T_11, io_in_3, UInt<1>("h0")) @[Mux.scala 98:16]
    node _mux1_T_13 = mux(_mux1_T_8, io_in_2, _mux1_T_12) @[Mux.scala 98:16]
    node _mux1_T_14 = mux(_mux1_T_5, io_in_1, _mux1_T_13) @[Mux.scala 98:16]
    node mux1 = mux(_mux1_T_2, io_in_0, _mux1_T_14) @[Mux.scala 98:16]
    node _mux2_T = add(io_sel_0, io_sel_0) @[Task2_Lab2.scala 22:19]
    node _mux2_T_1 = tail(_mux2_T, 1) @[Task2_Lab2.scala 22:19]
    node _mux2_T_2 = eq(_mux2_T_1, UInt<1>("h0")) @[Task2_Lab2.scala 22:30]
    node _mux2_T_3 = add(io_sel_0, io_sel_1) @[Task2_Lab2.scala 23:19]
    node _mux2_T_4 = tail(_mux2_T_3, 1) @[Task2_Lab2.scala 23:19]
    node _mux2_T_5 = eq(_mux2_T_4, UInt<1>("h1")) @[Task2_Lab2.scala 23:30]
    node _mux2_T_6 = add(io_sel_1, io_sel_0) @[Task2_Lab2.scala 24:19]
    node _mux2_T_7 = tail(_mux2_T_6, 1) @[Task2_Lab2.scala 24:19]
    node _mux2_T_8 = eq(_mux2_T_7, UInt<2>("h2")) @[Task2_Lab2.scala 24:30]
    node _mux2_T_9 = add(io_sel_1, io_sel_1) @[Task2_Lab2.scala 25:19]
    node _mux2_T_10 = tail(_mux2_T_9, 1) @[Task2_Lab2.scala 25:19]
    node _mux2_T_11 = eq(_mux2_T_10, UInt<2>("h3")) @[Task2_Lab2.scala 25:30]
    node _mux2_T_12 = eq(io_shift_type, UInt<1>("h1")) @[Task2_Lab2.scala 25:60]
    node _mux2_T_13 = dshl(io_in_0, UInt<1>("h1")) @[Task2_Lab2.scala 25:81]
    node _mux2_T_14 = dshr(io_in_0, UInt<1>("h1")) @[Task2_Lab2.scala 25:101]
    node _mux2_T_15 = mux(_mux2_T_12, _mux2_T_13, _mux2_T_14) @[Task2_Lab2.scala 25:45]
    node _mux2_T_16 = mux(_mux2_T_11, _mux2_T_15, UInt<1>("h0")) @[Mux.scala 98:16]
    node _mux2_T_17 = mux(_mux2_T_8, io_in_3, _mux2_T_16) @[Mux.scala 98:16]
    node _mux2_T_18 = mux(_mux2_T_5, io_in_2, _mux2_T_17) @[Mux.scala 98:16]
    node mux2 = mux(_mux2_T_2, io_in_1, _mux2_T_18) @[Mux.scala 98:16]
    node _mux3_T = add(io_sel_0, io_sel_0) @[Task2_Lab2.scala 30:19]
    node _mux3_T_1 = tail(_mux3_T, 1) @[Task2_Lab2.scala 30:19]
    node _mux3_T_2 = eq(_mux3_T_1, UInt<1>("h0")) @[Task2_Lab2.scala 30:30]
    node _mux3_T_3 = add(io_sel_0, io_sel_1) @[Task2_Lab2.scala 31:19]
    node _mux3_T_4 = tail(_mux3_T_3, 1) @[Task2_Lab2.scala 31:19]
    node _mux3_T_5 = eq(_mux3_T_4, UInt<1>("h1")) @[Task2_Lab2.scala 31:30]
    node _mux3_T_6 = add(io_sel_1, io_sel_0) @[Task2_Lab2.scala 32:19]
    node _mux3_T_7 = tail(_mux3_T_6, 1) @[Task2_Lab2.scala 32:19]
    node _mux3_T_8 = eq(_mux3_T_7, UInt<2>("h2")) @[Task2_Lab2.scala 32:30]
    node _mux3_T_9 = eq(io_shift_type, UInt<1>("h1")) @[Task2_Lab2.scala 32:60]
    node _mux3_T_10 = dshl(io_in_0, UInt<1>("h1")) @[Task2_Lab2.scala 32:81]
    node _mux3_T_11 = dshr(io_in_0, UInt<1>("h1")) @[Task2_Lab2.scala 32:101]
    node _mux3_T_12 = mux(_mux3_T_9, _mux3_T_10, _mux3_T_11) @[Task2_Lab2.scala 32:45]
    node _mux3_T_13 = add(io_sel_1, io_sel_1) @[Task2_Lab2.scala 33:19]
    node _mux3_T_14 = tail(_mux3_T_13, 1) @[Task2_Lab2.scala 33:19]
    node _mux3_T_15 = eq(_mux3_T_14, UInt<2>("h3")) @[Task2_Lab2.scala 33:30]
    node _mux3_T_16 = eq(io_shift_type, UInt<1>("h1")) @[Task2_Lab2.scala 33:60]
    node _mux3_T_17 = dshl(io_in_1, UInt<1>("h1")) @[Task2_Lab2.scala 33:81]
    node _mux3_T_18 = dshr(io_in_1, UInt<1>("h1")) @[Task2_Lab2.scala 33:101]
    node _mux3_T_19 = mux(_mux3_T_16, _mux3_T_17, _mux3_T_18) @[Task2_Lab2.scala 33:45]
    node _mux3_T_20 = mux(_mux3_T_15, _mux3_T_19, UInt<1>("h0")) @[Mux.scala 98:16]
    node _mux3_T_21 = mux(_mux3_T_8, _mux3_T_12, _mux3_T_20) @[Mux.scala 98:16]
    node _mux3_T_22 = mux(_mux3_T_5, io_in_3, _mux3_T_21) @[Mux.scala 98:16]
    node mux3 = mux(_mux3_T_2, io_in_2, _mux3_T_22) @[Mux.scala 98:16]
    node _mux4_T = add(io_sel_0, io_sel_0) @[Task2_Lab2.scala 37:19]
    node _mux4_T_1 = tail(_mux4_T, 1) @[Task2_Lab2.scala 37:19]
    node _mux4_T_2 = eq(_mux4_T_1, UInt<1>("h0")) @[Task2_Lab2.scala 37:30]
    node _mux4_T_3 = add(io_sel_0, io_sel_1) @[Task2_Lab2.scala 38:19]
    node _mux4_T_4 = tail(_mux4_T_3, 1) @[Task2_Lab2.scala 38:19]
    node _mux4_T_5 = eq(_mux4_T_4, UInt<1>("h1")) @[Task2_Lab2.scala 38:30]
    node _mux4_T_6 = eq(io_shift_type, UInt<1>("h1")) @[Task2_Lab2.scala 38:60]
    node _mux4_T_7 = dshl(io_in_0, UInt<1>("h1")) @[Task2_Lab2.scala 38:81]
    node _mux4_T_8 = dshr(io_in_0, UInt<1>("h1")) @[Task2_Lab2.scala 38:101]
    node _mux4_T_9 = mux(_mux4_T_6, _mux4_T_7, _mux4_T_8) @[Task2_Lab2.scala 38:45]
    node _mux4_T_10 = add(io_sel_1, io_sel_0) @[Task2_Lab2.scala 39:19]
    node _mux4_T_11 = tail(_mux4_T_10, 1) @[Task2_Lab2.scala 39:19]
    node _mux4_T_12 = eq(_mux4_T_11, UInt<2>("h2")) @[Task2_Lab2.scala 39:30]
    node _mux4_T_13 = eq(io_shift_type, UInt<1>("h1")) @[Task2_Lab2.scala 39:60]
    node _mux4_T_14 = dshl(io_in_1, UInt<1>("h1")) @[Task2_Lab2.scala 39:81]
    node _mux4_T_15 = dshr(io_in_1, UInt<1>("h1")) @[Task2_Lab2.scala 39:101]
    node _mux4_T_16 = mux(_mux4_T_13, _mux4_T_14, _mux4_T_15) @[Task2_Lab2.scala 39:45]
    node _mux4_T_17 = add(io_sel_1, io_sel_1) @[Task2_Lab2.scala 40:19]
    node _mux4_T_18 = tail(_mux4_T_17, 1) @[Task2_Lab2.scala 40:19]
    node _mux4_T_19 = eq(_mux4_T_18, UInt<2>("h3")) @[Task2_Lab2.scala 40:30]
    node _mux4_T_20 = eq(io_shift_type, UInt<1>("h1")) @[Task2_Lab2.scala 40:60]
    node _mux4_T_21 = dshl(io_in_2, UInt<1>("h1")) @[Task2_Lab2.scala 40:81]
    node _mux4_T_22 = dshr(io_in_2, UInt<1>("h1")) @[Task2_Lab2.scala 40:101]
    node _mux4_T_23 = mux(_mux4_T_20, _mux4_T_21, _mux4_T_22) @[Task2_Lab2.scala 40:45]
    node _mux4_T_24 = mux(_mux4_T_19, _mux4_T_23, UInt<1>("h0")) @[Mux.scala 98:16]
    node _mux4_T_25 = mux(_mux4_T_12, _mux4_T_16, _mux4_T_24) @[Mux.scala 98:16]
    node _mux4_T_26 = mux(_mux4_T_5, _mux4_T_9, _mux4_T_25) @[Mux.scala 98:16]
    node mux4 = mux(_mux4_T_2, io_in_3, _mux4_T_26) @[Mux.scala 98:16]
    io_out_0 <= mux1 @[Task2_Lab2.scala 43:15]
    io_out_1 <= bits(mux2, 0, 0) @[Task2_Lab2.scala 44:15]
    io_out_2 <= bits(mux3, 0, 0) @[Task2_Lab2.scala 45:15]
    io_out_3 <= bits(mux4, 0, 0) @[Task2_Lab2.scala 46:15]
