%{
--
-- The Extended BON Tool Suite: BON Parser
-- Copyright (C) 2001-2004 Joseph Kiniry
-- All Rights Reserved
--

--
-- $Id: bon_parser.y,v 1.2 2005/12/21 14:11:10 kiniry Exp $
--

note
  title:       "The Extended BON Tool Suite"
  description: "The BON Parser."
  copyright:   "Copyright (c) 2001-2004 Joseph R. Kiniry and others, %
				  % see file 'forum.txt'"
  license:     "Eiffel Forum License v1 (see forum.txt)"
  author:      "Joseph R. Kiniry <kiniry@acm.org>"
  revision:    "$Revision: 1.2 $"
  version:     "v3-2004"

class BON_PARSER
  -- A parser for the BON specification language.

  --* todo: "Consider using nonterminal symbols to automatically type %
  --   %expressions to fixed types in the MOG."
  --* see: "gobo/doc/geyacc/declarations.html for more information."

inherit
  BON_PARSER_SKELETON
  -- All core code for parser is in the skeleton.

create
  make_parser, execute, benchmark
%}

-- Geyacc options (currently undefined, Aug 9, 2001)

-- %option 

-- Token Declarations: Each terminal symbol that is not a single-character
-- literal must be declared here. (Single-character literals normally don't
-- need to be declared.)

-- Typed token declarations for some basic generic tokens.

-- The Identifier construct is defined as a sequence of alphanumeric -
-- characters including underscore. An identifier must begin with an
-- alphanumeric character and must not end with an underscore (whose
-- purpose really is to mimic word separation). Letter case is not
-- significant, but using consistent style rules is important.

%token <STRING> IDENTIFIER_TOKEN

-- Basic non-numeric types.

%token <CHARACTER> CHARACTER_TOKEN

-- Integers and Real are the basic numeric types.

%token <INTEGER> INTEGER_TOKEN
%token <REAL> REAL_TOKEN

-- Tokens for string handling.  @see "Strings" section of ebon/docs/BON.txt.
-- We currently do not support redefining String_begin and String_end.

%token STRING_DELIMITER_TOKEN
	%token <STRING> SIMPLE_STRING_TOKEN
%token <STRING> NEWLINE_TOKEN

-- The FREE_OPERATOR_TOKEN represents feature names used as infix and
-- prefix operations. Such operations may be textual keywords, such as the
-- boolean "and" and "or", but are more often composed of special
-- characters, like "+", "**", "=>", etc.

%token <STRING> FREE_OPERATOR_TOKEN

-- The BON reserved words.

%token CURRENT_TOKEN
%token RESULT_TOKEN
%token VOID_TOKEN
%token ACTION_TOKEN
%token CALLS_TOKEN
%token CLASS_TOKEN
%token CLASS_CHART_TOKEN
%token CLIENT_TOKEN
%token CLUSTER_TOKEN
%token CLUSTER_CHART_TOKEN
%token COMMAND_TOKEN
%token COMPONENT_TOKEN
%token CONCATENATOR_TOKEN
%token CONSTRAINT_TOKEN
%token CREATES_TOKEN
%token CREATION_CHART_TOKEN
%token CREATOR_TOKEN
%token DEFERRED_TOKEN
%token DESCRIPTION_TOKEN
%token DICTIONARY_TOKEN
%token DYNAMIC_DIAGRAM_TOKEN
%token EFFECTIVE_TOKEN
%token END_TOKEN
%token ENSURE_TOKEN
%token EVENT_TOKEN
%token EVENT_CHART_TOKEN
%token EXISTS_TOKEN
%token EXPLANATION_TOKEN
%token FALSE_TOKEN
%token FEATURE_TOKEN
%token FOR_ALL_TOKEN
%token INCOMING_TOKEN
%token INDEXING_TOKEN
%token INFIX_TOKEN
%token INHERIT_TOKEN
%token INTERFACED_TOKEN
%token INVARIANT_TOKEN
%token INVOLVES_TOKEN
%token IT_HOLDS_TOKEN
%token KEYWORD_PREFIX_TOKEN
%token NAMELESS_TOKEN
%token OBJECT_TOKEN
%token OBJECT_GROUP_TOKEN
%token OBJECT_STACK_TOKEN
%token OUTGOING_TOKEN
%token PART_TOKEN
%token PERSISTENT_TOKEN
%token PREFIX_TOKEN
%token QUERY_TOKEN
%token REDEFINED_TOKEN
%token REQUIRE_TOKEN
%token REUSED_TOKEN
%token ROOT_TOKEN
%token SCENARIO_TOKEN
%token SCENARIO_CHART_TOKEN
%token STATIC_DIAGRAM_TOKEN
%token STRING_MARKS_TOKEN
%token SUCH_THAT_TOKEN
%token SYSTEM_CHART_TOKEN
%token TRUE_TOKEN

-- BON special symbols that are at least two characters long.  Uncommented 
-- symbols are those that didn't need to have precedence set above.

-- Introduces comments   
%token DOUBLE_DASH_TOKEN "--"

-- Integer division operator
-- DOUBLE_SLASH_TOKEN "//"

-- Modulo operator
-- DOUBLE_BACKSLASH_TOKEN "\\"

-- Relational operators 
-- LESS_THAN_OR_EQUAL_TOKEN "<="
-- GREATER_THAN_OR_EQUAL_TOKEN ">="

-- Equality and non-equality  
-- NOT_EQUAL_TOKEN "/="

-- Feature arguments, constrained genericity, logical implication 
-- IMPLIES_TOKEN "->"

-- Logical equivalence 
-- EQUIVALENT_TO_TOKEN "<->"

-- Interval marker 
%token DOUBLE_DOT_TOKEN ".."

-- Indicates aggregate supplier
%token AGGREGATE_MARK_TOKEN ":{"

-- Undocumented tokens in original BON grammar.

%token ELLIPSES_TOKEN "..."

-- Basic constructs

-- The recommended BON standard is to use all upper case names for class
-- and cluster names, all lower case for feature names, and lower case
-- beginning with a capital for object groups and constants values. We also
-- strongly recommend using underscore for word separation rather than, for
-- example, in-word capitalization, since this greatly enhances
-- readability.  

-- @design kiniry - Aug 24, 2001 - These tokens are currently not used but
-- are reserved for potential future use.

%token <STRING> CLASS_NAME_TOKEN
%token <STRING> CLUSTER_NAME_TOKEN
%token <STRING> ALL_CAPS_IDENTIFIER_TOKEN
%token <STRING> FEATURE_NAME_TOKEN
%token <STRING> OBJECT_GROUP_OR_CONSTANT_NAME_TOKEN

-- Relative operator precedence is determined by their specification order 
-- in the grammar.  Also, each mathematical operator is left or right 
-- associative, as declared by the %left and %right precedence 
-- declarations.  Precedence goes from low to high as we list operators.

-- We have to add the dummy token UNARY_DUMMY for unary minus and plus
-- because they have the highest precedence of all and must be used to
-- disambiguate operator precedence based upon context.  @see the final
-- section of gobo/doc/geyacc/precedence.html for details.

%right IMPLIES_TOKEN EQUIVALENT_TO_TOKEN
%left MEMBER_OF_TOKEN ':'
%left AND_TOKEN OR_TOKEN XOR_TOKEN
%right NOT_TOKEN
%left '<' LESS_THAN_OR_EQUAL_TOKEN '>' GREATER_THAN_OR_EQUAL_TOKEN '=' NOT_EQUAL_TOKEN
%left '+' '-'
%left '*' '/' DOUBLE_SLASH_TOKEN DOUBLE_BACKSLASH_TOKEN
%right '^'
%left UNARY_DUMMY
%right OLD_TOKEN DELTA_TOKEN

-- Type declarations for non-terminals.  Recall that if a non-terminal 
-- does not have a type declaration, its type defaults to the generic 
-- parameter of YY_PARSER_SKELETON, in this instance, ANY.

-- Rules that bind to base or simple types.

--%type <BOOLEAN>   Boolean_constant
%type <BOOLEAN>   Optional_Interfaced
%type <BOOLEAN>   Optional_Persistent
%type <BOOLEAN>   Optional_Reused
%type <BOOLEAN>   Optional_Nameless
--%type <CHARACTER> Character_constant
--%type <INTEGER>   Integer_constant
%type <INTEGER>   Multiplicity         Optional_Multiplicity_clause
--%type <REAL>      Real_constant

%type <STRING> Action_label Action_description
%type <STRING> Class_name             Optional_Class_name
%type <STRING> Cluster_name
%type <STRING> Cluster_prefix
%type <STRING> Dynamic_component_name
%type <STRING> Extended_id            Optional_Extended_id  Optional_Extended_id_clause
%type <STRING> Formal_generic_name
%type <STRING> Group_name Group_prefix Zero_or_more_Group_prefixes
%type <STRING> Identifier   All_caps_identifier
%type <STRING> Index_string
%type <STRING> Line_comment           At_least_one_Line_comment   Optional_Line_comments
--%type <STRING> Manifest_string
%type <STRING> Manifest_textblock
%type <STRING> Message_label Optional_Message_label
--%type <STRING> Object_name
%type <STRING> Optional_Deferred_or_Effective_or_Redefined
%type <STRING> Optional_Explanation_Manifest_string
%type <STRING> Optional_Incoming_or_Outgoing_clause
%type <STRING> Optional_Part_Manifest_string
%type <STRING> Optional_Root_or_Deferred_or_Effective 
%type <STRING> Scenario_name 
%type <STRING> Semantic_label         Optional_Semantic_label
%type <STRING> Static_component_name
%type <STRING> System_name
%type <STRING> Zero_or_more_Cluster_prefixes

%type <INTEGER> Shared_mark

%type <STATIC_REF> Static_ref Child Client Parent Supplier

-- Rules that bind to MOG types.

-- A.3 BON SPECIFICATION 

%type <BON_SPECIFICATION> Bon_specification
%type <SPECIFICATION_ELEMENT> Specification_element
%type <SPECIFICATION_ELEMENTS> At_least_one_Specification_element Optional_Specification_elements

-- A.4 INFORMAL CHARTS

%type <INFORMAL_CHART> Informal_chart

%type <CLASS_DICTIONARY> Class_dictionary_rule

%type <DICTIONARY_ENTRY> Dictionary_entry
%type <DICTIONARY_ENTRIES> At_least_one_Dictionary_entry Optional_Dictionary_entries

%type <SYSTEM_CHART> System_chart_rule

%type <INDEX_CLAUSE> Index_clause
%type <INDEX_LIST> Index_list At_least_one_Index_clause Indexing_Index_list Optional_Index_clauses Optional_Indexing_Index_list

%type <STRING_LIST> Index_term_list At_least_one_Index_string Optional_Index_strings

%type <CLUSTER_ENTRY> Cluster_entry
%type <CLUSTER_ENTRIES> Cluster_entries At_least_one_Cluster_entry Optional_Cluster_entries Optional_Cluster_entries_rule

%type <CLUSTER_CHART> Cluster_chart_rule

%type <CLASS_ENTRY> Class_entry
%type <CLASS_ENTRIES> Class_entries At_least_one_Class_entry Optional_Class_entries Optional_Class_entries_rule

%type <CLASS_CHART> Class_chart_rule

%type <CLASS_NAME_LIST> Optional_Inherit_Class_name_list

%type <QUERY_LIST> Query_list Optional_Query_list At_least_one_Query Optional_Queries
%type <STRING> Query

%type <COMMAND_LIST> Command_list Optional_Command_list At_least_one_Command Optional_Commands
%type <STRING> Command

%type <CONSTRAINT_LIST> Constraint_list Optional_Constraint_list At_least_one_Constraint Optional_Constraints
%type <STRING> Constraint

%type <STRING_LIST> At_least_one_Manifest_string Optional_Manifest_strings

%type <CLASS_NAME_LIST> Class_name_list At_least_one_Class_name Optional_Class_names

%type <EVENT_CHART> Event_chart_rule

%type <EVENT_ENTRY> Event_entry
%type <EVENT_ENTRIES> Event_entries At_least_one_Event_entry Optional_Event_entries Optional_Event_entries_clause

%type <SCENARIO_CHART> Scenario_chart_rule

%type <SCENARIO_ENTRY> Scenario_entry
%type <SCENARIO_ENTRIES> Scenario_entries At_least_one_Scenario_entry Optional_Scenario_entries Optional_Scenario_entries_clause

%type <CREATION_CHART> Creation_chart_rule

%type <CREATION_ENTRY> Creation_entry
%type <CREATION_ENTRIES> Optional_Creation_entries_clause

-- A.5 STATIC DIAGRAMS 

%type <STATIC_DIAGRAM> Static_diagram_rule

%type <COMMENT> Comment Optional_Comment

%type <STATIC_COMPONENT> Static_component
%type <UNSPECIFIED_STATIC_COMPONENT> Unspecified_Static_component
%type <STATIC_COMPONENTS> Static_block
%type <STATIC_COMPONENTS> Cluster_components Optional_Cluster_components Zero_or_more_Static_components

%type <CLUSTER_SPECIFICATION> Cluster_rule

%type <CLASS_SPECIFICATION> Class_rule
%type <STATIC_RELATION> Static_relation
%type <INHERITANCE_RELATION> Inheritance_relation
%type <CLIENT_RELATION> Client_relation

%type <FORMAL_GENERIC> Formal_generic
%type <FORMAL_GENERIC_LIST> Optional_Formal_generics_clause Formal_generics Formal_generic_list At_least_one_Formal_generic Optional_Formal_generics

%type <CLASS_TYPE> Class_type Optional_Implies_Class_type
%type <ACTUAL_GENERICS> Optional_Actual_generics Actual_generics Type_list At_least_one_Type Optional_types
--%type <TYPE_LIST> Type_list At_least_one_Type Optional_types
%type <BON_TYPE> Type

%type <TYPE_MARK> Type_mark Optional_Type_mark

%type <CLIENT_ENTITY> Client_entity
%type <CLIENT_ENTITIES> Client_entities Optional_Client_entities Client_entity_list At_least_one_Client_entity Remaining_Client_entities Client_entity_expression

%type <SUPPLIER_INDIRECTION> Supplier_indirection

%type <FEATURE_NAME_LIST> Indirection_feature_list Indirection_feature_part Optional_Indirection_feature_part

%type <GENERIC_INDIRECTION> Generic_indirection
%type <PARENT_INDIRECTION> Parent_indirection

%type <NAMED_INDIRECTION> Named_indirection

%type <INDIRECTION_ELEMENT> Indirection_element
%type <INDIRECTION_LIST> Indirection_list At_least_one_Indirection_element Optional_Indirection_elements Optional_Indirection_list_clause

-- A.6 CLASS INTERFACE DESCRIPTION

%type <CLASS_INTERFACE> Class_interface Optional_Class_interface
%type <ASSERTION_CLAUSE_LIST> Class_invariant Optional_Invariant_Class_invariant Precondition Postcondition
%type <CLASS_TYPE_LIST> Parent_class_list At_least_one_Class_type Optional_Class_types Optional_Inherit_Parent_class_list
%type <CLASS_NAME_LIST> Optional_Selective_export Selective_export
%type <FEATURE_CLAUSE_LIST> Features At_least_one_Feature_clause Optional_Feature_clauses
%type <FEATURE_CLAUSE> Feature_clause
%type <FEATURE_NAME> Feature_name Prefix_rule Infix_rule
%type <BON_TYPE> Optional_Type_mark_Type
%type <OPERATOR> Prefix_operator Infix_operator
%type <BINARY_OPERATOR> Binary
%type <UNARY_OPERATOR> Unary
%type <SIGN> Sign
%type <RENAMING> Rename_clause Renaming Optional_Rename_clause
%type <FEATURE_ARGUMENT_LIST> Feature_arguments At_least_one_Feature_argument Optional_Feature_arguments Optional_Feature_arguments_clause
%type <FEATURE_ARGUMENT> Feature_argument
%type <STRING_LIST> Identifier_list At_least_one_Identifier Optional_Identifier_list Optional_Identifiers
%type <FEATURE_NAME_LIST> Feature_name_list At_least_one_Feature_name Optional_Feature_names
%type <CONTRACT_CLAUSE> Contract_clause Optional_Contract_clause Contracting_conditions Pre_and_post 
%type <FEATURE_SPECIFICATION_LIST> Feature_specifications At_least_one_Feature_specification Optional_Feature_specifications
%type <FEATURE_SPECIFICATION> Feature_specification

-- A.7 FORMAL ASSERTIONS

%type <ASSERTION_CLAUSE_LIST> Assertion At_least_one_Assertion_clause Optional_Assertion_clauses
%type <ASSERTION_CLAUSE> Assertion_clause
%type <ASSERTION_COMMENT> Assertion_comment
%type <BOOLEAN_EXPRESSION> Boolean_expression Expression Optional_Restriction Restriction Proposition
--%type <EXPRESSION> Expression
%type <QUANTIFIER> Quantifier
%type <QUANTIFICATION> Quantification
%type <VARIABLE_RANGE_LIST> Range_expression At_least_one_Variable_range Optional_Variable_ranges
--%type <RESTRICTION> Optional_Restriction Restriction
--%type <PROPOSITION> Proposition
%type <VARIABLE_RANGE> Variable_range
%type <MEMBER_RANGE> Member_range
%type <TYPE_RANGE> Type_range
%type <CALL> Call
--%type <PARENTHESIZED> Optional_Parenthesized_qualifier Parenthesized_qualifier Parenthesized
%type <BOOLEAN_EXPRESSION> Optional_Parenthesized_qualifier Parenthesized_qualifier Parenthesized
%type <UNQUALIFIED_CALLS> Call_chain At_least_one_Unqualified_call Optional_Unqualified_calls
%type <UNQUALIFIED_CALL> Unqualified_call
--%type <ACTUAL_ARGUMENTS> Optional_Actual_arguments Actual_arguments
%type <EXPRESSION_LIST> Expression_list At_least_one_Expression Optional_Expressions Optional_Actual_arguments Actual_arguments
%type <OPERATOR_EXPRESSION> Operator_expression
%type <UNARY_EXPRESSION> Unary_expression
%type <BINARY_EXPRESSION> Binary_expression
%type <SET_EXPRESSION> Set_expression
%type <ENUMERATED_SET> Enumerated_set
--%type <ENUMERATION_LIST> Enumeration_list At_least_one_Enumeration_element Optional_Enumeration_elements
%type <ENUMERATED_SET> Enumeration_list At_least_one_Enumeration_element Optional_Enumeration_elements
%type <ENUMERATION_ELEMENT> Enumeration_element
%type <BON_INTERVAL> Interval
%type <BON_INTEGER_INTERVAL> Integer_interval
%type <CHARACTER_INTERVAL> Character_interval
%type <CONSTANT> Constant
%type <MANIFEST_CONSTANT> Manifest_constant
%type <RESULT_CONSTANT> Result_constant
%type <CURRENT_CONSTANT> Current_constant
%type <VOID_CONSTANT> Void_constant
%type <BOOLEAN_CONSTANT>   Boolean_constant
%type <CHARACTER_CONSTANT> Character_constant
%type <INTEGER_CONSTANT> Integer_constant
%type <REAL_CONSTANT> Real_constant
%type <MANIFEST_STRING> Manifest_string

-- A.8 DYNAMIC DIAGRAMS

%type <DYNAMIC_DIAGRAM> Dynamic_diagram_rule
%type <DYNAMIC_COMPONENTS> Dynamic_block Group_components Optional_Group_components
%type <DYNAMIC_COMPONENT> Dynamic_component
%type <SCENARIO_DESCRIPTION> Scenario_description
%type <OBJECT_GROUP> Object_group_rule
%type <OBJECT_STACK> Object_stack_rule
%type <OBJECT> Object_rule
%type <MESSAGE_RELATION> Message_relation
%type <LABELED_ACTIONS> Labeled_actions At_least_one_Labeled_action Optional_Labeled_actions
%type <LABELED_ACTION> Labeled_action
%type <DYNAMIC_REF> Dynamic_ref Caller Receiver
%type <OBJECT_NAME> Object_name

-- Indicate how many shift/reduce conflicts we expect.  This is only used
-- to simplify grammar debugging.  Our total is 64: 1 for the rules
-- involving line comments (At_least_one_Line_comment,
-- Optional_Line_comments, and Line_Comment), plus 21 relating to 
-- Boolean_expression resolved by operator precedence, plus 21 relating to 
-- Unary_expression resolved by operator precedence, plus 21 relating to 
-- Binary_expression resolved by operator precedence.

%expect 64

%start Bon_specification

%%

-- Grammar rules

-- We have rewritten the BON specification from the text using the
-- following methodology.

-- Every rule of the form:
--     Rule = [ Foobar ]
-- becomes
--     Rule: Optional_Foobar_clause ;
--     Optional_Foobar_clause: -- Empty
--         | Foobar ;
--     Foobar: ...whatever... ;

-- Likewise, every rule of the form:
--     Rule = { Foobar } +
-- becomes
--     Rule: At_least_one_Foobar ;
--     At_least_one_Foobar: Foobar
--        Optional_Foobars ;
--     Optional_Foobars: -- Empty
--         | Optional_Foobars Foobar ;
--     Foobar: ...whatever... ;

-- Finally, every rule of the form:
--     Rule = { Foobar }
-- becomes
--     Rule: Zero_or_more_Foobars ;
--     Zero_or_more_Foobars: -- Empty
--       | Zero_or_more_Foobars Foobar ;
--     Foobar: ...whatever... ;

-- Some of these blind EBNF->Geyacc rewrites result in reduce/reduce
-- conflicts that need to be handled.  @see Gobo document 
-- gobo/doc/geyacc/algorithm.html for more information on typical
-- reduce/reduce situations and solutions.

-- For the most part, these grammars can be simplified by eliminating rules
-- that are simply intermediates nodes in the parse tree
-- (e.g. At_least_one_Specification_element below) but at a potential loss
-- in clarity.  The plan is to keep it in its simplest form for now, then
-- later try the optimization and see if it makes a serious difference.  I
-- doubt that it will.

-- Constucts of binary or triplet form have names indicating such.  E.g.
--    { Simple_string New_line ...} +
-- becomes
--    At_least_one_Simple_string_New_line_pair: 
--   SIMPLE_STRING_New_line_pair
--   Optional_Simple_string_New_line_pairs ;

-- Optional use of tokens like
--   [ nameless ]
-- are rewritten to rules of the form
--   Optional_Nameless

-- We are not following the Geyacc convensions of all rules are lowercase
-- because we wish to follow the original EBNF BON grammar as precisely as
-- possible.  BON is a large language and getting a perfectly working parser
-- is hard enough at times.

-- @todo kiniry - Sep 3, 2001 - Class_name_list likely has to be extended
-- for referral to clusters (e.g. "(Cluster_name)") as a shortcut for
-- referring to all classes of the cluster.  @see MONITORING_SYSTEM event
-- charts for an example.

-- A.3 BON SPECIFICATION 

-- @type BON_SPECIFICATION
Bon_specification : At_least_one_Specification_element 
                    { create $$.make_from_elements ($1); bon_specification := $$; io.put_string("BON SPEC CREATED!") } ;

-- @type SPECIFICATION_ELEMENTS
At_least_one_Specification_element : Specification_element Optional_Specification_elements
												 { create $$.make_optional_rest ($1, $2) } ;

-- @type like At_least_one_Specification_element
Optional_Specification_elements : -- Empty
										  | Optional_Specification_elements Specification_element 
											 { create $$.make_optional_first ($1, $2) } ;

-- @type SPECIFICATION_ELEMENT
Specification_element : Comment { $$ := $1 }
							 | Informal_chart
								{ $$ := $1 }
							 | Class_dictionary_rule
								{ $$ := $1 }
							 | Static_diagram_rule
								{ $$ := $1 }
							 | Dynamic_diagram_rule
								{ $$ := $1 }
							 | Notational_tuning ;

-- A.4 INFORMAL CHARTS 

-- @type INFORMAL_CHART
Informal_chart : System_chart_rule
					  { $$ := $1 }
					| Cluster_chart_rule
					  { $$ := $1 }
					| Class_chart_rule
					  { $$ := $1 }
					| Event_chart_rule
					  { $$ := $1 }
					| Scenario_chart_rule
					  { $$ := $1 }
					| Creation_chart_rule
					  { $$ := $1 } ;

-- @type CLASS_DICTIONARY
Class_dictionary_rule : DICTIONARY_TOKEN System_name 
								At_least_one_Dictionary_entry
								END_TOKEN 
								{ create $$.make ($2, $3) } ;

-- @type DICTIONARY_ENTRIES
At_least_one_Dictionary_entry : Dictionary_entry Optional_Dictionary_entries 
										  { create $$.make_optional_rest ($1, $2) } ;

-- @type like At_least_one_Dictionary_entry
Optional_Dictionary_entries : -- Empty
									 | Optional_Dictionary_entries Dictionary_entry 
										{ create $$.make_optional_first ($1, $2) } ;

-- @type DICTIONARY_ENTRY
Dictionary_entry : CLASS_TOKEN Class_name 
						 CLUSTER_TOKEN Cluster_name 
						 DESCRIPTION_TOKEN Manifest_textblock 
						 { -- add_class_name ($2) 
							-- add_cluster_name ($4)
							create $$.make ($2, $4, $6) } ;

-- @type SYSTEM_CHART
System_chart_rule : SYSTEM_CHART_TOKEN System_name 
						  Optional_Indexing_Index_list
						  Optional_Explanation_Manifest_string
						  Optional_Part_Manifest_string
						  Optional_Cluster_entries_rule
						  END_TOKEN
						  { create $$.make ($2, $3, $4, $5, $6) } ;

-- @type like Index_list
Optional_Indexing_Index_list : -- Empty
									  | Indexing_Index_list
										 { $$ := $1 } ;

-- @type like Index_list
Indexing_Index_list : INDEXING_TOKEN Index_list 
							 { $$ := $2 } ;

-- @type like Manifest_string
Optional_Explanation_Manifest_string : -- Empty
												 | EXPLANATION_TOKEN Manifest_string 
													{ $$ := $2 } ;

-- @type like Manifest_string
Optional_Part_Manifest_string : -- Empty
										| PART_TOKEN Manifest_string
										  { $$ := $2 } ;

-- @type like Cluster_entries
Optional_Cluster_entries_rule : -- Empty
										| Cluster_entries
										  { $$ := $1 } ;

-- @type CLUSTER_ENTRIES
Cluster_entries : At_least_one_Cluster_entry
						{ $$ := $1 } ;

-- @type like Cluster_entries
At_least_one_Cluster_entry : Cluster_entry Optional_Cluster_entries 
									  { create $$.make_optional_rest ($1, $2) } ;

-- @type like Cluster_entries
Optional_Cluster_entries : -- Empty
								 | Optional_Cluster_entries Cluster_entry 
									{ create $$.make_optional_first ($1, $2) } ;

-- @type CLUSTER_ENTRY
Cluster_entry : CLUSTER_TOKEN Cluster_name 
					 DESCRIPTION_TOKEN Manifest_textblock 
					 { -- add_cluster_name ($2) 
						create $$.make ($2, $4) } ;

-- @type STRING
System_name : All_caps_identifier
				  { $$ := $1
					 -- add_system_name($$)
				  } 
				| Identifier 
				  { $$ := $1
					 -- add_system_name($$)
				  } ;

-- @type like At_least_one_Index_clause
Index_list : At_least_one_Index_clause
				 { $$ := $1 } ;

-- @type like Index_list
At_least_one_Index_clause : Index_clause Optional_Index_clauses 
									 { create $$.make_optional_rest ($1, $2) };

-- @type like Index_list
Optional_Index_clauses : -- Empty
							  | Optional_Index_clauses ';' Index_clause 
								 { create $$.make_optional_first ($1, $3) };

-- @type INDEX_CLAUSE
Index_clause : Identifier ':' Index_term_list 
					{ -- Index_clause
					  create $$.make_pair ($1, $3) };

-- @type STRING_LIST
Index_term_list : At_least_one_Index_string
						{ $$ := $1 } ;

-- @type like Index_term_list
At_least_one_Index_string : Index_string Optional_Index_strings { create $$.make_optional_rest ($1, $2) };
						
-- @type like Index_term_list
Optional_Index_strings : -- Empty
							  | Optional_Index_strings ',' Index_string 
                              { create $$.make_optional_first ($1, $3); };

-- @type STRING
Index_string : Manifest_string
					{ $$ := $1 } ;

-- @type CLUSTER_CHART
Cluster_chart_rule : CLUSTER_CHART_TOKEN Cluster_name 
							Optional_Indexing_Index_list
							Optional_Explanation_Manifest_string
							Optional_Part_Manifest_string
							Optional_Class_entries_rule
							Optional_Cluster_entries_rule
							END_TOKEN 
							{ create $$.make ($2, $3, $4, $5, $6, $7); cluster_charts.extend ($$) } ;

-- @type like Class_entries
Optional_Class_entries_rule : -- Empty
									 | Class_entries
										{ $$ := $1 } ;

-- @type CLASS_ENTRIES
Class_entries : At_least_one_Class_entry
					 { $$ := $1 } ;

-- @type like Class_entries
At_least_one_Class_entry : Class_entry Optional_Class_entries 
									{ create $$.make_optional_rest ($1, $2) };

-- @type like Class_entries
Optional_Class_entries : -- Empty
							  | Optional_Class_entries Class_entry 
								 { create $$.make_optional_first ($1, $2) };

-- @type CLASS_ENTRY
Class_entry : CLASS_TOKEN Class_name
				  DESCRIPTION_TOKEN Manifest_textblock 
				  { -- add_class_name ($2)
					 create $$.make ($2, $4) } ;

-- @type STRING
Cluster_name : CLUSTER_NAME_TOKEN 
					{ $$ := last_identifier
					  -- add_cluster_name($$)
					} 
				 | All_caps_identifier 
					{ $$ := $1
					  -- add_cluster_name($$)
					} 
				 | Identifier
					{ $$ := $1
					  -- add_cluster_name($$)
					} ;

-- @type CLASS_CHART
Class_chart_rule : CLASS_CHART_TOKEN Class_name 
						 Optional_Indexing_Index_list
						 Optional_Explanation_Manifest_string
						 Optional_Part_Manifest_string
						 Optional_Inherit_Class_name_list
						 Optional_Query_list
						 Optional_Command_list
						 Optional_Constraint_list
						 END_TOKEN 
						 { create $$.make ($2, $3, $4, $5, $6, $7, $8, $9); class_charts.extend ($$) } ;

-- @type like Class_name_list
Optional_Inherit_Class_name_list : -- Empty
											| INHERIT_TOKEN Class_name_list 
											  { $$ := $2 } ;

-- @type like Query_list
Optional_Query_list : -- Empty
						  | QUERY_TOKEN Query_list
							 { $$ := $2 } ;

-- @type like Command_list
Optional_Command_list : -- Empty
							 | COMMAND_TOKEN Command_list
								{ $$ := $2 } ;

-- @type like Constraint_list
Optional_Constraint_list : -- Empty
								 | CONSTRAINT_TOKEN Constraint_list
									{ $$ := $2 } ;

-- @type QUERY_LIST
Query_list : At_least_one_Query
				 { create $$.make_from_string_list ($1) } ;

-- @type like Query_list
At_least_one_Query : Query Optional_Queries 
					{ create $$.make_optional_rest ($1, $2) } ;

-- @type like Query_list
Optional_Queries : -- Empty
                | Optional_Queries ',' Query
                { create $$.make_optional_first($1, $3) } ;

-- @type STRING
Query : Manifest_string { $$ := $1 } ;

-- @type COMMAND_LIST
Command_list : At_least_one_Command
					{ create $$.make_from_string_list ($1) } ;

-- @type like Command_list
At_least_one_Command : Command Optional_Commands
                       { create $$.make_optional_rest ($1, $2) } ;

-- @type like Command_list
Optional_Commands: -- Empty
                | Optional_Commands ',' Command
                { create $$.make_optional_first ($1, $3) } ;     

-- @type STRING
Command : Manifest_string { $$ := $1 } ;

-- @type CONSTRAINT_LIST
Constraint_list : At_least_one_Constraint
						{ create $$.make_from_string_list ($1) } ;

-- @type like Constraint_list
At_least_one_Constraint : Constraint Optional_Constraints
                          { create $$.make_optional_rest ($1, $2) } ;

-- @type like Constraint_list
Optional_Constraints : -- Empty
                     | Optional_Constraints ',' Constraint
                     { create $$.make_optional_first ($1, $3) } ;

-- @type STRING
Constraint : Manifest_string { $$ := $1 } ;

-- @type STRING_LIST
At_least_one_Manifest_string : Manifest_string Optional_Manifest_strings 
										 { create $$.make_optional_rest ($1, $2) } ;

-- @type like At_least_one_Manifest_string
Optional_Manifest_strings : -- Empty
								  | Optional_Manifest_strings ',' Manifest_string 
									 { create $$.make_optional_first ($1, $3) } ;

-- @type CLASS_NAME_LIST
Class_name_list : At_least_one_Class_name
						{ $$ := $1 } ;

-- @type like Class_name_list
At_least_one_Class_name : Class_name Optional_Class_names 
								  { create $$.make_optional_rest ($1, $2) } ;

-- @type like Class_name_list
Optional_Class_names : -- Empty
							| Optional_Class_names ',' Class_name 
							  { create $$.make_optional_first ($1, $3) } ;

-- @type STRING
Class_name : CLASS_NAME_TOKEN 
				 { $$ := last_identifier
					-- add_class_name($$)
				 } 
			  | All_caps_identifier 
				 { $$ := $1
					-- add_class_name($$)
				 } 
			  | Identifier
				 { $$ := $1
					-- add_class_name($$)
				 } ;

-- @type EVENT_CHART
Event_chart_rule : EVENT_CHART_TOKEN System_name 
						 Optional_Incoming_or_Outgoing_clause
						 Optional_Indexing_Index_list
						 Optional_Explanation_Manifest_string
						 Optional_Part_Manifest_string
						 Optional_Event_entries_clause
						 END_TOKEN
						 { create $$.make ($2, $3, $4, $5, $6, $7) } ;

-- @type STRING
Optional_Incoming_or_Outgoing_clause : -- Empty
												 | INCOMING_TOKEN
													{ $$ := "INCOMING" }
												 | OUTGOING_TOKEN
													{ $$ := "OUTGOING" } ;

-- @type like Event_entries
Optional_Event_entries_clause : -- Empty
										| Event_entries
										  { $$ := $1 } ;

-- @type EVENT_ENTRIES
Event_entries : At_least_one_Event_entry
					 { $$ := $1 } ;

-- @type like Event_entries
At_least_one_Event_entry : Event_entry Optional_Event_entries 
									{ create $$.make_optional_rest ($1, $2) } ;

-- @type like Event_entries
Optional_Event_entries : -- Empty
							  | Optional_Event_entries Event_entry 
								 { create $$.make_optional_first ($1, $2) };

-- @type EVENT_ENTRY
Event_entry : EVENT_TOKEN Manifest_string INVOLVES_TOKEN Class_name_list
				  { create $$.make ($2, $4) };

-- @type SCENARIO_CHART
Scenario_chart_rule : SCENARIO_CHART_TOKEN System_name 
							 Optional_Indexing_Index_list
							 Optional_Explanation_Manifest_string
							 Optional_Part_Manifest_string
							 Optional_Scenario_entries_clause
							 END_TOKEN 
							 { create $$.make ($2, $3, $4, $5, $6) } ;

-- @type like Scenario_entries
Optional_Scenario_entries_clause : -- Empty
											| Scenario_entries
											  { $$ := $1 } ;

-- @type SCENARIO_ENTRIES
Scenario_entries : At_least_one_Scenario_entry
						 { $$ := $1 } ;

-- @type like Scenario_entries
At_least_one_Scenario_entry : Scenario_entry Optional_Scenario_entries 
										{ create $$.make_optional_rest ($1, $2) } ;

-- @type like Scenario_entries
Optional_Scenario_entries : -- Empty
								  | Optional_Scenario_entries Scenario_entry 
									 { create $$.make_optional_first ($1, $2) };

-- @type SCENARIO_ENTRY
Scenario_entry : SCENARIO_TOKEN Manifest_string 
					  DESCRIPTION_TOKEN Manifest_textblock 
					  { create $$.make ($2, $4) } ;

-- @type CREATION_CHART
Creation_chart_rule : CREATION_CHART_TOKEN System_name 
							 Optional_Indexing_Index_list
							 Optional_Explanation_Manifest_string
							 Optional_Part_Manifest_string
							 Optional_Creation_entries_clause
							 END_TOKEN 
							 { create $$.make ($2, $3, $4, $5, $6) } ;

-- @type CREATION_ENTRIES
Optional_Creation_entries_clause : -- Empty
											| Optional_Creation_entries_clause Creation_entry 
											  { create $$.make_optional_first ($1, $2) };

-- @type CREATION_ENTRY
Creation_entry : CREATOR_TOKEN Class_name CREATES_TOKEN Class_name_list 
					  { create $$.make ($2, $4) } ;

-- A.5 STATIC DIAGRAMS

-- @type STATIC_DIAGRAM
Static_diagram_rule : STATIC_DIAGRAM_TOKEN 
							 Optional_Extended_id 
							 Optional_Comment
							 COMPONENT_TOKEN 
							 Static_block 
							 END_TOKEN 
							 { io.put_string ("STATIC DIAGRAM!"); create $$.make_static_diagram ($2, $3, $5) } ;

-- @type like Extended_id
Optional_Extended_id : -- Empty
							| Extended_id
							  { $$ := $1 } ;

-- @type STRING
Extended_id : All_caps_identifier
				  { $$ := $1 }
				| Identifier
				  { $$ := $1 }
				| INTEGER_TOKEN
				  { $$ := $1.out } ;

-- @type like Comment
Optional_Comment : -- Empty
					  | Comment
						 { $$ := $1 } ;

-- The following rules will exhibit a shift/reduce conflict.

-- @type COMMENT
Comment : At_least_one_Line_comment
			 { create $$.make_list ($1) } ;

-- @type like Comment
At_least_one_Line_comment : Line_comment Optional_Line_comments 
									 { create $$.make_from_string ($1)
										$$.append_string ($2) } ;

-- @type like Comment
Optional_Line_comments : -- Empty
							  | Optional_Line_comments Line_comment 
                              { create $$.make_from_string ($2);
									$$.prepend_string ($1) } ;

-- @type STRING
Line_comment : DOUBLE_DASH_TOKEN SIMPLE_STRING_TOKEN
                { $$ := last_string_constant } ;

-- Dan's streamlined version.

-- Optional_Comment : -- Empty
--  | DOUBLE_DASH_TOKEN SIMPLE_STRING_TOKEN ;

-- Comment : DOUBLE_DASH_TOKEN SIMPLE_STRING_TOKEN Optional_Comment ;

-- @type like Zero_or_more_Static_components
Static_block : Zero_or_more_Static_components
					{ $$ := $1 } ;

-- @type STATIC_COMPONENTS
Zero_or_more_Static_components : -- Empty
										 | Zero_or_more_Static_components Static_component 
											{ create $$.make_optional_first ($1, $2) } ;

-- @type STATIC_COMPONENT
Static_component : Cluster_rule
						 { $$ := $1 }
					  | Class_rule
						 { $$ := $1 }
					  | Static_relation
						 { $$ := $1 }
					  | Unspecified_Static_component
						 { $$ := $1 } ;

Unspecified_Static_component : ELLIPSES_TOKEN
										 { create $$.make_unspecified } ;

-- @type CLUSTER_SPECIFICATION
Cluster_rule : CLUSTER_TOKEN Cluster_name 
					Optional_Reused 
					Optional_Comment
					Optional_Cluster_components 
					{ create $$.make ($2, $3, $4, $5)
					  -- add_cluster_name ($2)
					} ;

-- @type BOOLEAN
Optional_Reused : -- Empty
						{ $$ := False }
					 | REUSED_TOKEN 
						{ $$ := True } ;

-- @type like Cluster_components
Optional_Cluster_components : -- Empty
									 | Cluster_components
										{ $$ := $1 } ;

-- @type like Static_block
Cluster_components : COMPONENT_TOKEN Static_block END_TOKEN
							{ $$ := $2 } ;

-- @type CLASS_SPECIFICATION
Class_rule : Optional_Root_or_Deferred_or_Effective
				 CLASS_TOKEN Class_name 
				 Optional_Formal_generics_clause
				 Optional_Reused 
				 Optional_Persistent 
				 Optional_Interfaced 
				 Optional_Comment
				 Optional_Class_interface 
				 { create $$.make ($1, $3, $4, $5, $6, $7, $8, $9)
					-- add_class_name ($3)
				 } ;

-- @type STRING
Optional_Root_or_Deferred_or_Effective : -- Empty
													| ROOT_TOKEN
													  { $$ := "ROOT" }
													| DEFERRED_TOKEN
													  { $$ := "DEFERRED" }
													| EFFECTIVE_TOKEN
													  { $$ := "EFFECTIVE" } ;

-- @type BOOLEAN
Optional_Persistent : -- Empty
							 { $$ := False }
						  | PERSISTENT_TOKEN
							 { $$ := True } ;

-- @type BOOLEAN
Optional_Interfaced : -- Empty
							 { $$ := False }
						  | INTERFACED_TOKEN
							 { $$ := True } ;

-- @type like Class_interface
Optional_Class_interface : -- Empty
								 | Class_interface
								 { $$ := $1 } ;

-- @type STATIC_RELATION
Static_relation : Inheritance_relation
						{ $$ := $1 }
					 | Client_relation
						{ $$ := $1 } ;

-- @type INHERITANCE_RELATION
Inheritance_relation : Child INHERIT_TOKEN 
							  Optional_Multiplicity_clause
							  Parent 
							  Optional_Semantic_label
							  { create $$.make ($1, $3, $4, $5) } ;
 
-- @type like Multiplicity
Optional_Multiplicity_clause : -- Empty
                                { $$ := 0 }
							 | '{' Multiplicity '}'
								{ $$ := $2 } ;

-- @type like Semantic_label
Optional_Semantic_label : -- Empty
								| Semantic_label
								{ $$ := $1 } ;

-- @type CLIENT_RELATION
Client_relation : Client CLIENT_TOKEN
						Optional_Client_entities
						Optional_Type_mark 
						Supplier 
						Optional_Semantic_label
						{ create $$.make ($1, $3, $4, $5, $6) } ;
  
-- @type like Type_mark
Optional_Type_mark : -- Empty
						 | Type_mark
							{ $$ := $1 } ;

-- @type like Client_entities
Optional_Client_entities : -- Empty
								 | Client_entities
									{ $$ := $1 } ;

-- @type CLIENT_ENTITIES
Client_entities : '{' Client_entity_expression '}'
						{ $$ := $2 } ;
  
-- @type CLIENT_ENTITIES
Client_entity_expression : Client_entity_list
									{ $$ := $1 }
								 | Multiplicity
									{ create $$.make_undefined ($1) } ;

-- @type CLIENT_ENTITIES
Client_entity_list : At_least_one_Client_entity
							{ $$ := $1 } ;
  
-- @type like Client_entity_list
At_least_one_Client_entity : Client_entity Remaining_Client_entities
									  { create $$.make_optional_rest ($1, $2) } ;

-- @type like Client_entity_list
Remaining_Client_entities : -- Empty
								  | Remaining_Client_entities ',' Client_entity
									 { create $$.make_optional_first ($1, $3) } ;

-- @type CLIENT_ENTITY
Client_entity : Feature_name
					 { create $$.make_feature ($1) }
				  | Supplier_indirection
					 { create $$.make_supplier ($1) }
				  | Parent_indirection
					 { create $$.make_parent ($1) } ;

-- @type SUPPLIER_INDIRECTION
Supplier_indirection : Optional_Indirection_feature_part Generic_indirection
							  { create $$.make ($1, $2) } ;

--@type like Indirection_feature_part
Optional_Indirection_feature_part : -- Empty
											 | Indirection_feature_part ':'
												{ $$ := $1 } ;

-- @type FEATURE_NAME_LIST
Indirection_feature_part : Feature_name
									{ create $$.make_list ($1) }
								 | Indirection_feature_list
									{ $$ := $1 } ;

-- @type like Feature_name_list
Indirection_feature_list : '(' Feature_name_list ')'
									{ $$ := $2 } ;

-- @type PARENT_INDIRECTION
Parent_indirection : IMPLIES_TOKEN Generic_indirection
							{ create $$.make ($2) } ;

-- @type GENERIC_INDIRECTION
Generic_indirection : Formal_generic_name
							 { create $$.make_direct ($1) }
						  | Named_indirection
							 { create $$.make_indirect ($1) } ;

-- Differs from BON grammar in text.  We have made the parameterization
-- of the Named_indirection optional and, given the example in Figure B.9, 
-- the Class_name is optional as well.
--      @change Didriksen - Making both parameterization and class name optional for named indirections
--                          leaves ambiguity between a formal generic name and a named indirection without
--                          parameterization (i.e. with only a class name). Thus, parameterization has been made mandatory.
-- @type NAMED_INDIRECTION
Named_indirection : Optional_Class_name Optional_Indirection_list_clause
						  { create $$.make ($1, $2) } ;

-- @type like Class_name
Optional_Class_name : -- Empty
						  | Class_name
						  { $$ := $1 } ;

-- @type like Indirection_list
--Optional_Indirection_list_clause : -- Empty
--											| '[' Indirection_list ']'
--											{ $$ := $2 } ;
Optional_Indirection_list_clause : '[' Indirection_list ']'
											{ $$ := $2 } ;

-- @type INDIRECTION_LIST == MOG_LIST[like Indirection_element]
Indirection_list : At_least_one_Indirection_element
						 { $$ := $1 } ;

-- @type like Indirection_list
At_least_one_Indirection_element : Indirection_element Optional_Indirection_elements
											  { create $$.make_optional_rest ($1, $2) } ;

-- @type like Indirection_list
Optional_Indirection_elements : -- Empty
										| Optional_Indirection_elements ',' Indirection_element
										  { create $$.make_optional_first ($1, $3) } ;

-- @type INDIRECTION_ELEMENT
Indirection_element : ELLIPSES_TOKEN
							 { create $$.make_ellipses }
						  | Named_indirection
							 { create $$.make ($1) }
						  | Class_name
						     { create $$.make_with_class_name ($1) }
						  | Formal_generic_name
						     { create $$.make_with_formal_generic_name ($1) }; 
							 

-- @type TYPE_MARK
Type_mark : ':'
				{ create $$.make }
			 | AGGREGATE_MARK_TOKEN
				{ create $$.make_aggregate }
			 | Shared_mark
				{ create $$.make_shared ($1) }
			 ;

-- @type like Multiplicity
Shared_mark : ':' '(' Multiplicity ')'
				  { $$ := $3 } ;

-- @type like Static_ref
Child : Static_ref
		  { $$ := $1 } ;

-- @type like Static_ref
Parent : Static_ref
			{ $$ := $1 } ;

-- @type like Static_ref
Client : Static_ref
			{ $$ := $1 } ;

-- @type like Static_ref
Supplier : Static_ref
			  { $$ := $1 } ;

-- @type Zero_or_more_Cluster_prefixes :STRING /\ Static_component_name :STRING ==>
--       Static_ref :STRING
Static_ref : Zero_or_more_Cluster_prefixes Static_component_name
				 { create $$.make_from_components ($2, $1) } ;

 -- @type like Cluster_prefix
 Zero_or_more_Cluster_prefixes : -- Empty
 										| Zero_or_more_Cluster_prefixes Cluster_prefix
 										{ create $$.make_from_string ($2)
 										  $$.prepend_string ($1) } ;

 -- @type Cluster_name :STRING /\ '.':CHARACTER ==> Cluster_prefix :STRING
 Cluster_prefix : Cluster_name '.'
 					  { create $$.make_from_string ($1)
 						 $$.append_character ('.') } ;

-- @type Class_name :STRING /\ Cluster_name :STRING ==> Static_component_name :STRING
Static_component_name : Class_name
								{ $$ := $1 }
							 | Cluster_name
								{ $$ := $1 } ;

-- @type INTEGER
Multiplicity : Integer_constant
					{ $$ := $1.value } ;

-- @type like Manifest_string
Semantic_label : Manifest_string
					  { $$ := $1 } ;

-- A.6 CLASS INTERFACE DESCRIPTION 

-- @type CLASS_INTERFACE
Class_interface : Optional_Indexing_Index_list
						Optional_Inherit_Parent_class_list
						Features
						Optional_Invariant_Class_invariant
						END_TOKEN
						{ create $$.make ($1, $2, $3, $4) } ;

-- @type like Parent_class_list
Optional_Inherit_Parent_class_list : -- Empty
											  | INHERIT_TOKEN Parent_class_list
												 { $$ := $2 }
											  ;

-- @type like Class_invariant
Optional_Invariant_Class_invariant : -- Empty
											  | INVARIANT_TOKEN Class_invariant
												 { $$ := $2 }
											  ;

-- @type CLASS_INVARIANT
Class_invariant : Assertion
						{ $$ := $1 } ;

-- @type like At_least_one_Class_type
Parent_class_list :  At_least_one_Class_type
							{ $$ := $1 } ;

-- @type like Optional_Class_types
At_least_one_Class_type : Class_type Optional_Class_types
								  { create $$.make_optional_rest ($1, $2) } ;

-- @type CLASS_TYPE_LIST
Optional_Class_types : -- Empty
							| Optional_Class_types ';' Class_type
							  { create $$.make_optional_first ($1, $3) }
							;

-- @type like At_least_one_Feature_clause
Features : At_least_one_Feature_clause { $$ := $1 } ;

-- @type like Optional_Feature_clause
At_least_one_Feature_clause : Feature_clause Optional_Feature_clauses 
                                { create $$.make_optional_rest ($1, $2) } ;

-- @type FEATURE_CLAUSE_LIST
Optional_Feature_clauses : -- Empty
								 | Optional_Feature_clauses Feature_clause 
								  { create $$.make_optional_first ($1, $2) } ;

-- @type FEATURE_CLAUSE
Feature_clause : FEATURE_TOKEN Optional_Selective_export
					  Optional_Comment
					  Feature_specifications 
					  { create $$.make ($2, $3, $4) } ;

-- @type like Selective_export
Optional_Selective_export : -- Empty
								  | Selective_export
									 { $$ := $1 }
								  ;
								  
-- @type FEATURE_SPECIFICATION_LIST
Feature_specifications :  At_least_one_Feature_specification { $$ := $1 } ;

-- @type like Feature_specifications
At_least_one_Feature_specification : Feature_specification Optional_Feature_specifications 
                                      { create $$.make_optional_rest ($1, $2) } ;

-- @type like Feature_specifications
Optional_Feature_specifications : -- Empty
										  | Optional_Feature_specifications Feature_specification
											 { create $$.make_optional_first ($1, $2) } ;

-- @type FEATURE_SPECIFICATION
Feature_specification : Optional_Deferred_or_Effective_or_Redefined
								Feature_name_list 
								Optional_Type_mark_Type
								Optional_Rename_clause
								Optional_Comment
								Optional_Feature_arguments_clause
								Optional_Contract_clause
								{ create $$.make ($1, $2, last_type_mark, $3, $4, $5, $6, $7) } ;

-- @type STRING
Optional_Deferred_or_Effective_or_Redefined : -- Empty
														  | DEFERRED_TOKEN
														    { $$ := "DEFERRED" }
														  | EFFECTIVE_TOKEN
														    { $$ := "EFFECTIVE" }
														  | REDEFINED_TOKEN
														    { $$ := "REDEFINED" }
														  ;

-- @type like Type
Optional_Type_mark_Type : -- Empty
                                 { last_type_mark := Void }
								| Type_mark Type { last_type_mark := $1; $$ := $2 } ;

-- @type like Renaming
Optional_Rename_clause : -- Empty
							  | Rename_clause { $$ := $1 } ;

-- @type like Feature_arguments
Optional_Feature_arguments_clause : -- Empty
											 | Feature_arguments { $$ := $1 } ;

-- @type like Contract_clause
Optional_Contract_clause : -- Empty
								 | Contract_clause { $$ := $1 } ;

-- @type CONTRACT_CLAUSE
Contract_clause : Contracting_conditions END_TOKEN { $$ := $1 } ;

-- @type like Contract_clause
Contracting_conditions : Precondition { create $$.make ($1, Void) }
							  | Postcondition { create $$.make (Void, $1) }
							  | Pre_and_post { $$ := $1 } ;

-- @type like Assertion
Precondition : REQUIRE_TOKEN Assertion { $$ := $2 } ;

-- @type like Assertion
Postcondition : ENSURE_TOKEN Assertion { $$ := $2 } ;

-- @type like Contract_clause
Pre_and_post : Precondition Postcondition { create $$.make ($1, $2) } ;

-- @type like Class_name_list
Selective_export : '{' Class_name_list '}'
						 { $$ := $2 } ;

-- @type like At_least_one_Feature_name
Feature_name_list : At_least_one_Feature_name
						  { $$ := $1 } ;

-- @type like Optional_Feature_names
At_least_one_Feature_name : Feature_name Optional_Feature_names
									 { create $$.make_optional_rest ($1, $2) } ;

-- @type FEATURE_NAME_LIST == STRING_LIST
Optional_Feature_names : -- Empty
							  | Optional_Feature_names ',' Feature_name
								 { create $$.make_optional_first ($1, $3) }
							  ;

-- @type FEATURE_NAME
Feature_name : FEATURE_NAME_TOKEN
					{ create $$.make_feature_name (last_identifier)
					  -- add_feature_name($$)
					}
				 | ALL_CAPS_IDENTIFIER_TOKEN
					{ create $$.make_feature_name (last_identifier)
					  -- add_feature_name($$)
					}
				 | IDENTIFIER_TOKEN
					{ create $$.make_feature_name (last_identifier)
					  -- add_feature_name($$)
					}
				 | Prefix_rule { $$ := $1 }
				 | Infix_rule { $$ := $1 }
				 ;

-- @type like Renaming
Rename_clause : '{' Renaming '}' { $$ := $2 } ;

-- @type RENAMING
Renaming : '^' Class_name '.' Feature_name { create $$.make ($2, $4) } ;

-- @type FEATURE_ARGUMENT_LIST
Feature_arguments : At_least_one_Feature_argument { $$ := $1 } ;

-- @type like Feature_arguments
At_least_one_Feature_argument : Feature_argument Optional_Feature_arguments
                                { create $$.make_optional_rest ($1, $2) } ;

-- @type like Feature_arguments
Optional_Feature_arguments : -- Empty
									| Optional_Feature_arguments Feature_argument 
									  { create $$.make_optional_first ($1, $2) } ;

-- @type FEATURE_ARGUMENT
Feature_argument : IMPLIES_TOKEN Optional_Identifier_list Type 
                    { create $$.make ($2, $3) } ;

-- @type like Identifier_list
Optional_Identifier_list : -- Empty
								 | Identifier_list ':' 
								    { $$ := $1 } ;

-- @type STRING_LIST
Identifier_list : At_least_one_Identifier { $$ := $1 } ;

-- @type like Identifier_list
At_least_one_Identifier : Identifier Optional_Identifiers 
                            { create $$.make_optional_rest ($1, $2) } ;

-- @type like Identifier_list
Optional_Identifiers : -- Empty
							| Optional_Identifiers ',' Identifier 
							    { create $$.make_optional_first ($1, $3) } ;

-- @type FEATURE_NAME
Prefix_rule : PREFIX_TOKEN '"' Prefix_operator '"'  { create $$.make_prefix ($3) } ;

-- @type FEATURE_NAME
Infix_rule : INFIX_TOKEN '"' Infix_operator '"'  { create $$.make_infix ($3) } ;

-- @type OPERATOR
Prefix_operator : Unary { $$ := $1 }
					 | FREE_OPERATOR_TOKEN { create $$.make_free_operator (last_free_operator) } ;

-- @type OPERATOR
Infix_operator : Binary { $$ := $1 }
					| FREE_OPERATOR_TOKEN { create $$.make_free_operator (last_free_operator) } ;

-- @type like Formal_generics
Optional_Formal_generics_clause : -- Empty
										  | Formal_generics
											 { $$ := $1 } ;

-- @type like Formal_generic_list
Formal_generics : '[' Formal_generic_list ']'
						{ $$ := $2 } ;

-- @type like At_least_one_Formal_generic
Formal_generic_list : At_least_one_Formal_generic
							 { $$ := $1 } ;

-- @type like Optional_Formal_generics 
At_least_one_Formal_generic : Formal_generic 
										Optional_Formal_generics 
										{ create $$.make_optional_rest ($1, $2) } ;

-- @type FORMAL_GENERIC_LIST == MOG_LIST [FORMAL_GENERIC]
Optional_Formal_generics : -- Empty
								 | Optional_Formal_generics ',' Formal_generic 
									{ create $$.make_optional_first ($1, $3) } ;

-- @type FORMAL_GENERIC
Formal_generic : Formal_generic_name Optional_Implies_Class_type 
					  { create $$.make ($1, $2) } ;

-- @type CLASS_TYPE
Optional_Implies_Class_type : -- Empty
									 | IMPLIES_TOKEN Class_type
										{ $$ := $2 }
									 ;

-- @type STRING
Formal_generic_name : All_caps_identifier 
							 { $$ := $1
								-- add_formal_generic_name($$)
							 } 
						  | Identifier
							 { $$ := $1
								-- add_formal_generic_name($$)
							 } ;

-- @type CLASS_TYPE
Class_type : Class_name Optional_Actual_generics
				 { create $$.make ($1, $2) } ;

-- @type like Actual_generics
Optional_Actual_generics : -- Empty
								 | Actual_generics
									{ $$ := $1 }
								 ;

-- @type ACTUAL_GENERICS
Actual_generics : '[' Type_list ']'
						{ create $$.make_from_list ($2) } ;


-- @type like At_least_one_Type
Type_list : At_least_one_Type
				{ $$ := $1 } ;

-- @type like Optional_Types
At_least_one_Type : Type Optional_Types
						  { create $$.make_optional_rest ($1, $2) } ;


-- @type TYPE_LIST == MOG_LIST [BON_TYPE]
Optional_Types : -- Empty
					| Optional_Types ',' Type
					  { create $$.make_optional_first ($1, $3) }
					;

-- @type BON_TYPE
Type : Class_type
		 { create $$.make_class_type ($1) }
	| Formal_generic_name
		 { create $$.make_formal_generic_name ($1) }
	;

-- Both of these rules are slightly revised from the original grammar to
-- collapse explicit listing of '+' and '-' tokens via the Sign rule.

Unary : DELTA_TOKEN                         { create $$.make_delta }
		| OLD_TOKEN                         { create $$.make_old }
		| NOT_TOKEN                         { create $$.make_not }
		| Sign                              { $$ := $1; $$.set_unary } 
; 

Binary : Sign                               { $$ := $1; $$.set_binary }
		 | '*'                              { create $$.make_times }
		 | '/'                              { create $$.make_division }
		 | '<'                              { create $$.make_less_than }
		 | '>'                              { create $$.make_greater_than }
		 | LESS_THAN_OR_EQUAL_TOKEN         { create $$.make_less_than_equals }
		 | GREATER_THAN_OR_EQUAL_TOKEN      { create $$.make_greater_than_equals }
		 | '='                              { create $$.make_equals }
		 | NOT_EQUAL_TOKEN                  { create $$.make_not_equals }
		 | DOUBLE_SLASH_TOKEN               { create $$.make_integer_division }
		 | DOUBLE_BACKSLASH_TOKEN           { create $$.make_modulo }
		 | '^'                              { create $$.make_power }
		 | OR_TOKEN                         { create $$.make_or }
		 | XOR_TOKEN                        { create $$.make_xor }
		 | AND_TOKEN                        { create $$.make_and }
		 | IMPLIES_TOKEN                    { create $$.make_implies }
		 | EQUIVALENT_TO_TOKEN              { create $$.make_logical_equivalence }
		 | MEMBER_OF_TOKEN                  { create $$.make_member_of }
		 | ':'                              { create $$.make_colon }
;

-- A.7 FORMAL ASSERTIONS 

-- @type like At_least_one_Assertion_clause
Assertion : At_least_one_Assertion_clause { $$ := $1 } ;

-- @type like Optional_Assertion_clauses
At_least_one_Assertion_clause : Assertion_clause Optional_Assertion_clauses 
                                { create $$.make_optional_rest ($1, $2) } ;

-- @type ASSERTION_CLAUSE_LIST == MOG_LIST[ASSERTION_CLAUSE]
Optional_Assertion_clauses : -- Empty
									| Optional_Assertion_clauses ';' Assertion_clause 
									  { create $$.make_optional_first ($1, $3) } ;

-- @type ASSERTION_CLAUSE
Assertion_clause : Boolean_expression { $$ := $1 }
				 | Assertion_comment { $$ := $1 } ;

Assertion_comment : At_least_one_Line_comment { create $$.make_list ($1) } ;

-- @type BOOLEAN_EXPRESSION
Boolean_expression : Expression { $$ := $1 } ;

-- @type like Boolean_expression
-- @design didriksen - Parenthesized moved to Expression. See note for Operator_expression for details.
Expression : Quantification { $$ := $1 }
			  | Call { $$ := $1 }
			  | Operator_expression { $$ := $1 }
			  | Parenthesized { $$ := $1 }
			  | Constant { $$ := $1 } ;

-- @type QUANTIFICATION
Quantification : Quantifier Range_expression Optional_Restriction Proposition 
                 { create $$.make ($1, $2, $3, $4) } ;

-- @type QUANTIFIER
Quantifier : FOR_ALL_TOKEN { create $$.make_for_all }
			  | EXISTS_TOKEN { create $$.make_exists } ;

-- @type like At_least_one_Variable_range
Range_expression : At_least_one_Variable_range { $$ := $1 } ;

-- @type like Optional_Variable_ranges
At_least_one_Variable_range : Variable_range Optional_Variable_ranges 
                              { create $$.make_optional_rest ($1, $2) } ;

-- @type VARIABLE_RANGE_LIST == MOG_LIST [like Variable_range]
Optional_Variable_ranges : -- Empty
								 | Optional_Variable_ranges ';' Variable_range 
							       { create $$.make_optional_first ($1, $3) } ;

-- @type like Restriction
Optional_Restriction : -- Empty
							| Restriction { $$ := $1 } ;

-- @type RESTRICTION <: BOOLEAN_EXPRESSION
Restriction : SUCH_THAT_TOKEN Boolean_expression { $$ := $2 } ;

-- @type PROPOSITION <: BOOLEAN_EXPRESSION
Proposition : IT_HOLDS_TOKEN Boolean_expression { $$ := $2 } ;

-- @type VARIABLE_RANGE
Variable_range : Member_range { $$ := $1 }
					| Type_range { $$ := $1 } ;

-- @type MEMBER_RANGE
Member_range : Identifier_list MEMBER_OF_TOKEN Set_expression { create $$.make ($1, $3) }
             | Identifier_list MEMBER_OF_TOKEN Parenthesized  { create $$.make_with_parenthesized_expression ($1, $3) } ;
             -- This last option was added because Parenthesized is treated as a boolean expression,
             -- not as a set expression. See note for Operator_expression.

-- @type TYPE_RANGE
Type_range : Identifier_list ':' Type { create $$.make ($1, $3) } ;

-- @type CALL
Call : Optional_Parenthesized_qualifier Call_chain { create $$.make ($1, $2) } ;

-- @type like Parenthesized_qualifier
Optional_Parenthesized_qualifier : -- Empty
											| Parenthesized_qualifier { $$ := $1 } ;

-- @type like Parenthesized
Parenthesized_qualifier : Parenthesized '.' { $$ := $1 } ;

-- @type like At_least_one_Unqualified_call
Call_chain : At_least_one_Unqualified_call { $$ := $1 } ;

-- @type like Optional_Unqualified_calls
At_least_one_Unqualified_call : Unqualified_call Optional_Unqualified_calls 
                                { create $$.make_optional_rest ($1, $2) } ;

-- @type UNQUALIFIED_CALLS == MOG_LIST [UNQUALIFIED_CALL]
Optional_Unqualified_calls : -- Empty
									| Optional_Unqualified_calls '.' Unqualified_call 
									  { create $$.make_optional_first ($1, $3) } ;

-- @type UNQUALIFIED_CALL
Unqualified_call : Identifier Optional_Actual_arguments { create $$.make ($1, $2) } ;

-- @type like Actual_arguments
Optional_Actual_arguments : -- Empty
								  | Actual_arguments { $$ := $1 } ;

-- @type ACTUAL_ARGUMENTS <: EXPRESSION_LIST
Actual_arguments : '(' Expression_list ')' { $$ := $2 } ;

-- @type like At_least_one_Expression
Expression_list : At_least_one_Expression { $$ := $1 } ;

-- @type like Optional_Expressions
At_least_one_Expression : Expression Optional_Expressions 
                          { create $$.make_optional_rest ($1, $2) } ;

-- @type EXPRESSION_LIST == MOG_LIST [EXPRESSION]
Optional_Expressions : -- Empty
							| Optional_Expressions ',' Expression 
							  { create $$.make_optional_first ($1, $3) } ;

-- @type OPERATOR_EXPRESSION
-- @design didriksen - Changed from original grammar in order to avoid circular inheritance for type Parenthesized.
--                     The original grammar implies the following assignment to be possible:
--                     Operator_expression := Parenthesized := Expression, although it is clearly not due to upcasting.
--                     Hence, Parenthesized has been moved to Expression.
Operator_expression : Unary_expression %prec UNARY_DUMMY { $$ := $1 }
						  | Binary_expression { $$ := $1 } ;

--Operator_expression : Parenthesized { $$ := $1 }
--						  | Unary_expression %prec UNARY_DUMMY { $$ := $1 }
--						  | Binary_expression { $$ := $1 } ;

-- @type PARENTHESIZED <: BOOLEAN_EXPRESSION
Parenthesized : '(' Expression ')' { $$ := $2 } ; 

-- @type UNARY_EXPRESSION
Unary_expression : Prefix_operator Expression { create $$.make ($1, $2) } ;

-- @type BINARY_EXPRESSION
Binary_expression : Expression Infix_operator Expression { create $$.make ($2, $1, $3) } ;

-- @type SET_EXPRESSION
Set_expression : Enumerated_set { $$ := $1 }
					| Call { $$ := $1 }
					| Operator_expression { $$ := $1 } ;

-- @type ENUMERATED_SET
Enumerated_set : '{' Enumeration_list '}' { $$ := $2 } ;

-- @type like At_least_one_Enumeration_element
Enumeration_list : At_least_one_Enumeration_element { $$ := $1 } ;

-- @type like Optional_Enumeration_elements
At_least_one_Enumeration_element : Enumeration_element Optional_Enumeration_elements 
                                   { create $$.make_optional_rest ($1, $2) } ;

-- @type ENUMERATION_LIST == MOG_LIST [like Enumeration_element]
Optional_Enumeration_elements : -- Empty
										| Optional_Enumeration_elements ',' 
										  Enumeration_element 
										  { create $$.make_optional_first ($1, $3) } ;

-- @type ENUMERATION_ELEMENT
Enumeration_element : Expression { $$ := $1 }
						  | Interval { $$ := $1 } ;

-- @type INTERVAL
Interval : Integer_interval { $$ := $1 }
			| Character_interval { $$ := $1 } ;

-- @type INTEGER_INTERVAL
Integer_interval : Integer_constant DOUBLE_DOT_TOKEN Integer_constant
                   { create $$.make ($1.value, $3.value) } ;

-- @type CHARACTER_INTERVAL
Character_interval : Character_constant DOUBLE_DOT_TOKEN Character_constant
                     { create $$.make ($1.value, $3.value) } ;

-- @design kiniry - Aug 26, 2001 - Added RESULT_TOKEN to this rule since, 
-- at first blush, it seems to be the right place for it.  See bug id TODO 
-- for more details.  Also missing are Enumerated_sets as Constants.

-- @type CONSTANT
Constant : Manifest_constant { $$ := $1 }
			| Enumerated_set { $$ := $1 }
			| Result_constant { $$ := $1 }
			| Current_constant { $$ := $1 }
			| Void_constant { $$ := $1 } ;

-- @type RESULT_CONSTANT
Result_constant : RESULT_TOKEN { create $$.make } ;

-- @type CHARACTER_CONSTANT
Current_constant : CURRENT_TOKEN { create $$.make } ;

-- @type VOID_CONSTANT
Void_constant : VOID_TOKEN { create $$.make } ;


-- @type MANIFEST_CONSTANT
Manifest_constant : Boolean_constant { $$ := $1 }
						| Character_constant { $$ := $1 }
						| Integer_constant { $$ := $1 }
						| Real_constant { $$ := $1 }
						| Manifest_string { $$ := $1 } ;

Optional_Sign : -- Empty
				  | Sign { $$ := $1 } ;

Sign : '+' { create $$.make_plus }
	 | '-' { create $$.make_minus } ; 

-- @type BOOLEAN_CONSTANT
Boolean_constant : TRUE_TOKEN { create $$.make (True) } 
					  | FALSE_TOKEN { create $$.make (False) } ;

-- @type CHARACTER_CONSTANT
Character_constant : '\'' CHARACTER_TOKEN '\'' { create $$.make (last_character_constant) } ;

-- @type INTEGER_CONSTANT
Integer_constant : Optional_Sign INTEGER_TOKEN { create $$.make (last_integer) } ;

-- @type REAL_CONSTANT
Real_constant : Optional_Sign REAL_TOKEN { create $$.make (last_real) } ;

-- @todo : This specification is incorrect.  Manifest textblocks can 
-- include multiple New_line separated string.

-- @type STRING
Manifest_textblock : String_begin SIMPLE_STRING_TOKEN String_end { create $$.make_from_string (last_string_constant) };

-- @type MANIFEST_STRING
Manifest_string : String_begin SIMPLE_STRING_TOKEN String_end { create $$.make_from_string (last_string_constant) };

String_begin : STRING_DELIMITER_TOKEN ;

String_end : STRING_DELIMITER_TOKEN ;

-- @type STRING
Identifier : IDENTIFIER_TOKEN { create $$.make_from_string (last_identifier) };

All_caps_identifier : ALL_CAPS_IDENTIFIER_TOKEN { create $$.make_from_string (last_identifier) };

-- A.8 DYNAMIC DIAGRAMS 

Dynamic_diagram_rule : DYNAMIC_DIAGRAM_TOKEN Optional_Extended_id 
							  Optional_Comment
							  COMPONENT_TOKEN 
							  Dynamic_block 
							  END_TOKEN 
                              { create $$.make ($2, $3, $5) } ;

Dynamic_block : -- Empty
				  | Dynamic_block Dynamic_component 
				    { create $$.make_optional_first ($1, $2) } ;

Dynamic_component : Scenario_description { $$ := $1 }
						| Object_group_rule { $$ := $1 }
						| Object_stack_rule { $$ := $1 }
						| Object_rule { $$ := $1 }
						| Message_relation { $$ := $1 } ;

Scenario_description : SCENARIO_TOKEN Scenario_name 
							  Optional_Comment 
							  ACTION_TOKEN Labeled_actions 
							  END_TOKEN 
							  { create $$.make ($2, $3, $5) } ;

Labeled_actions : At_least_one_Labeled_action { $$ := $1 } ;

At_least_one_Labeled_action : Labeled_action Optional_Labeled_actions 
                              { create $$.make_optional_rest ($1, $2) } ;

Optional_Labeled_actions : -- Empty
								 | Optional_Labeled_actions Labeled_action 
								   { create $$.make_optional_first ($1, $2) } ;

Labeled_action : Action_label Action_description 
                 { create $$.make ($1, $2) } ;

Action_label : Manifest_string { $$ := $1 } ;

Action_description : Manifest_textblock { $$ := $1 } ;

Scenario_name : Manifest_string { $$ := $1 } ;

Object_group_rule : Optional_Nameless 
						OBJECT_GROUP_TOKEN Group_name 
						Optional_Comment 
						Optional_Group_components
						{ create $$.make ($1, $3, $4, $5) } ; 

Optional_Nameless : -- Empty 
                    { $$ := False }
				  | NAMELESS_TOKEN
				    { $$ := True } ;

Optional_Group_components : -- Empty
								  | Group_components { $$ := $1 } ;

Group_components : COMPONENT_TOKEN Dynamic_block END_TOKEN { $$ := $2 } ;

Object_stack_rule : OBJECT_STACK_TOKEN Object_name Optional_Comment
                    { create $$.make ($2, $3) } ;

Object_rule : OBJECT_TOKEN Object_name Optional_Comment
              { create $$.make ($2, $3) } ;

Message_relation : Caller CALLS_TOKEN Receiver Optional_Message_label
                   { create $$.make ($1, $3, $4) } ;

Optional_Message_label : -- Empty
							  | Message_label { $$ := $1 } ;
 
Caller : Dynamic_ref { $$ := $1 } ;

Receiver : Dynamic_ref { $$ := $1 } ;

-- @design didriksen - deviates from original grammar in order to ease handling of 
--                     dynamic components names for dynamic references.
Dynamic_ref : Zero_or_more_Group_prefixes Object_name
              { create $$.make_with_object_name ($2, $1) }
            | Zero_or_more_Group_prefixes Group_name
              { create $$.make_with_group_name ($2, $1) } ;
--Dynamic_ref : Zero_or_more_Group_prefixes Dynamic_component_name;

Zero_or_more_Group_prefixes : -- Empty
									 | Zero_or_more_Group_prefixes Group_prefix 
									   { create $$.make_from_string ($2); $$.prepend_string ($1) } ;

Group_prefix : Group_name '.' 
               { create $$.make_from_string ($1); $$.append_character ('.') } ;
 
Dynamic_component_name : Object_name
							  | Group_name ;

Object_name : Class_name Optional_Extended_id_clause
              { create $$.make ($1, $2) } ;

Optional_Extended_id_clause : -- Empty
									 | '.' Extended_id { $$ := $2 } ;

-- Varies from original BON grammar.
Group_name : Extended_id { $$ := $1 }
			  | OBJECT_GROUP_OR_CONSTANT_NAME_TOKEN 
				 { $$ := last_identifier
					-- add_group_name($$)
				 } 
			  | All_caps_identifier 
				 { $$ := $1
					-- add_group_name($$)
				 } 
			  | Identifier 
				 { $$ := $1
					-- add_group_name($$)
				 } ;

Message_label : Manifest_string { $$ := $1 } ;

-- A.9 NOTATIONAL TUNING 

Notational_tuning : Change_string_marks
						| Change_concatenator
						| Change_prefix ;

Change_string_marks : STRING_MARKS_TOKEN Manifest_string Manifest_string ;

Change_concatenator : CONCATENATOR_TOKEN Manifest_string ;

Change_prefix : KEYWORD_PREFIX_TOKEN Manifest_string ;

-- END OF BON GRAMMAR

%%

end -- class BON_PARSER

-- Local Variables :
-- mode :text
-- End :
