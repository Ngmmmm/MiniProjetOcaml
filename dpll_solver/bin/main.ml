open Dpll_solver

let () =
  let clauses = Dpll.cnf_of_int_list_list (Dimacs.parse Sys.argv.(1)) in
  let modele = Dpll.solveur_dpll clauses in
  Dpll.print_modele modele
