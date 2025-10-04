
(**  Les literaux sont représentés par des entiers. 
    Un entier positif n représente le littéral n, 
    un entier négatif -n représente le littéral ¬n.
  *)
type literal = int
(** Une clause est une disjonction de littéraux. 
    On la représente ici simplement par une liste. *)
type clause = literal list
(** Une formule en CNF est une conjonction de clauses.
    On la représente ici simplement par une liste de clauses. *)
type cnf = clause list
type interpretation = int list
type resultat = Sat of interpretation | Unsat

(** Cette fonction prend un argument un objet de type resulat et l'affiche à l'écran. *)
val print_modele : resultat-> unit

(** Cette fonction prend en argument une formule en CNF et renvoie 
    une interprétation qui la satisfait si elle existe, ou Unsat sinon.
    Cette fonction utilise l'algorithme naïf qui teste toutes les branchements possibles.
    *)
val solveur_split : cnf -> interpretation -> resultat

(** Cette fonction prend en argument une formule en CNF et renvoie 
    une interprétation qui la satisfait si elle existe, ou Unsat sinon.
    Cette fonction utilise l'algorithme DPLL.
    *)
val solveur_dpll_rec : cnf -> interpretation -> resultat