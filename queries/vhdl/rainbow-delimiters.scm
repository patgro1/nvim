(generic_clause
  "(" @opening
  ")" @closing) @container

(port_clause
  "(" @opening
  ")" @closing) @container

(index_constraint
  "(" @opening
  ")" @closing) @container

(function_call
  "(" @opening
  ")" @closing) @container

(parenthesized_expression
  "(" @opening
  ")" @closing) @container

;NOTE: these are usually ok
(ambiguous_name
  "(" @opening
  ")" @closing) @container

(aggregate
  "(" @opening
  ")" @closing) @container

; NOTE: This is not working for sensitivity list
; (sensitivity_list
;   "(" @opening
;   ")" @closing) @container

(generic_map_aspect
  "(" @opening
  ")" @closing) @container

(port_map_aspect
  "(" @opening
  ")" @closing) @container

