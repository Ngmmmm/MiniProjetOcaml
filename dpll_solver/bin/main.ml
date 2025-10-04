open Dpll_solver

let () =
  let clauses = Dimacs.parse Sys.argv.(1) in
  let modele = Dpll.solveur_dpll_rec clauses [] in
  Dpll.print_modele modele
