open List

(** Ce fichier contient les fonctions à compléter. *)

(** fonctions utilitaires *)
(** filter_map : ('a -> 'b option) -> 'a list -> 'b list
   disponible depuis la version 4.08.0 de OCaml dans le module List :
   pour chaque élément de `list', appliquer `filter' :
   - si le résultat est `Some e', ajouter `e' au résultat ;
   - si le résultat est `None', ne rien y ajouter.
   Attention, cette implémentation inverse l'ordre de la liste *)
let filter_map filter list =
  let rec aux list ret =
    match list with
    | []   -> ret
    | h::t -> match (filter h) with
      | None   -> aux t ret
      | Some e -> aux t (e::ret)
  in aux list []

type literal = int
type clause = literal list
type cnf = clause list
type interpretation = int list

(** print_modele : int list option -> unit afficher le résultat *)
let print_modele: int list option -> unit = function
  | None   -> print_string "UNSAT\n"
  | Some modele -> print_string "SAT\n";
     let modele_trie = sort (fun i j -> (abs i) - (abs j)) modele in
     List.iter (fun i -> print_int i; print_string " ") modele_trie;
     print_string "0\n"

(** simplifie : literal -> cnf -> cnf 
   applique la simplification de l'ensemble des clauses en mettant
   le littéral l à vrai *)
let simplifie l clauses =
  (* à compléter *)
  []

(** solveur_split : cnf -> interpretation -> interpretation option
   exemple d'utilisation de `simplifie' cette fonction ne doit pas être modifiée, sauf si vous changez 
   le type de la fonction simplifie *)
let rec solveur_split clauses interpretation =
  (* l'ensemble vide de clauses est satisfiable *)
  if clauses = [] then Some interpretation else
  (* la clause vide n'est jamais satisfiable *)
  if mem [] clauses then None else
  (* branchement *) 
  let l = hd (hd clauses) in
  let branche = solveur_split (simplifie l clauses) (l::interpretation) in
  match branche with
  | None -> solveur_split (simplifie (-l) clauses) ((-l)::interpretation)
  | _    -> branche

(** solveur dpll récursif *)

(** pur : cnf -> literal option
    - si `clauses' contient au moins un littéral pur, retourne
      ce littéral ;
    - sinon renvoie None *)
let pur clauses =
  (* à compléter *)
  0

(** unitaire : cnf -> literal option
    - si `clauses' contient au moins une clause unitaire, retourne
      le littéral de cette clause unitaire ;
    - sinon renvoie None *)
let unitaire clauses =
  (* à compléter *)
  0

(** solveur_dpll_rec : cnf -> interpretation -> interpretation option *)
let rec solveur_dpll_rec clauses interpretation =
  (* à compléter *)
  None