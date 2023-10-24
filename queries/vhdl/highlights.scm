(comment) @comment
(string_literal) @string
(bit_string_literal) @string
(character_literal) @string
(integer_decimal) @number
(predefined_designator) @operator
[
 "all"
 "array"
 "assert"
 "architecture"
 "attribute"
 "begin"
 "block"
 "body"
 "case"
 "component"
 "constant"
 "downto"
 "else"
 "elsif"
 "end"
 "entity"
 "for"
 "function"
 "generate"
 "generic"
 "if"
 "in"
 "inout"
 "is"
 "label"
 "library"
 "loop"
 "map"
 "next"
 "of"
 "open"
 "others"
 "out"
 "package"
 "port"
 "procedure"
 "process"
 "range"
 "record"
 "register"
 "return"
 "report"
 "select"
 "severity"
 "signal"
 "subtype"
 "then"
 "to"
 "type"
 "units"
 "until"
 "use"
 "variable"
 "wait"
 "when"
 "while"
 "with"
 ] @keyword


((simple_name) @boolean
  (#match? @boolean "false\|true"))


; TODO: Make queries to match std_logic libray keywords and types
(subtype_indication
    (type_mark
    ((simple_name) @keyword
      (#match? @keyword "std_logic"))))

[
 "=>"
 "<="
 ":="
 "="
 "/="
 "+"
 "-"
 "**"
 "*"
 "/"
 "&"
 "mod"
 "rol"
 "ror"
 "sla"
 "sll"
 "sra"
 "srl"
 ] @operator

[
 "."
 ","
 ";"
 ":"
] @punctuation.delimiter

; binary operator
[
 "and"
 "nand"
 "nor"
 "not"
 "or"
 "xnor"
 "xor"
 ] @operator

[
 "("
 ")"
 "["
 "]"
] @punctuation.bracket

; Library
(library_clause
  (logical_name_list
    (simple_name) @symbol))
(use_clause) @symbol ;; FIXME: This works for now but it looks kinda wrong

; General type
(type_mark
  (simple_name) @type)

(process_statement
  (label) @label)

; We assume that identifier name containing a prefix and a suffix are records
(selected_name suffix:
  (simple_name) @field)

; Entity declaration
(entity_declaration name:
  (identifier) @symbol)

(component_instantiation_statement
  (label
    (identifier) @label))

(component_instantiation_statement
  (component_instantiation component:
    (simple_name) @symbol))

(constant_interface_declaration
  (identifier_list
    (identifier) @parameter))

;arch
(architecture_body name:
  (identifier) @symbol)

(architecture_body entity:
  (simple_name) @symbol)

(function_call function:
  (simple_name) @function.call)

;NOTE: Assuming that ambiguous followed by an expression list is a function call
; It will color casts as function call as well...

(port_map_aspect
  (association_list
    (named_association_element formal_part:
      (ambiguous_name prefix:
        (simple_name) @variable))))

(ambiguous_name prefix:
  (simple_name) @function.call
    (expression_list))

;; Assume that all simple name in capital are constants
(identifier_list
  ((identifier) @constant)
  (#match? @constant "[A-Z][A-Z\\d_]"))
(((simple_name) @constant)
 (#match? @constant "[A-Z][A-Z\\d_]"))

; Special case for generics, we will highlight them differently during declaration
(generic_clause
  (constant_interface_declaration
    (identifier_list
      ((identifier) @parameter)
      (#match? @parameter "[A-Z][A-Z\\d_]"))))
(generic_map_aspect
   (association_list
     (named_association_element
       formal_part: (simple_name) @parameter)))

