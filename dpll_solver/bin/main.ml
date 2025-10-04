
let () =
  let clauses = Dpll_solver.Dimacs.parse Sys.argv.(1) in
  let modele = Dpll_solver.Dpll.solveur_dpll_rec clauses [] in 
  Dpll_solver.Dpll.print_modele modele
