test : dialog {
label = "Test";
  spacer_1;
  : text { label = "Edit Box 1: "; alignment = centered; }
  : edit_box { key = "ed_1"; edit_width = 12; alignment = centered; fixed_width = true; }
  spacer_1;
  : text { label = "Edit Box 2: "; alignment = centered; }
  : edit_box { key = "ed_2"; edit_width = 12; alignment = centered; fixed_width = true; }
  ok_cancel;
} // dialog