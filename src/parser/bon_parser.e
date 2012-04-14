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

feature {NONE} -- Implementation

	yy_build_parser_tables
			-- Build parser tables.
		do
			yytranslate := yytranslate_template
			yyr1 := yyr1_template
			yytypes1 := yytypes1_template
			yytypes2 := yytypes2_template
			yydefact := yydefact_template
			yydefgoto := yydefgoto_template
			yypact := yypact_template
			yypgoto := yypgoto_template
			yytable := yytable_template
			yycheck := yycheck_template
		end

	yy_create_value_stacks
			-- Create value stacks.
		do
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
			yyvsp6 := -1
			yyvsp7 := -1
			yyvsp8 := -1
			yyvsp9 := -1
			yyvsp10 := -1
			yyvsp11 := -1
			yyvsp12 := -1
			yyvsp13 := -1
			yyvsp14 := -1
			yyvsp15 := -1
			yyvsp16 := -1
			yyvsp17 := -1
			yyvsp18 := -1
			yyvsp19 := -1
			yyvsp20 := -1
			yyvsp21 := -1
			yyvsp22 := -1
			yyvsp23 := -1
			yyvsp24 := -1
			yyvsp25 := -1
			yyvsp26 := -1
			yyvsp27 := -1
			yyvsp28 := -1
			yyvsp29 := -1
			yyvsp30 := -1
			yyvsp31 := -1
			yyvsp32 := -1
			yyvsp33 := -1
			yyvsp34 := -1
			yyvsp35 := -1
			yyvsp36 := -1
			yyvsp37 := -1
			yyvsp38 := -1
			yyvsp39 := -1
			yyvsp40 := -1
			yyvsp41 := -1
			yyvsp42 := -1
			yyvsp43 := -1
			yyvsp44 := -1
			yyvsp45 := -1
			yyvsp46 := -1
			yyvsp47 := -1
			yyvsp48 := -1
			yyvsp49 := -1
			yyvsp50 := -1
			yyvsp51 := -1
			yyvsp52 := -1
			yyvsp53 := -1
			yyvsp54 := -1
			yyvsp55 := -1
			yyvsp56 := -1
			yyvsp57 := -1
			yyvsp58 := -1
			yyvsp59 := -1
			yyvsp60 := -1
			yyvsp61 := -1
			yyvsp62 := -1
			yyvsp63 := -1
			yyvsp64 := -1
			yyvsp65 := -1
			yyvsp66 := -1
			yyvsp67 := -1
			yyvsp68 := -1
			yyvsp69 := -1
			yyvsp70 := -1
			yyvsp71 := -1
			yyvsp72 := -1
			yyvsp73 := -1
			yyvsp74 := -1
			yyvsp75 := -1
			yyvsp76 := -1
			yyvsp77 := -1
			yyvsp78 := -1
			yyvsp79 := -1
			yyvsp80 := -1
			yyvsp81 := -1
			yyvsp82 := -1
			yyvsp83 := -1
			yyvsp84 := -1
			yyvsp85 := -1
			yyvsp86 := -1
			yyvsp87 := -1
			yyvsp88 := -1
			yyvsp89 := -1
			yyvsp90 := -1
			yyvsp91 := -1
			yyvsp92 := -1
			yyvsp93 := -1
			yyvsp94 := -1
			yyvsp95 := -1
			yyvsp96 := -1
			yyvsp97 := -1
			yyvsp98 := -1
			yyvsp99 := -1
			yyvsp100 := -1
			yyvsp101 := -1
			yyvsp102 := -1
			yyvsp103 := -1
			yyvsp104 := -1
			yyvsp105 := -1
			yyvsp106 := -1
			yyvsp107 := -1
			yyvsp108 := -1
			yyvsp109 := -1
			yyvsp110 := -1
			yyvsp111 := -1
			yyvsp112 := -1
			yyvsp113 := -1
			yyvsp114 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		local
			l_yyvs1_default_item: ANY
			l_yyvs2_default_item: STRING
			l_yyvs3_default_item: CHARACTER
			l_yyvs4_default_item: INTEGER
			l_yyvs5_default_item: REAL
			l_yyvs6_default_item: BOOLEAN
			l_yyvs7_default_item: STATIC_REF
			l_yyvs8_default_item: BON_SPECIFICATION
			l_yyvs9_default_item: SPECIFICATION_ELEMENT
			l_yyvs10_default_item: SPECIFICATION_ELEMENTS
			l_yyvs11_default_item: INFORMAL_CHART
			l_yyvs12_default_item: CLASS_DICTIONARY
			l_yyvs13_default_item: DICTIONARY_ENTRY
			l_yyvs14_default_item: DICTIONARY_ENTRIES
			l_yyvs15_default_item: SYSTEM_CHART
			l_yyvs16_default_item: INDEX_CLAUSE
			l_yyvs17_default_item: INDEX_LIST
			l_yyvs18_default_item: STRING_LIST
			l_yyvs19_default_item: CLUSTER_ENTRY
			l_yyvs20_default_item: CLUSTER_ENTRIES
			l_yyvs21_default_item: CLUSTER_CHART
			l_yyvs22_default_item: CLASS_ENTRY
			l_yyvs23_default_item: CLASS_ENTRIES
			l_yyvs24_default_item: CLASS_CHART
			l_yyvs25_default_item: CLASS_NAME_LIST
			l_yyvs26_default_item: QUERY_LIST
			l_yyvs27_default_item: COMMAND_LIST
			l_yyvs28_default_item: CONSTRAINT_LIST
			l_yyvs29_default_item: EVENT_CHART
			l_yyvs30_default_item: EVENT_ENTRY
			l_yyvs31_default_item: EVENT_ENTRIES
			l_yyvs32_default_item: SCENARIO_CHART
			l_yyvs33_default_item: SCENARIO_ENTRY
			l_yyvs34_default_item: SCENARIO_ENTRIES
			l_yyvs35_default_item: CREATION_CHART
			l_yyvs36_default_item: CREATION_ENTRY
			l_yyvs37_default_item: CREATION_ENTRIES
			l_yyvs38_default_item: STATIC_DIAGRAM
			l_yyvs39_default_item: COMMENT
			l_yyvs40_default_item: STATIC_COMPONENT
			l_yyvs41_default_item: UNSPECIFIED_STATIC_COMPONENT
			l_yyvs42_default_item: STATIC_COMPONENTS
			l_yyvs43_default_item: CLUSTER_SPECIFICATION
			l_yyvs44_default_item: CLASS_SPECIFICATION
			l_yyvs45_default_item: STATIC_RELATION
			l_yyvs46_default_item: INHERITANCE_RELATION
			l_yyvs47_default_item: CLIENT_RELATION
			l_yyvs48_default_item: FORMAL_GENERIC
			l_yyvs49_default_item: FORMAL_GENERIC_LIST
			l_yyvs50_default_item: CLASS_TYPE
			l_yyvs51_default_item: ACTUAL_GENERICS
			l_yyvs52_default_item: BON_TYPE
			l_yyvs53_default_item: TYPE_MARK
			l_yyvs54_default_item: CLIENT_ENTITY
			l_yyvs55_default_item: CLIENT_ENTITIES
			l_yyvs56_default_item: SUPPLIER_INDIRECTION
			l_yyvs57_default_item: FEATURE_NAME_LIST
			l_yyvs58_default_item: GENERIC_INDIRECTION
			l_yyvs59_default_item: PARENT_INDIRECTION
			l_yyvs60_default_item: NAMED_INDIRECTION
			l_yyvs61_default_item: INDIRECTION_ELEMENT
			l_yyvs62_default_item: INDIRECTION_LIST
			l_yyvs63_default_item: CLASS_INTERFACE
			l_yyvs64_default_item: ASSERTION_CLAUSE_LIST
			l_yyvs65_default_item: CLASS_TYPE_LIST
			l_yyvs66_default_item: FEATURE_CLAUSE_LIST
			l_yyvs67_default_item: FEATURE_CLAUSE
			l_yyvs68_default_item: FEATURE_NAME
			l_yyvs69_default_item: OPERATOR
			l_yyvs70_default_item: BINARY_OPERATOR
			l_yyvs71_default_item: UNARY_OPERATOR
			l_yyvs72_default_item: SIGN
			l_yyvs73_default_item: RENAMING
			l_yyvs74_default_item: FEATURE_ARGUMENT_LIST
			l_yyvs75_default_item: FEATURE_ARGUMENT
			l_yyvs76_default_item: CONTRACT_CLAUSE
			l_yyvs77_default_item: FEATURE_SPECIFICATION_LIST
			l_yyvs78_default_item: FEATURE_SPECIFICATION
			l_yyvs79_default_item: ASSERTION_CLAUSE
			l_yyvs80_default_item: ASSERTION_COMMENT
			l_yyvs81_default_item: BOOLEAN_EXPRESSION
			l_yyvs82_default_item: QUANTIFIER
			l_yyvs83_default_item: QUANTIFICATION
			l_yyvs84_default_item: VARIABLE_RANGE_LIST
			l_yyvs85_default_item: VARIABLE_RANGE
			l_yyvs86_default_item: MEMBER_RANGE
			l_yyvs87_default_item: TYPE_RANGE
			l_yyvs88_default_item: CALL
			l_yyvs89_default_item: UNQUALIFIED_CALLS
			l_yyvs90_default_item: UNQUALIFIED_CALL
			l_yyvs91_default_item: EXPRESSION_LIST
			l_yyvs92_default_item: OPERATOR_EXPRESSION
			l_yyvs93_default_item: UNARY_EXPRESSION
			l_yyvs94_default_item: BINARY_EXPRESSION
			l_yyvs95_default_item: SET_EXPRESSION
			l_yyvs96_default_item: ENUMERATED_SET
			l_yyvs97_default_item: ENUMERATION_ELEMENT
			l_yyvs98_default_item: BON_INTERVAL
			l_yyvs99_default_item: BON_INTEGER_INTERVAL
			l_yyvs100_default_item: CHARACTER_INTERVAL
			l_yyvs101_default_item: CONSTANT
			l_yyvs102_default_item: MANIFEST_CONSTANT
			l_yyvs103_default_item: DYNAMIC_DIAGRAM
			l_yyvs104_default_item: DYNAMIC_COMPONENTS
			l_yyvs105_default_item: DYNAMIC_COMPONENT
			l_yyvs106_default_item: SCENARIO_DESCRIPTION
			l_yyvs107_default_item: OBJECT_GROUP
			l_yyvs108_default_item: OBJECT_STACK
			l_yyvs109_default_item: OBJECT
			l_yyvs110_default_item: MESSAGE_RELATION
			l_yyvs111_default_item: LABELED_ACTIONS
			l_yyvs112_default_item: LABELED_ACTION
			l_yyvs113_default_item: DYNAMIC_REF
			l_yyvs114_default_item: OBJECT_NAME
		do
			if yyvs1 /= Void then
				yyvs1.fill_with (l_yyvs1_default_item, 0, yyvs1.upper)
			end
			if yyvs2 /= Void then
				yyvs2.fill_with (l_yyvs2_default_item, 0, yyvs2.upper)
			end
			if yyvs3 /= Void then
				yyvs3.fill_with (l_yyvs3_default_item, 0, yyvs3.upper)
			end
			if yyvs4 /= Void then
				yyvs4.fill_with (l_yyvs4_default_item, 0, yyvs4.upper)
			end
			if yyvs5 /= Void then
				yyvs5.fill_with (l_yyvs5_default_item, 0, yyvs5.upper)
			end
			if yyvs6 /= Void then
				yyvs6.fill_with (l_yyvs6_default_item, 0, yyvs6.upper)
			end
			if yyvs7 /= Void then
				yyvs7.fill_with (l_yyvs7_default_item, 0, yyvs7.upper)
			end
			if yyvs8 /= Void then
				yyvs8.fill_with (l_yyvs8_default_item, 0, yyvs8.upper)
			end
			if yyvs9 /= Void then
				yyvs9.fill_with (l_yyvs9_default_item, 0, yyvs9.upper)
			end
			if yyvs10 /= Void then
				yyvs10.fill_with (l_yyvs10_default_item, 0, yyvs10.upper)
			end
			if yyvs11 /= Void then
				yyvs11.fill_with (l_yyvs11_default_item, 0, yyvs11.upper)
			end
			if yyvs12 /= Void then
				yyvs12.fill_with (l_yyvs12_default_item, 0, yyvs12.upper)
			end
			if yyvs13 /= Void then
				yyvs13.fill_with (l_yyvs13_default_item, 0, yyvs13.upper)
			end
			if yyvs14 /= Void then
				yyvs14.fill_with (l_yyvs14_default_item, 0, yyvs14.upper)
			end
			if yyvs15 /= Void then
				yyvs15.fill_with (l_yyvs15_default_item, 0, yyvs15.upper)
			end
			if yyvs16 /= Void then
				yyvs16.fill_with (l_yyvs16_default_item, 0, yyvs16.upper)
			end
			if yyvs17 /= Void then
				yyvs17.fill_with (l_yyvs17_default_item, 0, yyvs17.upper)
			end
			if yyvs18 /= Void then
				yyvs18.fill_with (l_yyvs18_default_item, 0, yyvs18.upper)
			end
			if yyvs19 /= Void then
				yyvs19.fill_with (l_yyvs19_default_item, 0, yyvs19.upper)
			end
			if yyvs20 /= Void then
				yyvs20.fill_with (l_yyvs20_default_item, 0, yyvs20.upper)
			end
			if yyvs21 /= Void then
				yyvs21.fill_with (l_yyvs21_default_item, 0, yyvs21.upper)
			end
			if yyvs22 /= Void then
				yyvs22.fill_with (l_yyvs22_default_item, 0, yyvs22.upper)
			end
			if yyvs23 /= Void then
				yyvs23.fill_with (l_yyvs23_default_item, 0, yyvs23.upper)
			end
			if yyvs24 /= Void then
				yyvs24.fill_with (l_yyvs24_default_item, 0, yyvs24.upper)
			end
			if yyvs25 /= Void then
				yyvs25.fill_with (l_yyvs25_default_item, 0, yyvs25.upper)
			end
			if yyvs26 /= Void then
				yyvs26.fill_with (l_yyvs26_default_item, 0, yyvs26.upper)
			end
			if yyvs27 /= Void then
				yyvs27.fill_with (l_yyvs27_default_item, 0, yyvs27.upper)
			end
			if yyvs28 /= Void then
				yyvs28.fill_with (l_yyvs28_default_item, 0, yyvs28.upper)
			end
			if yyvs29 /= Void then
				yyvs29.fill_with (l_yyvs29_default_item, 0, yyvs29.upper)
			end
			if yyvs30 /= Void then
				yyvs30.fill_with (l_yyvs30_default_item, 0, yyvs30.upper)
			end
			if yyvs31 /= Void then
				yyvs31.fill_with (l_yyvs31_default_item, 0, yyvs31.upper)
			end
			if yyvs32 /= Void then
				yyvs32.fill_with (l_yyvs32_default_item, 0, yyvs32.upper)
			end
			if yyvs33 /= Void then
				yyvs33.fill_with (l_yyvs33_default_item, 0, yyvs33.upper)
			end
			if yyvs34 /= Void then
				yyvs34.fill_with (l_yyvs34_default_item, 0, yyvs34.upper)
			end
			if yyvs35 /= Void then
				yyvs35.fill_with (l_yyvs35_default_item, 0, yyvs35.upper)
			end
			if yyvs36 /= Void then
				yyvs36.fill_with (l_yyvs36_default_item, 0, yyvs36.upper)
			end
			if yyvs37 /= Void then
				yyvs37.fill_with (l_yyvs37_default_item, 0, yyvs37.upper)
			end
			if yyvs38 /= Void then
				yyvs38.fill_with (l_yyvs38_default_item, 0, yyvs38.upper)
			end
			if yyvs39 /= Void then
				yyvs39.fill_with (l_yyvs39_default_item, 0, yyvs39.upper)
			end
			if yyvs40 /= Void then
				yyvs40.fill_with (l_yyvs40_default_item, 0, yyvs40.upper)
			end
			if yyvs41 /= Void then
				yyvs41.fill_with (l_yyvs41_default_item, 0, yyvs41.upper)
			end
			if yyvs42 /= Void then
				yyvs42.fill_with (l_yyvs42_default_item, 0, yyvs42.upper)
			end
			if yyvs43 /= Void then
				yyvs43.fill_with (l_yyvs43_default_item, 0, yyvs43.upper)
			end
			if yyvs44 /= Void then
				yyvs44.fill_with (l_yyvs44_default_item, 0, yyvs44.upper)
			end
			if yyvs45 /= Void then
				yyvs45.fill_with (l_yyvs45_default_item, 0, yyvs45.upper)
			end
			if yyvs46 /= Void then
				yyvs46.fill_with (l_yyvs46_default_item, 0, yyvs46.upper)
			end
			if yyvs47 /= Void then
				yyvs47.fill_with (l_yyvs47_default_item, 0, yyvs47.upper)
			end
			if yyvs48 /= Void then
				yyvs48.fill_with (l_yyvs48_default_item, 0, yyvs48.upper)
			end
			if yyvs49 /= Void then
				yyvs49.fill_with (l_yyvs49_default_item, 0, yyvs49.upper)
			end
			if yyvs50 /= Void then
				yyvs50.fill_with (l_yyvs50_default_item, 0, yyvs50.upper)
			end
			if yyvs51 /= Void then
				yyvs51.fill_with (l_yyvs51_default_item, 0, yyvs51.upper)
			end
			if yyvs52 /= Void then
				yyvs52.fill_with (l_yyvs52_default_item, 0, yyvs52.upper)
			end
			if yyvs53 /= Void then
				yyvs53.fill_with (l_yyvs53_default_item, 0, yyvs53.upper)
			end
			if yyvs54 /= Void then
				yyvs54.fill_with (l_yyvs54_default_item, 0, yyvs54.upper)
			end
			if yyvs55 /= Void then
				yyvs55.fill_with (l_yyvs55_default_item, 0, yyvs55.upper)
			end
			if yyvs56 /= Void then
				yyvs56.fill_with (l_yyvs56_default_item, 0, yyvs56.upper)
			end
			if yyvs57 /= Void then
				yyvs57.fill_with (l_yyvs57_default_item, 0, yyvs57.upper)
			end
			if yyvs58 /= Void then
				yyvs58.fill_with (l_yyvs58_default_item, 0, yyvs58.upper)
			end
			if yyvs59 /= Void then
				yyvs59.fill_with (l_yyvs59_default_item, 0, yyvs59.upper)
			end
			if yyvs60 /= Void then
				yyvs60.fill_with (l_yyvs60_default_item, 0, yyvs60.upper)
			end
			if yyvs61 /= Void then
				yyvs61.fill_with (l_yyvs61_default_item, 0, yyvs61.upper)
			end
			if yyvs62 /= Void then
				yyvs62.fill_with (l_yyvs62_default_item, 0, yyvs62.upper)
			end
			if yyvs63 /= Void then
				yyvs63.fill_with (l_yyvs63_default_item, 0, yyvs63.upper)
			end
			if yyvs64 /= Void then
				yyvs64.fill_with (l_yyvs64_default_item, 0, yyvs64.upper)
			end
			if yyvs65 /= Void then
				yyvs65.fill_with (l_yyvs65_default_item, 0, yyvs65.upper)
			end
			if yyvs66 /= Void then
				yyvs66.fill_with (l_yyvs66_default_item, 0, yyvs66.upper)
			end
			if yyvs67 /= Void then
				yyvs67.fill_with (l_yyvs67_default_item, 0, yyvs67.upper)
			end
			if yyvs68 /= Void then
				yyvs68.fill_with (l_yyvs68_default_item, 0, yyvs68.upper)
			end
			if yyvs69 /= Void then
				yyvs69.fill_with (l_yyvs69_default_item, 0, yyvs69.upper)
			end
			if yyvs70 /= Void then
				yyvs70.fill_with (l_yyvs70_default_item, 0, yyvs70.upper)
			end
			if yyvs71 /= Void then
				yyvs71.fill_with (l_yyvs71_default_item, 0, yyvs71.upper)
			end
			if yyvs72 /= Void then
				yyvs72.fill_with (l_yyvs72_default_item, 0, yyvs72.upper)
			end
			if yyvs73 /= Void then
				yyvs73.fill_with (l_yyvs73_default_item, 0, yyvs73.upper)
			end
			if yyvs74 /= Void then
				yyvs74.fill_with (l_yyvs74_default_item, 0, yyvs74.upper)
			end
			if yyvs75 /= Void then
				yyvs75.fill_with (l_yyvs75_default_item, 0, yyvs75.upper)
			end
			if yyvs76 /= Void then
				yyvs76.fill_with (l_yyvs76_default_item, 0, yyvs76.upper)
			end
			if yyvs77 /= Void then
				yyvs77.fill_with (l_yyvs77_default_item, 0, yyvs77.upper)
			end
			if yyvs78 /= Void then
				yyvs78.fill_with (l_yyvs78_default_item, 0, yyvs78.upper)
			end
			if yyvs79 /= Void then
				yyvs79.fill_with (l_yyvs79_default_item, 0, yyvs79.upper)
			end
			if yyvs80 /= Void then
				yyvs80.fill_with (l_yyvs80_default_item, 0, yyvs80.upper)
			end
			if yyvs81 /= Void then
				yyvs81.fill_with (l_yyvs81_default_item, 0, yyvs81.upper)
			end
			if yyvs82 /= Void then
				yyvs82.fill_with (l_yyvs82_default_item, 0, yyvs82.upper)
			end
			if yyvs83 /= Void then
				yyvs83.fill_with (l_yyvs83_default_item, 0, yyvs83.upper)
			end
			if yyvs84 /= Void then
				yyvs84.fill_with (l_yyvs84_default_item, 0, yyvs84.upper)
			end
			if yyvs85 /= Void then
				yyvs85.fill_with (l_yyvs85_default_item, 0, yyvs85.upper)
			end
			if yyvs86 /= Void then
				yyvs86.fill_with (l_yyvs86_default_item, 0, yyvs86.upper)
			end
			if yyvs87 /= Void then
				yyvs87.fill_with (l_yyvs87_default_item, 0, yyvs87.upper)
			end
			if yyvs88 /= Void then
				yyvs88.fill_with (l_yyvs88_default_item, 0, yyvs88.upper)
			end
			if yyvs89 /= Void then
				yyvs89.fill_with (l_yyvs89_default_item, 0, yyvs89.upper)
			end
			if yyvs90 /= Void then
				yyvs90.fill_with (l_yyvs90_default_item, 0, yyvs90.upper)
			end
			if yyvs91 /= Void then
				yyvs91.fill_with (l_yyvs91_default_item, 0, yyvs91.upper)
			end
			if yyvs92 /= Void then
				yyvs92.fill_with (l_yyvs92_default_item, 0, yyvs92.upper)
			end
			if yyvs93 /= Void then
				yyvs93.fill_with (l_yyvs93_default_item, 0, yyvs93.upper)
			end
			if yyvs94 /= Void then
				yyvs94.fill_with (l_yyvs94_default_item, 0, yyvs94.upper)
			end
			if yyvs95 /= Void then
				yyvs95.fill_with (l_yyvs95_default_item, 0, yyvs95.upper)
			end
			if yyvs96 /= Void then
				yyvs96.fill_with (l_yyvs96_default_item, 0, yyvs96.upper)
			end
			if yyvs97 /= Void then
				yyvs97.fill_with (l_yyvs97_default_item, 0, yyvs97.upper)
			end
			if yyvs98 /= Void then
				yyvs98.fill_with (l_yyvs98_default_item, 0, yyvs98.upper)
			end
			if yyvs99 /= Void then
				yyvs99.fill_with (l_yyvs99_default_item, 0, yyvs99.upper)
			end
			if yyvs100 /= Void then
				yyvs100.fill_with (l_yyvs100_default_item, 0, yyvs100.upper)
			end
			if yyvs101 /= Void then
				yyvs101.fill_with (l_yyvs101_default_item, 0, yyvs101.upper)
			end
			if yyvs102 /= Void then
				yyvs102.fill_with (l_yyvs102_default_item, 0, yyvs102.upper)
			end
			if yyvs103 /= Void then
				yyvs103.fill_with (l_yyvs103_default_item, 0, yyvs103.upper)
			end
			if yyvs104 /= Void then
				yyvs104.fill_with (l_yyvs104_default_item, 0, yyvs104.upper)
			end
			if yyvs105 /= Void then
				yyvs105.fill_with (l_yyvs105_default_item, 0, yyvs105.upper)
			end
			if yyvs106 /= Void then
				yyvs106.fill_with (l_yyvs106_default_item, 0, yyvs106.upper)
			end
			if yyvs107 /= Void then
				yyvs107.fill_with (l_yyvs107_default_item, 0, yyvs107.upper)
			end
			if yyvs108 /= Void then
				yyvs108.fill_with (l_yyvs108_default_item, 0, yyvs108.upper)
			end
			if yyvs109 /= Void then
				yyvs109.fill_with (l_yyvs109_default_item, 0, yyvs109.upper)
			end
			if yyvs110 /= Void then
				yyvs110.fill_with (l_yyvs110_default_item, 0, yyvs110.upper)
			end
			if yyvs111 /= Void then
				yyvs111.fill_with (l_yyvs111_default_item, 0, yyvs111.upper)
			end
			if yyvs112 /= Void then
				yyvs112.fill_with (l_yyvs112_default_item, 0, yyvs112.upper)
			end
			if yyvs113 /= Void then
				yyvs113.fill_with (l_yyvs113_default_item, 0, yyvs113.upper)
			end
			if yyvs114 /= Void then
				yyvs114.fill_with (l_yyvs114_default_item, 0, yyvs114.upper)
			end
		end

	yy_push_last_value (yychar1: INTEGER)
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 then
					if yyvs1 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs1")
						end
						create yyspecial_routines1
						yyvsc1 := yyInitial_yyvs_size
						yyvs1 := yyspecial_routines1.make (yyvsc1)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs1")
						end
						yyvsc1 := yyvsc1 + yyInitial_yyvs_size
						yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
					end
				end
				yyvs1.put (last_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					if yyvs2 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs2")
						end
						create yyspecial_routines2
						yyvsc2 := yyInitial_yyvs_size
						yyvs2 := yyspecial_routines2.make (yyvsc2)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs2")
						end
						yyvsc2 := yyvsc2 + yyInitial_yyvs_size
						yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
					end
				end
				yyvs2.put (last_string_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					if yyvs3 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs3")
						end
						create yyspecial_routines3
						yyvsc3 := yyInitial_yyvs_size
						yyvs3 := yyspecial_routines3.make (yyvsc3)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs3")
						end
						yyvsc3 := yyvsc3 + yyInitial_yyvs_size
						yyvs3 := yyspecial_routines3.resize (yyvs3, yyvsc3)
					end
				end
				yyvs3.put (last_character_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					if yyvs4 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs4")
						end
						create yyspecial_routines4
						yyvsc4 := yyInitial_yyvs_size
						yyvs4 := yyspecial_routines4.make (yyvsc4)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs4")
						end
						yyvsc4 := yyvsc4 + yyInitial_yyvs_size
						yyvs4 := yyspecial_routines4.resize (yyvs4, yyvsc4)
					end
				end
				yyvs4.put (last_integer_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					if yyvs5 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs5")
						end
						create yyspecial_routines5
						yyvsc5 := yyInitial_yyvs_size
						yyvs5 := yyspecial_routines5.make (yyvsc5)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs5")
						end
						yyvsc5 := yyvsc5 + yyInitial_yyvs_size
						yyvs5 := yyspecial_routines5.resize (yyvs5, yyvsc5)
					end
				end
				yyvs5.put (last_real_value, yyvsp5)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: not a token type: ")
					std.error.put_integer (yytypes2.item (yychar1))
					std.error.put_new_line
				end
				abort
			end
		end

	yy_push_error_value
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyval1: ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				if yyvs1 = Void then
					debug ("GEYACC")
						std.error.put_line ("Create yyvs1")
					end
					create yyspecial_routines1
					yyvsc1 := yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.make (yyvsc1)
				else
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
				end
			end
			yyvs1.put (yyval1, yyvsp1)
		end

	yy_pop_last_value (yystate: INTEGER)
			-- Pop semantic value from stack when in state `yystate'.
		local
			yy_type_id: INTEGER
		do
			yy_type_id := yytypes1.item (yystate)
			inspect yy_type_id
			when 1 then
				yyvsp1 := yyvsp1 - 1
			when 2 then
				yyvsp2 := yyvsp2 - 1
			when 3 then
				yyvsp3 := yyvsp3 - 1
			when 4 then
				yyvsp4 := yyvsp4 - 1
			when 5 then
				yyvsp5 := yyvsp5 - 1
			when 6 then
				yyvsp6 := yyvsp6 - 1
			when 7 then
				yyvsp7 := yyvsp7 - 1
			when 8 then
				yyvsp8 := yyvsp8 - 1
			when 9 then
				yyvsp9 := yyvsp9 - 1
			when 10 then
				yyvsp10 := yyvsp10 - 1
			when 11 then
				yyvsp11 := yyvsp11 - 1
			when 12 then
				yyvsp12 := yyvsp12 - 1
			when 13 then
				yyvsp13 := yyvsp13 - 1
			when 14 then
				yyvsp14 := yyvsp14 - 1
			when 15 then
				yyvsp15 := yyvsp15 - 1
			when 16 then
				yyvsp16 := yyvsp16 - 1
			when 17 then
				yyvsp17 := yyvsp17 - 1
			when 18 then
				yyvsp18 := yyvsp18 - 1
			when 19 then
				yyvsp19 := yyvsp19 - 1
			when 20 then
				yyvsp20 := yyvsp20 - 1
			when 21 then
				yyvsp21 := yyvsp21 - 1
			when 22 then
				yyvsp22 := yyvsp22 - 1
			when 23 then
				yyvsp23 := yyvsp23 - 1
			when 24 then
				yyvsp24 := yyvsp24 - 1
			when 25 then
				yyvsp25 := yyvsp25 - 1
			when 26 then
				yyvsp26 := yyvsp26 - 1
			when 27 then
				yyvsp27 := yyvsp27 - 1
			when 28 then
				yyvsp28 := yyvsp28 - 1
			when 29 then
				yyvsp29 := yyvsp29 - 1
			when 30 then
				yyvsp30 := yyvsp30 - 1
			when 31 then
				yyvsp31 := yyvsp31 - 1
			when 32 then
				yyvsp32 := yyvsp32 - 1
			when 33 then
				yyvsp33 := yyvsp33 - 1
			when 34 then
				yyvsp34 := yyvsp34 - 1
			when 35 then
				yyvsp35 := yyvsp35 - 1
			when 36 then
				yyvsp36 := yyvsp36 - 1
			when 37 then
				yyvsp37 := yyvsp37 - 1
			when 38 then
				yyvsp38 := yyvsp38 - 1
			when 39 then
				yyvsp39 := yyvsp39 - 1
			when 40 then
				yyvsp40 := yyvsp40 - 1
			when 41 then
				yyvsp41 := yyvsp41 - 1
			when 42 then
				yyvsp42 := yyvsp42 - 1
			when 43 then
				yyvsp43 := yyvsp43 - 1
			when 44 then
				yyvsp44 := yyvsp44 - 1
			when 45 then
				yyvsp45 := yyvsp45 - 1
			when 46 then
				yyvsp46 := yyvsp46 - 1
			when 47 then
				yyvsp47 := yyvsp47 - 1
			when 48 then
				yyvsp48 := yyvsp48 - 1
			when 49 then
				yyvsp49 := yyvsp49 - 1
			when 50 then
				yyvsp50 := yyvsp50 - 1
			when 51 then
				yyvsp51 := yyvsp51 - 1
			when 52 then
				yyvsp52 := yyvsp52 - 1
			when 53 then
				yyvsp53 := yyvsp53 - 1
			when 54 then
				yyvsp54 := yyvsp54 - 1
			when 55 then
				yyvsp55 := yyvsp55 - 1
			when 56 then
				yyvsp56 := yyvsp56 - 1
			when 57 then
				yyvsp57 := yyvsp57 - 1
			when 58 then
				yyvsp58 := yyvsp58 - 1
			when 59 then
				yyvsp59 := yyvsp59 - 1
			when 60 then
				yyvsp60 := yyvsp60 - 1
			when 61 then
				yyvsp61 := yyvsp61 - 1
			when 62 then
				yyvsp62 := yyvsp62 - 1
			when 63 then
				yyvsp63 := yyvsp63 - 1
			when 64 then
				yyvsp64 := yyvsp64 - 1
			when 65 then
				yyvsp65 := yyvsp65 - 1
			when 66 then
				yyvsp66 := yyvsp66 - 1
			when 67 then
				yyvsp67 := yyvsp67 - 1
			when 68 then
				yyvsp68 := yyvsp68 - 1
			when 69 then
				yyvsp69 := yyvsp69 - 1
			when 70 then
				yyvsp70 := yyvsp70 - 1
			when 71 then
				yyvsp71 := yyvsp71 - 1
			when 72 then
				yyvsp72 := yyvsp72 - 1
			when 73 then
				yyvsp73 := yyvsp73 - 1
			when 74 then
				yyvsp74 := yyvsp74 - 1
			when 75 then
				yyvsp75 := yyvsp75 - 1
			when 76 then
				yyvsp76 := yyvsp76 - 1
			when 77 then
				yyvsp77 := yyvsp77 - 1
			when 78 then
				yyvsp78 := yyvsp78 - 1
			when 79 then
				yyvsp79 := yyvsp79 - 1
			when 80 then
				yyvsp80 := yyvsp80 - 1
			when 81 then
				yyvsp81 := yyvsp81 - 1
			when 82 then
				yyvsp82 := yyvsp82 - 1
			when 83 then
				yyvsp83 := yyvsp83 - 1
			when 84 then
				yyvsp84 := yyvsp84 - 1
			when 85 then
				yyvsp85 := yyvsp85 - 1
			when 86 then
				yyvsp86 := yyvsp86 - 1
			when 87 then
				yyvsp87 := yyvsp87 - 1
			when 88 then
				yyvsp88 := yyvsp88 - 1
			when 89 then
				yyvsp89 := yyvsp89 - 1
			when 90 then
				yyvsp90 := yyvsp90 - 1
			when 91 then
				yyvsp91 := yyvsp91 - 1
			when 92 then
				yyvsp92 := yyvsp92 - 1
			when 93 then
				yyvsp93 := yyvsp93 - 1
			when 94 then
				yyvsp94 := yyvsp94 - 1
			when 95 then
				yyvsp95 := yyvsp95 - 1
			when 96 then
				yyvsp96 := yyvsp96 - 1
			when 97 then
				yyvsp97 := yyvsp97 - 1
			when 98 then
				yyvsp98 := yyvsp98 - 1
			when 99 then
				yyvsp99 := yyvsp99 - 1
			when 100 then
				yyvsp100 := yyvsp100 - 1
			when 101 then
				yyvsp101 := yyvsp101 - 1
			when 102 then
				yyvsp102 := yyvsp102 - 1
			when 103 then
				yyvsp103 := yyvsp103 - 1
			when 104 then
				yyvsp104 := yyvsp104 - 1
			when 105 then
				yyvsp105 := yyvsp105 - 1
			when 106 then
				yyvsp106 := yyvsp106 - 1
			when 107 then
				yyvsp107 := yyvsp107 - 1
			when 108 then
				yyvsp108 := yyvsp108 - 1
			when 109 then
				yyvsp109 := yyvsp109 - 1
			when 110 then
				yyvsp110 := yyvsp110 - 1
			when 111 then
				yyvsp111 := yyvsp111 - 1
			when 112 then
				yyvsp112 := yyvsp112 - 1
			when 113 then
				yyvsp113 := yyvsp113 - 1
			when 114 then
				yyvsp114 := yyvsp114 - 1
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown type id: ")
					std.error.put_integer (yy_type_id)
					std.error.put_new_line
				end
				abort
			end
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER)
			-- Execute semantic action.
		local
			yyval8: BON_SPECIFICATION
			yyval10: SPECIFICATION_ELEMENTS
			yyval9: SPECIFICATION_ELEMENT
			yyval11: INFORMAL_CHART
			yyval12: CLASS_DICTIONARY
			yyval14: DICTIONARY_ENTRIES
			yyval13: DICTIONARY_ENTRY
			yyval15: SYSTEM_CHART
			yyval17: INDEX_LIST
			yyval2: STRING
			yyval20: CLUSTER_ENTRIES
			yyval19: CLUSTER_ENTRY
			yyval16: INDEX_CLAUSE
			yyval18: STRING_LIST
			yyval21: CLUSTER_CHART
			yyval23: CLASS_ENTRIES
			yyval22: CLASS_ENTRY
			yyval24: CLASS_CHART
			yyval25: CLASS_NAME_LIST
			yyval26: QUERY_LIST
			yyval27: COMMAND_LIST
			yyval28: CONSTRAINT_LIST
			yyval29: EVENT_CHART
			yyval31: EVENT_ENTRIES
			yyval30: EVENT_ENTRY
			yyval32: SCENARIO_CHART
			yyval34: SCENARIO_ENTRIES
			yyval33: SCENARIO_ENTRY
			yyval35: CREATION_CHART
			yyval37: CREATION_ENTRIES
			yyval36: CREATION_ENTRY
			yyval38: STATIC_DIAGRAM
			yyval39: COMMENT
			yyval42: STATIC_COMPONENTS
			yyval40: STATIC_COMPONENT
			yyval41: UNSPECIFIED_STATIC_COMPONENT
			yyval43: CLUSTER_SPECIFICATION
			yyval6: BOOLEAN
			yyval44: CLASS_SPECIFICATION
			yyval63: CLASS_INTERFACE
			yyval45: STATIC_RELATION
			yyval46: INHERITANCE_RELATION
			yyval4: INTEGER
			yyval47: CLIENT_RELATION
			yyval53: TYPE_MARK
			yyval55: CLIENT_ENTITIES
			yyval54: CLIENT_ENTITY
			yyval56: SUPPLIER_INDIRECTION
			yyval57: FEATURE_NAME_LIST
			yyval59: PARENT_INDIRECTION
			yyval58: GENERIC_INDIRECTION
			yyval60: NAMED_INDIRECTION
			yyval62: INDIRECTION_LIST
			yyval61: INDIRECTION_ELEMENT
			yyval7: STATIC_REF
			yyval65: CLASS_TYPE_LIST
			yyval64: ASSERTION_CLAUSE_LIST
			yyval66: FEATURE_CLAUSE_LIST
			yyval67: FEATURE_CLAUSE
			yyval77: FEATURE_SPECIFICATION_LIST
			yyval78: FEATURE_SPECIFICATION
			yyval52: BON_TYPE
			yyval73: RENAMING
			yyval74: FEATURE_ARGUMENT_LIST
			yyval76: CONTRACT_CLAUSE
			yyval68: FEATURE_NAME
			yyval75: FEATURE_ARGUMENT
			yyval69: OPERATOR
			yyval49: FORMAL_GENERIC_LIST
			yyval48: FORMAL_GENERIC
			yyval50: CLASS_TYPE
			yyval51: ACTUAL_GENERICS
			yyval71: UNARY_OPERATOR
			yyval70: BINARY_OPERATOR
			yyval79: ASSERTION_CLAUSE
			yyval80: ASSERTION_COMMENT
			yyval81: BOOLEAN_EXPRESSION
			yyval83: QUANTIFICATION
			yyval82: QUANTIFIER
			yyval84: VARIABLE_RANGE_LIST
			yyval85: VARIABLE_RANGE
			yyval86: MEMBER_RANGE
			yyval87: TYPE_RANGE
			yyval88: CALL
			yyval89: UNQUALIFIED_CALLS
			yyval90: UNQUALIFIED_CALL
			yyval91: EXPRESSION_LIST
			yyval92: OPERATOR_EXPRESSION
			yyval93: UNARY_EXPRESSION
			yyval94: BINARY_EXPRESSION
			yyval95: SET_EXPRESSION
			yyval96: ENUMERATED_SET
			yyval97: ENUMERATION_ELEMENT
			yyval98: BON_INTERVAL
			yyval99: BON_INTEGER_INTERVAL
			yyval100: CHARACTER_INTERVAL
			yyval101: CONSTANT
			yyval102: MANIFEST_CONSTANT
			yyval1: ANY
			yyval72: SIGN
			yyval3: CHARACTER
			yyval5: REAL
		do
			inspect yy_act
when 1 then
--|#line 524 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 524")
end

create yyval8.make_from_elements (yyvs10.item (yyvsp10)); bon_specification := yyval8; io.put_string("BON SPEC CREATED!") 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp8 >= yyvsc8 then
		if yyvs8 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs8")
			end
			create yyspecial_routines8
			yyvsc8 := yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.make (yyvsc8)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs8")
			end
			yyvsc8 := yyvsc8 + yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.resize (yyvs8, yyvsc8)
		end
	end
	yyvs8.put (yyval8, yyvsp8)
end
when 2 then
--|#line 528 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 528")
end

create yyval10.make_optional_rest (yyvs9.item (yyvsp9), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp9 := yyvsp9 -1
	yyvs10.put (yyval10, yyvsp10)
end
when 3 then
--|#line 532 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 532")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp10 := yyvsp10 + 1
	if yyvsp10 >= yyvsc10 then
		if yyvs10 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs10")
			end
			create yyspecial_routines10
			yyvsc10 := yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.make (yyvsc10)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs10")
			end
			yyvsc10 := yyvsc10 + yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.resize (yyvs10, yyvsc10)
		end
	end
	yyvs10.put (yyval10, yyvsp10)
end
when 4 then
--|#line 533 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 533")
end

create yyval10.make_optional_first (yyvs10.item (yyvsp10), yyvs9.item (yyvsp9)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp9 := yyvsp9 -1
	yyvs10.put (yyval10, yyvsp10)
end
when 5 then
--|#line 537 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 537")
end

yyval9 := yyvs39.item (yyvsp39) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp39 := yyvsp39 -1
	if yyvsp9 >= yyvsc9 then
		if yyvs9 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs9")
			end
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs9")
			end
			yyvsc9 := yyvsc9 + yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.resize (yyvs9, yyvsc9)
		end
	end
	yyvs9.put (yyval9, yyvsp9)
end
when 6 then
--|#line 538 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 538")
end

yyval9 := yyvs11.item (yyvsp11) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp11 := yyvsp11 -1
	if yyvsp9 >= yyvsc9 then
		if yyvs9 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs9")
			end
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs9")
			end
			yyvsc9 := yyvsc9 + yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.resize (yyvs9, yyvsc9)
		end
	end
	yyvs9.put (yyval9, yyvsp9)
end
when 7 then
--|#line 540 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 540")
end

yyval9 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp9 >= yyvsc9 then
		if yyvs9 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs9")
			end
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs9")
			end
			yyvsc9 := yyvsc9 + yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.resize (yyvs9, yyvsc9)
		end
	end
	yyvs9.put (yyval9, yyvsp9)
end
when 8 then
--|#line 542 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 542")
end

yyval9 := yyvs38.item (yyvsp38) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp38 := yyvsp38 -1
	if yyvsp9 >= yyvsc9 then
		if yyvs9 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs9")
			end
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs9")
			end
			yyvsc9 := yyvsc9 + yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.resize (yyvs9, yyvsc9)
		end
	end
	yyvs9.put (yyval9, yyvsp9)
end
when 9 then
--|#line 546 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 546")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp9 >= yyvsc9 then
		if yyvs9 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs9")
			end
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs9")
			end
			yyvsc9 := yyvsc9 + yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.resize (yyvs9, yyvsc9)
		end
	end
	yyvs9.put (yyval9, yyvsp9)
end
when 10 then
--|#line 551 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 551")
end

yyval11 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp15 := yyvsp15 -1
	if yyvsp11 >= yyvsc11 then
		if yyvs11 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs11")
			end
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs11")
			end
			yyvsc11 := yyvsc11 + yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.resize (yyvs11, yyvsc11)
		end
	end
	yyvs11.put (yyval11, yyvsp11)
end
when 11 then
--|#line 553 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 553")
end

yyval11 := yyvs21.item (yyvsp21) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp11 >= yyvsc11 then
		if yyvs11 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs11")
			end
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs11")
			end
			yyvsc11 := yyvsc11 + yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.resize (yyvs11, yyvsc11)
		end
	end
	yyvs11.put (yyval11, yyvsp11)
end
when 12 then
--|#line 555 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 555")
end

yyval11 := yyvs24.item (yyvsp24) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp11 >= yyvsc11 then
		if yyvs11 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs11")
			end
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs11")
			end
			yyvsc11 := yyvsc11 + yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.resize (yyvs11, yyvsc11)
		end
	end
	yyvs11.put (yyval11, yyvsp11)
end
when 13 then
--|#line 557 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 557")
end

yyval11 := yyvs29.item (yyvsp29) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp29 := yyvsp29 -1
	if yyvsp11 >= yyvsc11 then
		if yyvs11 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs11")
			end
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs11")
			end
			yyvsc11 := yyvsc11 + yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.resize (yyvs11, yyvsc11)
		end
	end
	yyvs11.put (yyval11, yyvsp11)
end
when 14 then
--|#line 559 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 559")
end

yyval11 := yyvs32.item (yyvsp32) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp32 := yyvsp32 -1
	if yyvsp11 >= yyvsc11 then
		if yyvs11 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs11")
			end
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs11")
			end
			yyvsc11 := yyvsc11 + yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.resize (yyvs11, yyvsc11)
		end
	end
	yyvs11.put (yyval11, yyvsp11)
end
when 15 then
--|#line 561 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 561")
end

yyval11 := yyvs35.item (yyvsp35) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp11 >= yyvsc11 then
		if yyvs11 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs11")
			end
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs11")
			end
			yyvsc11 := yyvsc11 + yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.resize (yyvs11, yyvsc11)
		end
	end
	yyvs11.put (yyval11, yyvsp11)
end
when 16 then
--|#line 565 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 565")
end

create yyval12.make (yyvs2.item (yyvsp2), yyvs14.item (yyvsp14)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp12 >= yyvsc12 then
		if yyvs12 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs12")
			end
			create yyspecial_routines12
			yyvsc12 := yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.make (yyvsc12)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs12")
			end
			yyvsc12 := yyvsc12 + yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.resize (yyvs12, yyvsc12)
		end
	end
	yyvs12.put (yyval12, yyvsp12)
end
when 17 then
--|#line 571 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 571")
end

create yyval14.make_optional_rest (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 18 then
--|#line 575 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 575")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp14 := yyvsp14 + 1
	if yyvsp14 >= yyvsc14 then
		if yyvs14 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs14")
			end
			create yyspecial_routines14
			yyvsc14 := yyInitial_yyvs_size
			yyvs14 := yyspecial_routines14.make (yyvsc14)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs14")
			end
			yyvsc14 := yyvsc14 + yyInitial_yyvs_size
			yyvs14 := yyspecial_routines14.resize (yyvs14, yyvsc14)
		end
	end
	yyvs14.put (yyval14, yyvsp14)
end
when 19 then
--|#line 576 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 576")
end

create yyval14.make_optional_first (yyvs14.item (yyvsp14), yyvs13.item (yyvsp13)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 20 then
--|#line 580 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 580")
end

-- add_class_name ($2) 
							-- add_cluster_name ($4)
							create yyval13.make (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -3
	if yyvsp13 >= yyvsc13 then
		if yyvs13 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs13")
			end
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs13")
			end
			yyvsc13 := yyvsc13 + yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.resize (yyvs13, yyvsc13)
		end
	end
	yyvs13.put (yyval13, yyvsp13)
end
when 21 then
--|#line 588 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 588")
end

create yyval15.make (yyvs2.item (yyvsp2 - 2), yyvs17.item (yyvsp17), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs20.item (yyvsp20)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -3
	yyvsp17 := yyvsp17 -1
	yyvsp20 := yyvsp20 -1
	if yyvsp15 >= yyvsc15 then
		if yyvs15 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs15")
			end
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs15")
			end
			yyvsc15 := yyvsc15 + yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.resize (yyvs15, yyvsc15)
		end
	end
	yyvs15.put (yyval15, yyvsp15)
end
when 22 then
--|#line 597 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 597")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp17 := yyvsp17 + 1
	if yyvsp17 >= yyvsc17 then
		if yyvs17 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs17")
			end
			create yyspecial_routines17
			yyvsc17 := yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.make (yyvsc17)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs17")
			end
			yyvsc17 := yyvsc17 + yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.resize (yyvs17, yyvsc17)
		end
	end
	yyvs17.put (yyval17, yyvsp17)
end
when 23 then
--|#line 598 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 598")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
when 24 then
--|#line 602 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 602")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs17.put (yyval17, yyvsp17)
end
when 25 then
--|#line 606 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 606")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 26 then
--|#line 607 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 607")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 27 then
--|#line 611 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 611")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 28 then
--|#line 612 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 612")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 29 then
--|#line 616 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 616")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp20 := yyvsp20 + 1
	if yyvsp20 >= yyvsc20 then
		if yyvs20 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs20")
			end
			create yyspecial_routines20
			yyvsc20 := yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.make (yyvsc20)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs20")
			end
			yyvsc20 := yyvsc20 + yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.resize (yyvs20, yyvsc20)
		end
	end
	yyvs20.put (yyval20, yyvsp20)
end
when 30 then
--|#line 617 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 617")
end

yyval20 := yyvs20.item (yyvsp20) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs20.put (yyval20, yyvsp20)
end
when 31 then
--|#line 621 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 621")
end

yyval20 := yyvs20.item (yyvsp20) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs20.put (yyval20, yyvsp20)
end
when 32 then
--|#line 625 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 625")
end

create yyval20.make_optional_rest (yyvs19.item (yyvsp19), yyvs20.item (yyvsp20)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyvs20.put (yyval20, yyvsp20)
end
when 33 then
--|#line 629 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 629")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp20 := yyvsp20 + 1
	if yyvsp20 >= yyvsc20 then
		if yyvs20 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs20")
			end
			create yyspecial_routines20
			yyvsc20 := yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.make (yyvsc20)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs20")
			end
			yyvsc20 := yyvsc20 + yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.resize (yyvs20, yyvsc20)
		end
	end
	yyvs20.put (yyval20, yyvsp20)
end
when 34 then
--|#line 630 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 630")
end

create yyval20.make_optional_first (yyvs20.item (yyvsp20), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyvs20.put (yyval20, yyvsp20)
end
when 35 then
--|#line 634 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 634")
end

-- add_cluster_name ($2) 
						create yyval19.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -2
	if yyvsp19 >= yyvsc19 then
		if yyvs19 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs19")
			end
			create yyspecial_routines19
			yyvsc19 := yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.make (yyvsc19)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs19")
			end
			yyvsc19 := yyvsc19 + yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.resize (yyvs19, yyvsc19)
		end
	end
	yyvs19.put (yyval19, yyvsp19)
end
when 36 then
--|#line 640 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 640")
end

yyval2 := yyvs2.item (yyvsp2)
					 -- add_system_name($$)
				  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 37 then
--|#line 644 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 644")
end

yyval2 := yyvs2.item (yyvsp2)
					 -- add_system_name($$)
				  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 38 then
--|#line 650 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 650")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
when 39 then
--|#line 654 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 654")
end

create yyval17.make_optional_rest (yyvs16.item (yyvsp16), yyvs17.item (yyvsp17)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp16 := yyvsp16 -1
	yyvs17.put (yyval17, yyvsp17)
end
when 40 then
--|#line 658 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 658")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp17 := yyvsp17 + 1
	if yyvsp17 >= yyvsc17 then
		if yyvs17 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs17")
			end
			create yyspecial_routines17
			yyvsc17 := yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.make (yyvsc17)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs17")
			end
			yyvsc17 := yyvsc17 + yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.resize (yyvs17, yyvsc17)
		end
	end
	yyvs17.put (yyval17, yyvsp17)
end
when 41 then
--|#line 659 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 659")
end

create yyval17.make_optional_first (yyvs17.item (yyvsp17), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp16 := yyvsp16 -1
	yyvs17.put (yyval17, yyvsp17)
end
when 42 then
--|#line 663 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 663")
end

-- Index_clause
					  create yyval16.make_pair (yyvs2.item (yyvsp2), yyvs18.item (yyvsp18)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp18 := yyvsp18 -1
	if yyvsp16 >= yyvsc16 then
		if yyvs16 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs16")
			end
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs16")
			end
			yyvsc16 := yyvsc16 + yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
		end
	end
	yyvs16.put (yyval16, yyvsp16)
end
when 43 then
--|#line 668 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 668")
end

yyval18 := yyvs18.item (yyvsp18) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs18.put (yyval18, yyvsp18)
end
when 44 then
--|#line 672 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 672")
end

create yyval18.make_optional_rest (yyvs2.item (yyvsp2), yyvs18.item (yyvsp18)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs18.put (yyval18, yyvsp18)
end
when 45 then
--|#line 675 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 675")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp18 := yyvsp18 + 1
	if yyvsp18 >= yyvsc18 then
		if yyvs18 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs18")
			end
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs18")
			end
			yyvsc18 := yyvsc18 + yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.resize (yyvs18, yyvsc18)
		end
	end
	yyvs18.put (yyval18, yyvsp18)
end
when 46 then
--|#line 676 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 676")
end

create yyval18.make_optional_first (yyvs18.item (yyvsp18), yyvs2.item (yyvsp2)); 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs18.put (yyval18, yyvsp18)
end
when 47 then
--|#line 680 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 680")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 48 then
--|#line 684 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 684")
end

create yyval21.make (yyvs2.item (yyvsp2 - 2), yyvs17.item (yyvsp17), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs23.item (yyvsp23), yyvs20.item (yyvsp20)); cluster_charts.extend (yyval21) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp21 := yyvsp21 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -3
	yyvsp17 := yyvsp17 -1
	yyvsp23 := yyvsp23 -1
	yyvsp20 := yyvsp20 -1
	if yyvsp21 >= yyvsc21 then
		if yyvs21 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs21")
			end
			create yyspecial_routines21
			yyvsc21 := yyInitial_yyvs_size
			yyvs21 := yyspecial_routines21.make (yyvsc21)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs21")
			end
			yyvsc21 := yyvsc21 + yyInitial_yyvs_size
			yyvs21 := yyspecial_routines21.resize (yyvs21, yyvsc21)
		end
	end
	yyvs21.put (yyval21, yyvsp21)
end
when 49 then
--|#line 694 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 694")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp23 := yyvsp23 + 1
	if yyvsp23 >= yyvsc23 then
		if yyvs23 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs23")
			end
			create yyspecial_routines23
			yyvsc23 := yyInitial_yyvs_size
			yyvs23 := yyspecial_routines23.make (yyvsc23)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs23")
			end
			yyvsc23 := yyvsc23 + yyInitial_yyvs_size
			yyvs23 := yyspecial_routines23.resize (yyvs23, yyvsc23)
		end
	end
	yyvs23.put (yyval23, yyvsp23)
end
when 50 then
--|#line 695 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 695")
end

yyval23 := yyvs23.item (yyvsp23) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs23.put (yyval23, yyvsp23)
end
when 51 then
--|#line 699 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 699")
end

yyval23 := yyvs23.item (yyvsp23) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs23.put (yyval23, yyvsp23)
end
when 52 then
--|#line 703 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 703")
end

create yyval23.make_optional_rest (yyvs22.item (yyvsp22), yyvs23.item (yyvsp23)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 -1
	yyvs23.put (yyval23, yyvsp23)
end
when 53 then
--|#line 707 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 707")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp23 := yyvsp23 + 1
	if yyvsp23 >= yyvsc23 then
		if yyvs23 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs23")
			end
			create yyspecial_routines23
			yyvsc23 := yyInitial_yyvs_size
			yyvs23 := yyspecial_routines23.make (yyvsc23)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs23")
			end
			yyvsc23 := yyvsc23 + yyInitial_yyvs_size
			yyvs23 := yyspecial_routines23.resize (yyvs23, yyvsc23)
		end
	end
	yyvs23.put (yyval23, yyvsp23)
end
when 54 then
--|#line 708 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 708")
end

create yyval23.make_optional_first (yyvs23.item (yyvsp23), yyvs22.item (yyvsp22)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 -1
	yyvs23.put (yyval23, yyvsp23)
end
when 55 then
--|#line 712 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 712")
end

-- add_class_name ($2)
					 create yyval22.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -2
	if yyvsp22 >= yyvsc22 then
		if yyvs22 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs22")
			end
			create yyspecial_routines22
			yyvsc22 := yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.make (yyvsc22)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs22")
			end
			yyvsc22 := yyvsc22 + yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.resize (yyvs22, yyvsc22)
		end
	end
	yyvs22.put (yyval22, yyvsp22)
end
when 56 then
--|#line 718 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 718")
end

yyval2 := last_identifier
					  -- add_cluster_name($$)
					
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 57 then
--|#line 722 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 722")
end

yyval2 := yyvs2.item (yyvsp2)
					  -- add_cluster_name($$)
					
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 58 then
--|#line 726 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 726")
end

yyval2 := yyvs2.item (yyvsp2)
					  -- add_cluster_name($$)
					
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 59 then
--|#line 732 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 732")
end

create yyval24.make (yyvs2.item (yyvsp2 - 2), yyvs17.item (yyvsp17), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs25.item (yyvsp25), yyvs26.item (yyvsp26), yyvs27.item (yyvsp27), yyvs28.item (yyvsp28)); class_charts.extend (yyval24) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp24 := yyvsp24 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -3
	yyvsp17 := yyvsp17 -1
	yyvsp25 := yyvsp25 -1
	yyvsp26 := yyvsp26 -1
	yyvsp27 := yyvsp27 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp24 >= yyvsc24 then
		if yyvs24 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs24")
			end
			create yyspecial_routines24
			yyvsc24 := yyInitial_yyvs_size
			yyvs24 := yyspecial_routines24.make (yyvsc24)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs24")
			end
			yyvsc24 := yyvsc24 + yyInitial_yyvs_size
			yyvs24 := yyspecial_routines24.resize (yyvs24, yyvsc24)
		end
	end
	yyvs24.put (yyval24, yyvsp24)
end
when 60 then
--|#line 744 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 744")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp25 := yyvsp25 + 1
	if yyvsp25 >= yyvsc25 then
		if yyvs25 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs25")
			end
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs25")
			end
			yyvsc25 := yyvsc25 + yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.resize (yyvs25, yyvsc25)
		end
	end
	yyvs25.put (yyval25, yyvsp25)
end
when 61 then
--|#line 745 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 745")
end

yyval25 := yyvs25.item (yyvsp25) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs25.put (yyval25, yyvsp25)
end
when 62 then
--|#line 749 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 749")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp26 := yyvsp26 + 1
	if yyvsp26 >= yyvsc26 then
		if yyvs26 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs26")
			end
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs26")
			end
			yyvsc26 := yyvsc26 + yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.resize (yyvs26, yyvsc26)
		end
	end
	yyvs26.put (yyval26, yyvsp26)
end
when 63 then
--|#line 750 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 750")
end

yyval26 := yyvs26.item (yyvsp26) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs26.put (yyval26, yyvsp26)
end
when 64 then
--|#line 754 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 754")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp27 := yyvsp27 + 1
	if yyvsp27 >= yyvsc27 then
		if yyvs27 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs27")
			end
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs27")
			end
			yyvsc27 := yyvsc27 + yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.resize (yyvs27, yyvsc27)
		end
	end
	yyvs27.put (yyval27, yyvsp27)
end
when 65 then
--|#line 755 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 755")
end

yyval27 := yyvs27.item (yyvsp27) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
when 66 then
--|#line 759 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 759")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp28 := yyvsp28 + 1
	if yyvsp28 >= yyvsc28 then
		if yyvs28 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs28")
			end
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs28")
			end
			yyvsc28 := yyvsc28 + yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.resize (yyvs28, yyvsc28)
		end
	end
	yyvs28.put (yyval28, yyvsp28)
end
when 67 then
--|#line 760 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 760")
end

yyval28 := yyvs28.item (yyvsp28) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs28.put (yyval28, yyvsp28)
end
when 68 then
--|#line 764 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 764")
end

create yyval26.make_from_string_list (yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs26.put (yyval26, yyvsp26)
end
when 69 then
--|#line 768 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 768")
end

create yyval26.make_optional_rest (yyvs2.item (yyvsp2), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs26.put (yyval26, yyvsp26)
end
when 70 then
--|#line 772 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 772")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp26 := yyvsp26 + 1
	if yyvsp26 >= yyvsc26 then
		if yyvs26 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs26")
			end
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs26")
			end
			yyvsc26 := yyvsc26 + yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.resize (yyvs26, yyvsc26)
		end
	end
	yyvs26.put (yyval26, yyvsp26)
end
when 71 then
--|#line 773 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 773")
end

create yyval26.make_optional_first(yyvs26.item (yyvsp26), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs26.put (yyval26, yyvsp26)
end
when 72 then
--|#line 777 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 777")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 73 then
--|#line 780 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 780")
end

create yyval27.make_from_string_list (yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs27.put (yyval27, yyvsp27)
end
when 74 then
--|#line 784 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 784")
end

create yyval27.make_optional_rest (yyvs2.item (yyvsp2), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs27.put (yyval27, yyvsp27)
end
when 75 then
--|#line 788 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 788")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp27 := yyvsp27 + 1
	if yyvsp27 >= yyvsc27 then
		if yyvs27 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs27")
			end
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs27")
			end
			yyvsc27 := yyvsc27 + yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.resize (yyvs27, yyvsc27)
		end
	end
	yyvs27.put (yyval27, yyvsp27)
end
when 76 then
--|#line 789 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 789")
end

create yyval27.make_optional_first (yyvs27.item (yyvsp27), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs27.put (yyval27, yyvsp27)
end
when 77 then
--|#line 793 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 793")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 78 then
--|#line 796 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 796")
end

create yyval28.make_from_string_list (yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs28.put (yyval28, yyvsp28)
end
when 79 then
--|#line 800 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 800")
end

create yyval28.make_optional_rest (yyvs2.item (yyvsp2), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs28.put (yyval28, yyvsp28)
end
when 80 then
--|#line 804 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 804")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp28 := yyvsp28 + 1
	if yyvsp28 >= yyvsc28 then
		if yyvs28 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs28")
			end
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs28")
			end
			yyvsc28 := yyvsc28 + yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.resize (yyvs28, yyvsc28)
		end
	end
	yyvs28.put (yyval28, yyvsp28)
end
when 81 then
--|#line 805 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 805")
end

create yyval28.make_optional_first (yyvs28.item (yyvsp28), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs28.put (yyval28, yyvsp28)
end
when 82 then
--|#line 809 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 809")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 83 then
--|#line 821 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 821")
end

yyval25 := yyvs25.item (yyvsp25) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs25.put (yyval25, yyvsp25)
end
when 84 then
--|#line 825 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 825")
end

create yyval25.make_optional_rest (yyvs2.item (yyvsp2), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs25.put (yyval25, yyvsp25)
end
when 85 then
--|#line 829 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 829")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp25 := yyvsp25 + 1
	if yyvsp25 >= yyvsc25 then
		if yyvs25 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs25")
			end
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs25")
			end
			yyvsc25 := yyvsc25 + yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.resize (yyvs25, yyvsc25)
		end
	end
	yyvs25.put (yyval25, yyvsp25)
end
when 86 then
--|#line 830 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 830")
end

create yyval25.make_optional_first (yyvs25.item (yyvsp25), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs25.put (yyval25, yyvsp25)
end
when 87 then
--|#line 834 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 834")
end

yyval2 := last_identifier
					-- add_class_name($$)
				 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 88 then
--|#line 838 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 838")
end

yyval2 := yyvs2.item (yyvsp2)
					-- add_class_name($$)
				 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 89 then
--|#line 842 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 842")
end

yyval2 := yyvs2.item (yyvsp2)
					-- add_class_name($$)
				 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 90 then
--|#line 848 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 848")
end

create yyval29.make (yyvs2.item (yyvsp2 - 3), yyvs2.item (yyvsp2 - 2), yyvs17.item (yyvsp17), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs31.item (yyvsp31)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -4
	yyvsp17 := yyvsp17 -1
	yyvsp31 := yyvsp31 -1
	if yyvsp29 >= yyvsc29 then
		if yyvs29 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs29")
			end
			create yyspecial_routines29
			yyvsc29 := yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.make (yyvsc29)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs29")
			end
			yyvsc29 := yyvsc29 + yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.resize (yyvs29, yyvsc29)
		end
	end
	yyvs29.put (yyval29, yyvsp29)
end
when 91 then
--|#line 858 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 858")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 92 then
--|#line 859 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 859")
end

yyval2 := "INCOMING" 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 93 then
--|#line 861 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 861")
end

yyval2 := "OUTGOING" 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 94 then
--|#line 865 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 865")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp31 := yyvsp31 + 1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
when 95 then
--|#line 866 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 866")
end

yyval31 := yyvs31.item (yyvsp31) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs31.put (yyval31, yyvsp31)
end
when 96 then
--|#line 870 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 870")
end

yyval31 := yyvs31.item (yyvsp31) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs31.put (yyval31, yyvsp31)
end
when 97 then
--|#line 874 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 874")
end

create yyval31.make_optional_rest (yyvs30.item (yyvsp30), yyvs31.item (yyvsp31)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp30 := yyvsp30 -1
	yyvs31.put (yyval31, yyvsp31)
end
when 98 then
--|#line 878 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 878")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp31 := yyvsp31 + 1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
when 99 then
--|#line 879 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 879")
end

create yyval31.make_optional_first (yyvs31.item (yyvsp31), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp30 := yyvsp30 -1
	yyvs31.put (yyval31, yyvsp31)
end
when 100 then
--|#line 883 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 883")
end

create yyval30.make (yyvs2.item (yyvsp2), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
when 101 then
--|#line 887 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 887")
end

create yyval32.make (yyvs2.item (yyvsp2 - 2), yyvs17.item (yyvsp17), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs34.item (yyvsp34)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -3
	yyvsp17 := yyvsp17 -1
	yyvsp34 := yyvsp34 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
when 102 then
--|#line 896 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 896")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp34 := yyvsp34 + 1
	if yyvsp34 >= yyvsc34 then
		if yyvs34 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs34")
			end
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs34")
			end
			yyvsc34 := yyvsc34 + yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.resize (yyvs34, yyvsc34)
		end
	end
	yyvs34.put (yyval34, yyvsp34)
end
when 103 then
--|#line 897 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 897")
end

yyval34 := yyvs34.item (yyvsp34) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs34.put (yyval34, yyvsp34)
end
when 104 then
--|#line 901 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 901")
end

yyval34 := yyvs34.item (yyvsp34) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs34.put (yyval34, yyvsp34)
end
when 105 then
--|#line 905 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 905")
end

create yyval34.make_optional_rest (yyvs33.item (yyvsp33), yyvs34.item (yyvsp34)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 -1
	yyvs34.put (yyval34, yyvsp34)
end
when 106 then
--|#line 909 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 909")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp34 := yyvsp34 + 1
	if yyvsp34 >= yyvsc34 then
		if yyvs34 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs34")
			end
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs34")
			end
			yyvsc34 := yyvsc34 + yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.resize (yyvs34, yyvsc34)
		end
	end
	yyvs34.put (yyval34, yyvsp34)
end
when 107 then
--|#line 910 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 910")
end

create yyval34.make_optional_first (yyvs34.item (yyvsp34), yyvs33.item (yyvsp33)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 -1
	yyvs34.put (yyval34, yyvsp34)
end
when 108 then
--|#line 914 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 914")
end

create yyval33.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -2
	if yyvsp33 >= yyvsc33 then
		if yyvs33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyvs33.put (yyval33, yyvsp33)
end
when 109 then
--|#line 919 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 919")
end

create yyval35.make (yyvs2.item (yyvsp2 - 2), yyvs17.item (yyvsp17), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs37.item (yyvsp37)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -3
	yyvsp17 := yyvsp17 -1
	yyvsp37 := yyvsp37 -1
	if yyvsp35 >= yyvsc35 then
		if yyvs35 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs35")
			end
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs35")
			end
			yyvsc35 := yyvsc35 + yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.resize (yyvs35, yyvsc35)
		end
	end
	yyvs35.put (yyval35, yyvsp35)
end
when 110 then
--|#line 928 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 928")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp37 := yyvsp37 + 1
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
when 111 then
--|#line 929 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 929")
end

create yyval37.make_optional_first (yyvs37.item (yyvsp37), yyvs36.item (yyvsp36)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp36 := yyvsp36 -1
	yyvs37.put (yyval37, yyvsp37)
end
when 112 then
--|#line 933 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 933")
end

create yyval36.make (yyvs2.item (yyvsp2), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
when 113 then
--|#line 939 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 939")
end

io.put_string ("STATIC DIAGRAM!"); create yyval38.make_static_diagram (yyvs2.item (yyvsp2), yyvs39.item (yyvsp39), yyvs42.item (yyvsp42)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	yyvsp39 := yyvsp39 -1
	yyvsp42 := yyvsp42 -1
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
when 114 then
--|#line 948 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 948")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 115 then
--|#line 949 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 949")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 116 then
--|#line 953 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 953")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 117 then
--|#line 955 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 955")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 118 then
--|#line 957 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 957")
end

yyval2 := yyvs4.item (yyvsp4).out 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 119 then
--|#line 961 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 961")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp39 := yyvsp39 + 1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 120 then
--|#line 962 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 962")
end

yyval39 := yyvs39.item (yyvsp39) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs39.put (yyval39, yyvsp39)
end
when 121 then
--|#line 968 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 968")
end

create yyval39.make_list (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp39 := yyvsp39 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 122 then
--|#line 972 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 972")
end

create yyval2.make_from_string (yyvs2.item (yyvsp2 - 1))
										yyval2.append_string (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 123 then
--|#line 977 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 977")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 124 then
--|#line 978 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 978")
end

create yyval2.make_from_string (yyvs2.item (yyvsp2));
									yyval2.prepend_string (yyvs2.item (yyvsp2 - 1)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 125 then
--|#line 983 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 983")
end

yyval2 := last_string_constant 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 126 then
--|#line 994 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 994")
end

yyval42 := yyvs42.item (yyvsp42) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs42.put (yyval42, yyvsp42)
end
when 127 then
--|#line 998 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 998")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp42 := yyvsp42 + 1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 128 then
--|#line 999 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 999")
end

create yyval42.make_optional_first (yyvs42.item (yyvsp42), yyvs40.item (yyvsp40)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp40 := yyvsp40 -1
	yyvs42.put (yyval42, yyvsp42)
end
when 129 then
--|#line 1003 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1003")
end

yyval40 := yyvs43.item (yyvsp43) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp40 := yyvsp40 + 1
	yyvsp43 := yyvsp43 -1
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 130 then
--|#line 1005 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1005")
end

yyval40 := yyvs44.item (yyvsp44) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp40 := yyvsp40 + 1
	yyvsp44 := yyvsp44 -1
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 131 then
--|#line 1007 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1007")
end

yyval40 := yyvs45.item (yyvsp45) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp40 := yyvsp40 + 1
	yyvsp45 := yyvsp45 -1
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 132 then
--|#line 1009 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1009")
end

yyval40 := yyvs41.item (yyvsp41) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp40 := yyvsp40 + 1
	yyvsp41 := yyvsp41 -1
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 133 then
--|#line 1012 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1012")
end

create yyval41.make_unspecified 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
when 134 then
--|#line 1016 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1016")
end

create yyval43.make (yyvs2.item (yyvsp2), yyvs6.item (yyvsp6), yyvs39.item (yyvsp39), yyvs42.item (yyvsp42))
					  -- add_cluster_name ($2)
					
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvsp6 := yyvsp6 -1
	yyvsp39 := yyvsp39 -1
	yyvsp42 := yyvsp42 -1
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
when 135 then
--|#line 1025 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1025")
end

yyval6 := False 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp6 := yyvsp6 + 1
	if yyvsp6 >= yyvsc6 then
		if yyvs6 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs6")
			end
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs6")
			end
			yyvsc6 := yyvsc6 + yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
		end
	end
	yyvs6.put (yyval6, yyvsp6)
end
when 136 then
--|#line 1027 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1027")
end

yyval6 := True 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 then
		if yyvs6 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs6")
			end
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs6")
			end
			yyvsc6 := yyvsc6 + yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
		end
	end
	yyvs6.put (yyval6, yyvsp6)
end
when 137 then
--|#line 1031 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1031")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp42 := yyvsp42 + 1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 138 then
--|#line 1032 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1032")
end

yyval42 := yyvs42.item (yyvsp42) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs42.put (yyval42, yyvsp42)
end
when 139 then
--|#line 1036 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1036")
end

yyval42 := yyvs42.item (yyvsp42) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs42.put (yyval42, yyvsp42)
end
when 140 then
--|#line 1040 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1040")
end

create yyval44.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs49.item (yyvsp49), yyvs6.item (yyvsp6 - 2), yyvs6.item (yyvsp6 - 1), yyvs6.item (yyvsp6), yyvs39.item (yyvsp39), yyvs63.item (yyvsp63))
					-- add_class_name ($3)
				 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp44 := yyvsp44 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	yyvsp49 := yyvsp49 -1
	yyvsp6 := yyvsp6 -3
	yyvsp39 := yyvsp39 -1
	yyvsp63 := yyvsp63 -1
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
when 141 then
--|#line 1053 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1053")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 142 then
--|#line 1054 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1054")
end

yyval2 := "ROOT" 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 143 then
--|#line 1056 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1056")
end

yyval2 := "DEFERRED" 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 144 then
--|#line 1058 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1058")
end

yyval2 := "EFFECTIVE" 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 145 then
--|#line 1062 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1062")
end

yyval6 := False 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp6 := yyvsp6 + 1
	if yyvsp6 >= yyvsc6 then
		if yyvs6 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs6")
			end
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs6")
			end
			yyvsc6 := yyvsc6 + yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
		end
	end
	yyvs6.put (yyval6, yyvsp6)
end
when 146 then
--|#line 1064 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1064")
end

yyval6 := True 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 then
		if yyvs6 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs6")
			end
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs6")
			end
			yyvsc6 := yyvsc6 + yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
		end
	end
	yyvs6.put (yyval6, yyvsp6)
end
when 147 then
--|#line 1068 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1068")
end

yyval6 := False 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp6 := yyvsp6 + 1
	if yyvsp6 >= yyvsc6 then
		if yyvs6 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs6")
			end
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs6")
			end
			yyvsc6 := yyvsc6 + yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
		end
	end
	yyvs6.put (yyval6, yyvsp6)
end
when 148 then
--|#line 1070 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1070")
end

yyval6 := True 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 then
		if yyvs6 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs6")
			end
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs6")
			end
			yyvsc6 := yyvsc6 + yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
		end
	end
	yyvs6.put (yyval6, yyvsp6)
end
when 149 then
--|#line 1074 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1074")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp63 := yyvsp63 + 1
	if yyvsp63 >= yyvsc63 then
		if yyvs63 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs63")
			end
			create yyspecial_routines63
			yyvsc63 := yyInitial_yyvs_size
			yyvs63 := yyspecial_routines63.make (yyvsc63)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs63")
			end
			yyvsc63 := yyvsc63 + yyInitial_yyvs_size
			yyvs63 := yyspecial_routines63.resize (yyvs63, yyvsc63)
		end
	end
	yyvs63.put (yyval63, yyvsp63)
end
when 150 then
--|#line 1075 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1075")
end

yyval63 := yyvs63.item (yyvsp63) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs63.put (yyval63, yyvsp63)
end
when 151 then
--|#line 1079 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1079")
end

yyval45 := yyvs46.item (yyvsp46) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp46 := yyvsp46 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 152 then
--|#line 1081 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1081")
end

yyval45 := yyvs47.item (yyvsp47) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp47 := yyvsp47 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 153 then
--|#line 1085 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1085")
end

create yyval46.make (yyvs7.item (yyvsp7 - 1), yyvs4.item (yyvsp4), yyvs7.item (yyvsp7), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp46 := yyvsp46 + 1
	yyvsp7 := yyvsp7 -2
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp46 >= yyvsc46 then
		if yyvs46 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs46")
			end
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs46")
			end
			yyvsc46 := yyvsc46 + yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.resize (yyvs46, yyvsc46)
		end
	end
	yyvs46.put (yyval46, yyvsp46)
end
when 154 then
--|#line 1092 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1092")
end

yyval4 := 0 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp4 := yyvsp4 + 1
	if yyvsp4 >= yyvsc4 then
		if yyvs4 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs4")
			end
			create yyspecial_routines4
			yyvsc4 := yyInitial_yyvs_size
			yyvs4 := yyspecial_routines4.make (yyvsc4)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs4")
			end
			yyvsc4 := yyvsc4 + yyInitial_yyvs_size
			yyvs4 := yyspecial_routines4.resize (yyvs4, yyvsc4)
		end
	end
	yyvs4.put (yyval4, yyvsp4)
end
when 155 then
--|#line 1094 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1094")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs4.put (yyval4, yyvsp4)
end
when 156 then
--|#line 1098 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1098")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 157 then
--|#line 1099 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1099")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 158 then
--|#line 1103 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1103")
end

create yyval47.make (yyvs7.item (yyvsp7 - 1), yyvs55.item (yyvsp55), yyvs53.item (yyvsp53), yyvs7.item (yyvsp7), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp47 := yyvsp47 + 1
	yyvsp7 := yyvsp7 -2
	yyvsp1 := yyvsp1 -1
	yyvsp55 := yyvsp55 -1
	yyvsp53 := yyvsp53 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp47 >= yyvsc47 then
		if yyvs47 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs47")
			end
			create yyspecial_routines47
			yyvsc47 := yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.make (yyvsc47)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs47")
			end
			yyvsc47 := yyvsc47 + yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.resize (yyvs47, yyvsc47)
		end
	end
	yyvs47.put (yyval47, yyvsp47)
end
when 159 then
--|#line 1111 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1111")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp53 := yyvsp53 + 1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
when 160 then
--|#line 1112 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1112")
end

yyval53 := yyvs53.item (yyvsp53) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs53.put (yyval53, yyvsp53)
end
when 161 then
--|#line 1116 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1116")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp55 := yyvsp55 + 1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
when 162 then
--|#line 1117 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1117")
end

yyval55 := yyvs55.item (yyvsp55) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs55.put (yyval55, yyvsp55)
end
when 163 then
--|#line 1121 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1121")
end

yyval55 := yyvs55.item (yyvsp55) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs55.put (yyval55, yyvsp55)
end
when 164 then
--|#line 1125 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1125")
end

yyval55 := yyvs55.item (yyvsp55) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs55.put (yyval55, yyvsp55)
end
when 165 then
--|#line 1127 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1127")
end

create yyval55.make_undefined (yyvs4.item (yyvsp4)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
when 166 then
--|#line 1131 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1131")
end

yyval55 := yyvs55.item (yyvsp55) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs55.put (yyval55, yyvsp55)
end
when 167 then
--|#line 1135 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1135")
end

create yyval55.make_optional_rest (yyvs54.item (yyvsp54), yyvs55.item (yyvsp55)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp54 := yyvsp54 -1
	yyvs55.put (yyval55, yyvsp55)
end
when 168 then
--|#line 1139 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1139")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp55 := yyvsp55 + 1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
when 169 then
--|#line 1140 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1140")
end

create yyval55.make_optional_first (yyvs55.item (yyvsp55), yyvs54.item (yyvsp54)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp54 := yyvsp54 -1
	yyvs55.put (yyval55, yyvsp55)
end
when 170 then
--|#line 1144 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1144")
end

create yyval54.make_feature (yyvs68.item (yyvsp68)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp68 := yyvsp68 -1
	if yyvsp54 >= yyvsc54 then
		if yyvs54 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs54")
			end
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs54")
			end
			yyvsc54 := yyvsc54 + yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.resize (yyvs54, yyvsc54)
		end
	end
	yyvs54.put (yyval54, yyvsp54)
end
when 171 then
--|#line 1146 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1146")
end

create yyval54.make_supplier (yyvs56.item (yyvsp56)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp56 := yyvsp56 -1
	if yyvsp54 >= yyvsc54 then
		if yyvs54 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs54")
			end
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs54")
			end
			yyvsc54 := yyvsc54 + yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.resize (yyvs54, yyvsc54)
		end
	end
	yyvs54.put (yyval54, yyvsp54)
end
when 172 then
--|#line 1148 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1148")
end

create yyval54.make_parent (yyvs59.item (yyvsp59)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp59 := yyvsp59 -1
	if yyvsp54 >= yyvsc54 then
		if yyvs54 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs54")
			end
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs54")
			end
			yyvsc54 := yyvsc54 + yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.resize (yyvs54, yyvsc54)
		end
	end
	yyvs54.put (yyval54, yyvsp54)
end
when 173 then
--|#line 1152 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1152")
end

create yyval56.make (yyvs57.item (yyvsp57), yyvs58.item (yyvsp58)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp56 := yyvsp56 + 1
	yyvsp57 := yyvsp57 -1
	yyvsp58 := yyvsp58 -1
	if yyvsp56 >= yyvsc56 then
		if yyvs56 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs56")
			end
			create yyspecial_routines56
			yyvsc56 := yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.make (yyvsc56)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs56")
			end
			yyvsc56 := yyvsc56 + yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.resize (yyvs56, yyvsc56)
		end
	end
	yyvs56.put (yyval56, yyvsp56)
end
when 174 then
--|#line 1156 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1156")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp57 := yyvsp57 + 1
	if yyvsp57 >= yyvsc57 then
		if yyvs57 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs57")
			end
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs57")
			end
			yyvsc57 := yyvsc57 + yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.resize (yyvs57, yyvsc57)
		end
	end
	yyvs57.put (yyval57, yyvsp57)
end
when 175 then
--|#line 1157 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1157")
end

yyval57 := yyvs57.item (yyvsp57) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs57.put (yyval57, yyvsp57)
end
when 176 then
--|#line 1161 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1161")
end

create yyval57.make_list (yyvs68.item (yyvsp68)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp68 := yyvsp68 -1
	if yyvsp57 >= yyvsc57 then
		if yyvs57 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs57")
			end
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs57")
			end
			yyvsc57 := yyvsc57 + yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.resize (yyvs57, yyvsc57)
		end
	end
	yyvs57.put (yyval57, yyvsp57)
end
when 177 then
--|#line 1163 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1163")
end

yyval57 := yyvs57.item (yyvsp57) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs57.put (yyval57, yyvsp57)
end
when 178 then
--|#line 1167 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1167")
end

yyval57 := yyvs57.item (yyvsp57) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs57.put (yyval57, yyvsp57)
end
when 179 then
--|#line 1171 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1171")
end

create yyval59.make (yyvs58.item (yyvsp58)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp59 := yyvsp59 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp58 := yyvsp58 -1
	if yyvsp59 >= yyvsc59 then
		if yyvs59 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs59")
			end
			create yyspecial_routines59
			yyvsc59 := yyInitial_yyvs_size
			yyvs59 := yyspecial_routines59.make (yyvsc59)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs59")
			end
			yyvsc59 := yyvsc59 + yyInitial_yyvs_size
			yyvs59 := yyspecial_routines59.resize (yyvs59, yyvsc59)
		end
	end
	yyvs59.put (yyval59, yyvsp59)
end
when 180 then
--|#line 1175 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1175")
end

create yyval58.make_direct (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp58 >= yyvsc58 then
		if yyvs58 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs58")
			end
			create yyspecial_routines58
			yyvsc58 := yyInitial_yyvs_size
			yyvs58 := yyspecial_routines58.make (yyvsc58)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs58")
			end
			yyvsc58 := yyvsc58 + yyInitial_yyvs_size
			yyvs58 := yyspecial_routines58.resize (yyvs58, yyvsc58)
		end
	end
	yyvs58.put (yyval58, yyvsp58)
end
when 181 then
--|#line 1177 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1177")
end

create yyval58.make_indirect (yyvs60.item (yyvsp60)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp60 := yyvsp60 -1
	if yyvsp58 >= yyvsc58 then
		if yyvs58 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs58")
			end
			create yyspecial_routines58
			yyvsc58 := yyInitial_yyvs_size
			yyvs58 := yyspecial_routines58.make (yyvsc58)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs58")
			end
			yyvsc58 := yyvsc58 + yyInitial_yyvs_size
			yyvs58 := yyspecial_routines58.resize (yyvs58, yyvsc58)
		end
	end
	yyvs58.put (yyval58, yyvsp58)
end
when 182 then
--|#line 1187 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1187")
end

create yyval60.make (yyvs2.item (yyvsp2), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp60 := yyvsp60 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp62 := yyvsp62 -1
	if yyvsp60 >= yyvsc60 then
		if yyvs60 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs60")
			end
			create yyspecial_routines60
			yyvsc60 := yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.make (yyvsc60)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs60")
			end
			yyvsc60 := yyvsc60 + yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.resize (yyvs60, yyvsc60)
		end
	end
	yyvs60.put (yyval60, yyvsp60)
end
when 183 then
--|#line 1191 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1191")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 184 then
--|#line 1192 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1192")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 185 then
--|#line 1199 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1199")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs62.put (yyval62, yyvsp62)
end
when 186 then
--|#line 1203 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1203")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
when 187 then
--|#line 1207 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1207")
end

create yyval62.make_optional_rest (yyvs61.item (yyvsp61), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp61 := yyvsp61 -1
	yyvs62.put (yyval62, yyvsp62)
end
when 188 then
--|#line 1211 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1211")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp62 := yyvsp62 + 1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
when 189 then
--|#line 1212 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1212")
end

create yyval62.make_optional_first (yyvs62.item (yyvsp62), yyvs61.item (yyvsp61)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp61 := yyvsp61 -1
	yyvs62.put (yyval62, yyvsp62)
end
when 190 then
--|#line 1216 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1216")
end

create yyval61.make_ellipses 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp61 := yyvsp61 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp61 >= yyvsc61 then
		if yyvs61 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs61")
			end
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs61")
			end
			yyvsc61 := yyvsc61 + yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.resize (yyvs61, yyvsc61)
		end
	end
	yyvs61.put (yyval61, yyvsp61)
end
when 191 then
--|#line 1218 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1218")
end

create yyval61.make (yyvs60.item (yyvsp60)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp61 := yyvsp61 + 1
	yyvsp60 := yyvsp60 -1
	if yyvsp61 >= yyvsc61 then
		if yyvs61 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs61")
			end
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs61")
			end
			yyvsc61 := yyvsc61 + yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.resize (yyvs61, yyvsc61)
		end
	end
	yyvs61.put (yyval61, yyvsp61)
end
when 192 then
--|#line 1220 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1220")
end

create yyval61.make_with_class_name (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp61 := yyvsp61 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp61 >= yyvsc61 then
		if yyvs61 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs61")
			end
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs61")
			end
			yyvsc61 := yyvsc61 + yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.resize (yyvs61, yyvsc61)
		end
	end
	yyvs61.put (yyval61, yyvsp61)
end
when 193 then
--|#line 1222 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1222")
end

create yyval61.make_with_formal_generic_name (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp61 := yyvsp61 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp61 >= yyvsc61 then
		if yyvs61 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs61")
			end
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs61")
			end
			yyvsc61 := yyvsc61 + yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.resize (yyvs61, yyvsc61)
		end
	end
	yyvs61.put (yyval61, yyvsp61)
end
when 194 then
--|#line 1227 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1227")
end

create yyval53.make 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
when 195 then
--|#line 1229 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1229")
end

create yyval53.make_aggregate 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
when 196 then
--|#line 1231 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1231")
end

create yyval53.make_shared (yyvs4.item (yyvsp4)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
when 197 then
--|#line 1236 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1236")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs4.put (yyval4, yyvsp4)
end
when 198 then
--|#line 1240 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1240")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs7.put (yyval7, yyvsp7)
end
when 199 then
--|#line 1244 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1244")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs7.put (yyval7, yyvsp7)
end
when 200 then
--|#line 1248 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1248")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs7.put (yyval7, yyvsp7)
end
when 201 then
--|#line 1252 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1252")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs7.put (yyval7, yyvsp7)
end
when 202 then
--|#line 1257 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1257")
end

create yyval7.make_from_components (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp7 := yyvsp7 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp7 >= yyvsc7 then
		if yyvs7 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs7")
			end
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs7")
			end
			yyvsc7 := yyvsc7 + yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.resize (yyvs7, yyvsc7)
		end
	end
	yyvs7.put (yyval7, yyvsp7)
end
when 203 then
--|#line 1261 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1261")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 204 then
--|#line 1262 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1262")
end

create yyval2.make_from_string (yyvs2.item (yyvsp2))
 										  yyval2.prepend_string (yyvs2.item (yyvsp2 - 1)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 205 then
--|#line 1267 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1267")
end

create yyval2.make_from_string (yyvs2.item (yyvsp2))
 						 yyval2.append_character ('.') 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 206 then
--|#line 1272 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1272")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 207 then
--|#line 1274 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1274")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 208 then
--|#line 1278 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1278")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs4.put (yyval4, yyvsp4)
end
when 209 then
--|#line 1282 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1282")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 210 then
--|#line 1288 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1288")
end

create yyval63.make (yyvs17.item (yyvsp17), yyvs65.item (yyvsp65), yyvs66.item (yyvsp66), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp63 := yyvsp63 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp65 := yyvsp65 -1
	yyvsp66 := yyvsp66 -1
	yyvsp64 := yyvsp64 -1
	yyvsp1 := yyvsp1 -1
	if yyvsp63 >= yyvsc63 then
		if yyvs63 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs63")
			end
			create yyspecial_routines63
			yyvsc63 := yyInitial_yyvs_size
			yyvs63 := yyspecial_routines63.make (yyvsc63)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs63")
			end
			yyvsc63 := yyvsc63 + yyInitial_yyvs_size
			yyvs63 := yyspecial_routines63.resize (yyvs63, yyvsc63)
		end
	end
	yyvs63.put (yyval63, yyvsp63)
end
when 211 then
--|#line 1296 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1296")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp65 := yyvsp65 + 1
	if yyvsp65 >= yyvsc65 then
		if yyvs65 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs65")
			end
			create yyspecial_routines65
			yyvsc65 := yyInitial_yyvs_size
			yyvs65 := yyspecial_routines65.make (yyvsc65)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs65")
			end
			yyvsc65 := yyvsc65 + yyInitial_yyvs_size
			yyvs65 := yyspecial_routines65.resize (yyvs65, yyvsc65)
		end
	end
	yyvs65.put (yyval65, yyvsp65)
end
when 212 then
--|#line 1297 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1297")
end

yyval65 := yyvs65.item (yyvsp65) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs65.put (yyval65, yyvsp65)
end
when 213 then
--|#line 1302 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1302")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp64 := yyvsp64 + 1
	if yyvsp64 >= yyvsc64 then
		if yyvs64 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs64")
			end
			create yyspecial_routines64
			yyvsc64 := yyInitial_yyvs_size
			yyvs64 := yyspecial_routines64.make (yyvsc64)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs64")
			end
			yyvsc64 := yyvsc64 + yyInitial_yyvs_size
			yyvs64 := yyspecial_routines64.resize (yyvs64, yyvsc64)
		end
	end
	yyvs64.put (yyval64, yyvsp64)
end
when 214 then
--|#line 1303 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1303")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs64.put (yyval64, yyvsp64)
end
when 215 then
--|#line 1308 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1308")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs64.put (yyval64, yyvsp64)
end
when 216 then
--|#line 1312 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1312")
end

yyval65 := yyvs65.item (yyvsp65) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs65.put (yyval65, yyvsp65)
end
when 217 then
--|#line 1316 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1316")
end

create yyval65.make_optional_rest (yyvs50.item (yyvsp50), yyvs65.item (yyvsp65)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 -1
	yyvs65.put (yyval65, yyvsp65)
end
when 218 then
--|#line 1320 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1320")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp65 := yyvsp65 + 1
	if yyvsp65 >= yyvsc65 then
		if yyvs65 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs65")
			end
			create yyspecial_routines65
			yyvsc65 := yyInitial_yyvs_size
			yyvs65 := yyspecial_routines65.make (yyvsc65)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs65")
			end
			yyvsc65 := yyvsc65 + yyInitial_yyvs_size
			yyvs65 := yyspecial_routines65.resize (yyvs65, yyvsc65)
		end
	end
	yyvs65.put (yyval65, yyvsp65)
end
when 219 then
--|#line 1321 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1321")
end

create yyval65.make_optional_first (yyvs65.item (yyvsp65), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp50 := yyvsp50 -1
	yyvs65.put (yyval65, yyvsp65)
end
when 220 then
--|#line 1326 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1326")
end

yyval66 := yyvs66.item (yyvsp66) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs66.put (yyval66, yyvsp66)
end
when 221 then
--|#line 1329 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1329")
end

create yyval66.make_optional_rest (yyvs67.item (yyvsp67), yyvs66.item (yyvsp66)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp67 := yyvsp67 -1
	yyvs66.put (yyval66, yyvsp66)
end
when 222 then
--|#line 1333 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1333")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp66 := yyvsp66 + 1
	if yyvsp66 >= yyvsc66 then
		if yyvs66 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs66")
			end
			create yyspecial_routines66
			yyvsc66 := yyInitial_yyvs_size
			yyvs66 := yyspecial_routines66.make (yyvsc66)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs66")
			end
			yyvsc66 := yyvsc66 + yyInitial_yyvs_size
			yyvs66 := yyspecial_routines66.resize (yyvs66, yyvsc66)
		end
	end
	yyvs66.put (yyval66, yyvsp66)
end
when 223 then
--|#line 1334 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1334")
end

create yyval66.make_optional_first (yyvs66.item (yyvsp66), yyvs67.item (yyvsp67)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp67 := yyvsp67 -1
	yyvs66.put (yyval66, yyvsp66)
end
when 224 then
--|#line 1338 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1338")
end

create yyval67.make (yyvs25.item (yyvsp25), yyvs39.item (yyvsp39), yyvs77.item (yyvsp77)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp67 := yyvsp67 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyvsp39 := yyvsp39 -1
	yyvsp77 := yyvsp77 -1
	if yyvsp67 >= yyvsc67 then
		if yyvs67 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs67")
			end
			create yyspecial_routines67
			yyvsc67 := yyInitial_yyvs_size
			yyvs67 := yyspecial_routines67.make (yyvsc67)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs67")
			end
			yyvsc67 := yyvsc67 + yyInitial_yyvs_size
			yyvs67 := yyspecial_routines67.resize (yyvs67, yyvsc67)
		end
	end
	yyvs67.put (yyval67, yyvsp67)
end
when 225 then
--|#line 1344 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1344")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp25 := yyvsp25 + 1
	if yyvsp25 >= yyvsc25 then
		if yyvs25 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs25")
			end
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs25")
			end
			yyvsc25 := yyvsc25 + yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.resize (yyvs25, yyvsc25)
		end
	end
	yyvs25.put (yyval25, yyvsp25)
end
when 226 then
--|#line 1345 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1345")
end

yyval25 := yyvs25.item (yyvsp25) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs25.put (yyval25, yyvsp25)
end
when 227 then
--|#line 1350 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1350")
end

yyval77 := yyvs77.item (yyvsp77) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs77.put (yyval77, yyvsp77)
end
when 228 then
--|#line 1353 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1353")
end

create yyval77.make_optional_rest (yyvs78.item (yyvsp78), yyvs77.item (yyvsp77)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp78 := yyvsp78 -1
	yyvs77.put (yyval77, yyvsp77)
end
when 229 then
--|#line 1357 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1357")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp77 := yyvsp77 + 1
	if yyvsp77 >= yyvsc77 then
		if yyvs77 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs77")
			end
			create yyspecial_routines77
			yyvsc77 := yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.make (yyvsc77)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs77")
			end
			yyvsc77 := yyvsc77 + yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.resize (yyvs77, yyvsc77)
		end
	end
	yyvs77.put (yyval77, yyvsp77)
end
when 230 then
--|#line 1358 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1358")
end

create yyval77.make_optional_first (yyvs77.item (yyvsp77), yyvs78.item (yyvsp78)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp78 := yyvsp78 -1
	yyvs77.put (yyval77, yyvsp77)
end
when 231 then
--|#line 1362 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1362")
end

create yyval78.make (yyvs2.item (yyvsp2), yyvs57.item (yyvsp57), yyvs52.item (yyvsp52), yyvs73.item (yyvsp73), yyvs39.item (yyvsp39), yyvs74.item (yyvsp74), yyvs76.item (yyvsp76)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp78 := yyvsp78 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp57 := yyvsp57 -1
	yyvsp52 := yyvsp52 -1
	yyvsp73 := yyvsp73 -1
	yyvsp39 := yyvsp39 -1
	yyvsp74 := yyvsp74 -1
	yyvsp76 := yyvsp76 -1
	if yyvsp78 >= yyvsc78 then
		if yyvs78 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs78")
			end
			create yyspecial_routines78
			yyvsc78 := yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.make (yyvsc78)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs78")
			end
			yyvsc78 := yyvsc78 + yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.resize (yyvs78, yyvsc78)
		end
	end
	yyvs78.put (yyval78, yyvsp78)
end
when 232 then
--|#line 1372 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1372")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 233 then
--|#line 1373 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1373")
end

yyval2 := "DEFERRED" 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 234 then
--|#line 1375 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1375")
end

yyval2 := "EFFECTIVE" 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 235 then
--|#line 1377 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1377")
end

yyval2 := "REDEFINED" 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
when 236 then
--|#line 1382 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1382")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp52 := yyvsp52 + 1
	if yyvsp52 >= yyvsc52 then
		if yyvs52 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs52")
			end
			create yyspecial_routines52
			yyvsc52 := yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.make (yyvsc52)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs52")
			end
			yyvsc52 := yyvsc52 + yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.resize (yyvs52, yyvsc52)
		end
	end
	yyvs52.put (yyval52, yyvsp52)
end
when 237 then
--|#line 1383 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1383")
end

yyval52 := yyvs52.item (yyvsp52) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp53 := yyvsp53 -1
	yyvs52.put (yyval52, yyvsp52)
end
when 238 then
--|#line 1386 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1386")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp73 := yyvsp73 + 1
	if yyvsp73 >= yyvsc73 then
		if yyvs73 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs73")
			end
			create yyspecial_routines73
			yyvsc73 := yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.make (yyvsc73)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs73")
			end
			yyvsc73 := yyvsc73 + yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.resize (yyvs73, yyvsc73)
		end
	end
	yyvs73.put (yyval73, yyvsp73)
end
when 239 then
--|#line 1387 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1387")
end

yyval73 := yyvs73.item (yyvsp73) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs73.put (yyval73, yyvsp73)
end
when 240 then
--|#line 1390 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1390")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp74 := yyvsp74 + 1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
when 241 then
--|#line 1391 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1391")
end

yyval74 := yyvs74.item (yyvsp74) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs74.put (yyval74, yyvsp74)
end
when 242 then
--|#line 1394 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1394")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp76 := yyvsp76 + 1
	if yyvsp76 >= yyvsc76 then
		if yyvs76 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs76")
			end
			create yyspecial_routines76
			yyvsc76 := yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.make (yyvsc76)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs76")
			end
			yyvsc76 := yyvsc76 + yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.resize (yyvs76, yyvsc76)
		end
	end
	yyvs76.put (yyval76, yyvsp76)
end
when 243 then
--|#line 1395 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1395")
end

yyval76 := yyvs76.item (yyvsp76) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs76.put (yyval76, yyvsp76)
end
when 244 then
--|#line 1398 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1398")
end

yyval76 := yyvs76.item (yyvsp76) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs76.put (yyval76, yyvsp76)
end
when 245 then
--|#line 1401 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1401")
end

create yyval76.make (yyvs64.item (yyvsp64), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp76 := yyvsp76 + 1
	yyvsp64 := yyvsp64 -1
	if yyvsp76 >= yyvsc76 then
		if yyvs76 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs76")
			end
			create yyspecial_routines76
			yyvsc76 := yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.make (yyvsc76)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs76")
			end
			yyvsc76 := yyvsc76 + yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.resize (yyvs76, yyvsc76)
		end
	end
	yyvs76.put (yyval76, yyvsp76)
end
when 246 then
--|#line 1402 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1402")
end

create yyval76.make (Void, yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp76 := yyvsp76 + 1
	yyvsp64 := yyvsp64 -1
	if yyvsp76 >= yyvsc76 then
		if yyvs76 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs76")
			end
			create yyspecial_routines76
			yyvsc76 := yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.make (yyvsc76)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs76")
			end
			yyvsc76 := yyvsc76 + yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.resize (yyvs76, yyvsc76)
		end
	end
	yyvs76.put (yyval76, yyvsp76)
end
when 247 then
--|#line 1403 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1403")
end

yyval76 := yyvs76.item (yyvsp76) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs76.put (yyval76, yyvsp76)
end
when 248 then
--|#line 1406 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1406")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs64.put (yyval64, yyvsp64)
end
when 249 then
--|#line 1409 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1409")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs64.put (yyval64, yyvsp64)
end
when 250 then
--|#line 1412 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1412")
end

create yyval76.make (yyvs64.item (yyvsp64 - 1), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp76 := yyvsp76 + 1
	yyvsp64 := yyvsp64 -2
	if yyvsp76 >= yyvsc76 then
		if yyvs76 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs76")
			end
			create yyspecial_routines76
			yyvsc76 := yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.make (yyvsc76)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs76")
			end
			yyvsc76 := yyvsc76 + yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.resize (yyvs76, yyvsc76)
		end
	end
	yyvs76.put (yyval76, yyvsp76)
end
when 251 then
--|#line 1415 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1415")
end

yyval25 := yyvs25.item (yyvsp25) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs25.put (yyval25, yyvsp25)
end
when 252 then
--|#line 1419 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1419")
end

yyval57 := yyvs57.item (yyvsp57) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs57.put (yyval57, yyvsp57)
end
when 253 then
--|#line 1423 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1423")
end

create yyval57.make_optional_rest (yyvs68.item (yyvsp68), yyvs57.item (yyvsp57)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp68 := yyvsp68 -1
	yyvs57.put (yyval57, yyvsp57)
end
when 254 then
--|#line 1427 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1427")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp57 := yyvsp57 + 1
	if yyvsp57 >= yyvsc57 then
		if yyvs57 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs57")
			end
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs57")
			end
			yyvsc57 := yyvsc57 + yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.resize (yyvs57, yyvsc57)
		end
	end
	yyvs57.put (yyval57, yyvsp57)
end
when 255 then
--|#line 1428 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1428")
end

create yyval57.make_optional_first (yyvs57.item (yyvsp57), yyvs68.item (yyvsp68)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp68 := yyvsp68 -1
	yyvs57.put (yyval57, yyvsp57)
end
when 256 then
--|#line 1433 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1433")
end

create yyval68.make_feature_name (last_identifier)
					  -- add_feature_name($$)
					
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp68 := yyvsp68 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp68 >= yyvsc68 then
		if yyvs68 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs68")
			end
			create yyspecial_routines68
			yyvsc68 := yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.make (yyvsc68)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs68")
			end
			yyvsc68 := yyvsc68 + yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.resize (yyvs68, yyvsc68)
		end
	end
	yyvs68.put (yyval68, yyvsp68)
end
when 257 then
--|#line 1437 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1437")
end

create yyval68.make_feature_name (last_identifier)
					  -- add_feature_name($$)
					
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp68 := yyvsp68 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp68 >= yyvsc68 then
		if yyvs68 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs68")
			end
			create yyspecial_routines68
			yyvsc68 := yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.make (yyvsc68)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs68")
			end
			yyvsc68 := yyvsc68 + yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.resize (yyvs68, yyvsc68)
		end
	end
	yyvs68.put (yyval68, yyvsp68)
end
when 258 then
--|#line 1441 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1441")
end

create yyval68.make_feature_name (last_identifier)
					  -- add_feature_name($$)
					
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp68 := yyvsp68 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp68 >= yyvsc68 then
		if yyvs68 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs68")
			end
			create yyspecial_routines68
			yyvsc68 := yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.make (yyvsc68)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs68")
			end
			yyvsc68 := yyvsc68 + yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.resize (yyvs68, yyvsc68)
		end
	end
	yyvs68.put (yyval68, yyvsp68)
end
when 259 then
--|#line 1445 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1445")
end

yyval68 := yyvs68.item (yyvsp68) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs68.put (yyval68, yyvsp68)
end
when 260 then
--|#line 1446 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1446")
end

yyval68 := yyvs68.item (yyvsp68) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs68.put (yyval68, yyvsp68)
end
when 261 then
--|#line 1450 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1450")
end

yyval73 := yyvs73.item (yyvsp73) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs73.put (yyval73, yyvsp73)
end
when 262 then
--|#line 1453 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1453")
end

create yyval73.make (yyvs2.item (yyvsp2), yyvs68.item (yyvsp68)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp73 := yyvsp73 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyvsp68 := yyvsp68 -1
	if yyvsp73 >= yyvsc73 then
		if yyvs73 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs73")
			end
			create yyspecial_routines73
			yyvsc73 := yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.make (yyvsc73)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs73")
			end
			yyvsc73 := yyvsc73 + yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.resize (yyvs73, yyvsc73)
		end
	end
	yyvs73.put (yyval73, yyvsp73)
end
when 263 then
--|#line 1456 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1456")
end

yyval74 := yyvs74.item (yyvsp74) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs74.put (yyval74, yyvsp74)
end
when 264 then
--|#line 1459 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1459")
end

create yyval74.make_optional_rest (yyvs75.item (yyvsp75), yyvs74.item (yyvsp74)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp75 := yyvsp75 -1
	yyvs74.put (yyval74, yyvsp74)
end
when 265 then
--|#line 1463 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1463")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp74 := yyvsp74 + 1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
when 266 then
--|#line 1464 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1464")
end

create yyval74.make_optional_first (yyvs74.item (yyvsp74), yyvs75.item (yyvsp75)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp75 := yyvsp75 -1
	yyvs74.put (yyval74, yyvsp74)
end
when 267 then
--|#line 1468 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1468")
end

create yyval75.make (yyvs18.item (yyvsp18), yyvs52.item (yyvsp52)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp75 := yyvsp75 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp18 := yyvsp18 -1
	yyvsp52 := yyvsp52 -1
	if yyvsp75 >= yyvsc75 then
		if yyvs75 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs75")
			end
			create yyspecial_routines75
			yyvsc75 := yyInitial_yyvs_size
			yyvs75 := yyspecial_routines75.make (yyvsc75)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs75")
			end
			yyvsc75 := yyvsc75 + yyInitial_yyvs_size
			yyvs75 := yyspecial_routines75.resize (yyvs75, yyvsc75)
		end
	end
	yyvs75.put (yyval75, yyvsp75)
end
when 268 then
--|#line 1472 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1472")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp18 := yyvsp18 + 1
	if yyvsp18 >= yyvsc18 then
		if yyvs18 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs18")
			end
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs18")
			end
			yyvsc18 := yyvsc18 + yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.resize (yyvs18, yyvsc18)
		end
	end
	yyvs18.put (yyval18, yyvsp18)
end
when 269 then
--|#line 1473 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1473")
end

yyval18 := yyvs18.item (yyvsp18) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs18.put (yyval18, yyvsp18)
end
when 270 then
--|#line 1477 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1477")
end

yyval18 := yyvs18.item (yyvsp18) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs18.put (yyval18, yyvsp18)
end
when 271 then
--|#line 1480 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1480")
end

create yyval18.make_optional_rest (yyvs2.item (yyvsp2), yyvs18.item (yyvsp18)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs18.put (yyval18, yyvsp18)
end
when 272 then
--|#line 1484 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1484")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp18 := yyvsp18 + 1
	if yyvsp18 >= yyvsc18 then
		if yyvs18 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs18")
			end
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs18")
			end
			yyvsc18 := yyvsc18 + yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.resize (yyvs18, yyvsc18)
		end
	end
	yyvs18.put (yyval18, yyvsp18)
end
when 273 then
--|#line 1485 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1485")
end

create yyval18.make_optional_first (yyvs18.item (yyvsp18), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs18.put (yyval18, yyvsp18)
end
when 274 then
--|#line 1489 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1489")
end

create yyval68.make_prefix (yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp68 := yyvsp68 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp69 := yyvsp69 -1
	if yyvsp68 >= yyvsc68 then
		if yyvs68 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs68")
			end
			create yyspecial_routines68
			yyvsc68 := yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.make (yyvsc68)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs68")
			end
			yyvsc68 := yyvsc68 + yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.resize (yyvs68, yyvsc68)
		end
	end
	yyvs68.put (yyval68, yyvsp68)
end
when 275 then
--|#line 1492 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1492")
end

create yyval68.make_infix (yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp68 := yyvsp68 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp69 := yyvsp69 -1
	if yyvsp68 >= yyvsc68 then
		if yyvs68 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs68")
			end
			create yyspecial_routines68
			yyvsc68 := yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.make (yyvsc68)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs68")
			end
			yyvsc68 := yyvsc68 + yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.resize (yyvs68, yyvsc68)
		end
	end
	yyvs68.put (yyval68, yyvsp68)
end
when 276 then
--|#line 1495 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1495")
end

yyval69 := yyvs71.item (yyvsp71) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp71 := yyvsp71 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
when 277 then
--|#line 1496 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1496")
end

create yyval69.make_free_operator (last_free_operator) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
when 278 then
--|#line 1499 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1499")
end

yyval69 := yyvs70.item (yyvsp70) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp70 := yyvsp70 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
when 279 then
--|#line 1500 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1500")
end

create yyval69.make_free_operator (last_free_operator) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
when 280 then
--|#line 1503 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1503")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp49 := yyvsp49 + 1
	if yyvsp49 >= yyvsc49 then
		if yyvs49 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs49")
			end
			create yyspecial_routines49
			yyvsc49 := yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.make (yyvsc49)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs49")
			end
			yyvsc49 := yyvsc49 + yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.resize (yyvs49, yyvsc49)
		end
	end
	yyvs49.put (yyval49, yyvsp49)
end
when 281 then
--|#line 1504 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1504")
end

yyval49 := yyvs49.item (yyvsp49) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs49.put (yyval49, yyvsp49)
end
when 282 then
--|#line 1508 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1508")
end

yyval49 := yyvs49.item (yyvsp49) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs49.put (yyval49, yyvsp49)
end
when 283 then
--|#line 1512 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1512")
end

yyval49 := yyvs49.item (yyvsp49) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs49.put (yyval49, yyvsp49)
end
when 284 then
--|#line 1516 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1516")
end

create yyval49.make_optional_rest (yyvs48.item (yyvsp48), yyvs49.item (yyvsp49)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp48 := yyvsp48 -1
	yyvs49.put (yyval49, yyvsp49)
end
when 285 then
--|#line 1521 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1521")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp49 := yyvsp49 + 1
	if yyvsp49 >= yyvsc49 then
		if yyvs49 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs49")
			end
			create yyspecial_routines49
			yyvsc49 := yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.make (yyvsc49)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs49")
			end
			yyvsc49 := yyvsc49 + yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.resize (yyvs49, yyvsc49)
		end
	end
	yyvs49.put (yyval49, yyvsp49)
end
when 286 then
--|#line 1522 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1522")
end

create yyval49.make_optional_first (yyvs49.item (yyvsp49), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp48 := yyvsp48 -1
	yyvs49.put (yyval49, yyvsp49)
end
when 287 then
--|#line 1526 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1526")
end

create yyval48.make (yyvs2.item (yyvsp2), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp48 := yyvsp48 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp48 >= yyvsc48 then
		if yyvs48 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs48")
			end
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs48")
			end
			yyvsc48 := yyvsc48 + yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.resize (yyvs48, yyvsc48)
		end
	end
	yyvs48.put (yyval48, yyvsp48)
end
when 288 then
--|#line 1530 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1530")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp50 := yyvsp50 + 1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
when 289 then
--|#line 1531 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1531")
end

yyval50 := yyvs50.item (yyvsp50) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs50.put (yyval50, yyvsp50)
end
when 290 then
--|#line 1536 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1536")
end

yyval2 := yyvs2.item (yyvsp2)
								-- add_formal_generic_name($$)
							 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 291 then
--|#line 1540 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1540")
end

yyval2 := yyvs2.item (yyvsp2)
								-- add_formal_generic_name($$)
							 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 292 then
--|#line 1546 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1546")
end

create yyval50.make (yyvs2.item (yyvsp2), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp51 := yyvsp51 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
when 293 then
--|#line 1550 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1550")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp51 := yyvsp51 + 1
	if yyvsp51 >= yyvsc51 then
		if yyvs51 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs51")
			end
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs51")
			end
			yyvsc51 := yyvsc51 + yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.resize (yyvs51, yyvsc51)
		end
	end
	yyvs51.put (yyval51, yyvsp51)
end
when 294 then
--|#line 1551 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1551")
end

yyval51 := yyvs51.item (yyvsp51) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs51.put (yyval51, yyvsp51)
end
when 295 then
--|#line 1556 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1556")
end

create yyval51.make_from_list (yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs51.put (yyval51, yyvsp51)
end
when 296 then
--|#line 1561 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1561")
end

yyval51 := yyvs51.item (yyvsp51) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs51.put (yyval51, yyvsp51)
end
when 297 then
--|#line 1565 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1565")
end

create yyval51.make_optional_rest (yyvs52.item (yyvsp52), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 -1
	yyvs51.put (yyval51, yyvsp51)
end
when 298 then
--|#line 1570 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1570")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp51 := yyvsp51 + 1
	if yyvsp51 >= yyvsc51 then
		if yyvs51 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs51")
			end
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs51")
			end
			yyvsc51 := yyvsc51 + yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.resize (yyvs51, yyvsc51)
		end
	end
	yyvs51.put (yyval51, yyvsp51)
end
when 299 then
--|#line 1571 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1571")
end

create yyval51.make_optional_first (yyvs51.item (yyvsp51), yyvs52.item (yyvsp52)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp52 := yyvsp52 -1
	yyvs51.put (yyval51, yyvsp51)
end
when 300 then
--|#line 1576 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1576")
end

create yyval52.make_class_type (yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		if yyvs52 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs52")
			end
			create yyspecial_routines52
			yyvsc52 := yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.make (yyvsc52)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs52")
			end
			yyvsc52 := yyvsc52 + yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.resize (yyvs52, yyvsc52)
		end
	end
	yyvs52.put (yyval52, yyvsp52)
end
when 301 then
--|#line 1578 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1578")
end

create yyval52.make_formal_generic_name (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp52 >= yyvsc52 then
		if yyvs52 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs52")
			end
			create yyspecial_routines52
			yyvsc52 := yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.make (yyvsc52)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs52")
			end
			yyvsc52 := yyvsc52 + yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.resize (yyvs52, yyvsc52)
		end
	end
	yyvs52.put (yyval52, yyvsp52)
end
when 302 then
--|#line 1585 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1585")
end

create yyval71.make_delta 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp71 := yyvsp71 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp71 >= yyvsc71 then
		if yyvs71 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs71")
			end
			create yyspecial_routines71
			yyvsc71 := yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.make (yyvsc71)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs71")
			end
			yyvsc71 := yyvsc71 + yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.resize (yyvs71, yyvsc71)
		end
	end
	yyvs71.put (yyval71, yyvsp71)
end
when 303 then
--|#line 1586 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1586")
end

create yyval71.make_old 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp71 := yyvsp71 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp71 >= yyvsc71 then
		if yyvs71 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs71")
			end
			create yyspecial_routines71
			yyvsc71 := yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.make (yyvsc71)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs71")
			end
			yyvsc71 := yyvsc71 + yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.resize (yyvs71, yyvsc71)
		end
	end
	yyvs71.put (yyval71, yyvsp71)
end
when 304 then
--|#line 1587 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1587")
end

create yyval71.make_not 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp71 := yyvsp71 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp71 >= yyvsc71 then
		if yyvs71 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs71")
			end
			create yyspecial_routines71
			yyvsc71 := yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.make (yyvsc71)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs71")
			end
			yyvsc71 := yyvsc71 + yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.resize (yyvs71, yyvsc71)
		end
	end
	yyvs71.put (yyval71, yyvsp71)
end
when 305 then
--|#line 1588 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1588")
end

yyval71 := yyvs72.item (yyvsp72); yyval71.set_unary 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp71 := yyvsp71 + 1
	yyvsp72 := yyvsp72 -1
	if yyvsp71 >= yyvsc71 then
		if yyvs71 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs71")
			end
			create yyspecial_routines71
			yyvsc71 := yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.make (yyvsc71)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs71")
			end
			yyvsc71 := yyvsc71 + yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.resize (yyvs71, yyvsc71)
		end
	end
	yyvs71.put (yyval71, yyvsp71)
end
when 306 then
--|#line 1591 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1591")
end

yyval70 := yyvs72.item (yyvsp72); yyval70.set_binary 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp72 := yyvsp72 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 307 then
--|#line 1592 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1592")
end

create yyval70.make_times 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 308 then
--|#line 1593 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1593")
end

create yyval70.make_division 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 309 then
--|#line 1594 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1594")
end

create yyval70.make_less_than 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 310 then
--|#line 1595 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1595")
end

create yyval70.make_greater_than 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 311 then
--|#line 1596 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1596")
end

create yyval70.make_less_than_equals 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 312 then
--|#line 1597 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1597")
end

create yyval70.make_greater_than_equals 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 313 then
--|#line 1598 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1598")
end

create yyval70.make_equals 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 314 then
--|#line 1599 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1599")
end

create yyval70.make_not_equals 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 315 then
--|#line 1600 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1600")
end

create yyval70.make_integer_division 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 316 then
--|#line 1601 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1601")
end

create yyval70.make_modulo 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 317 then
--|#line 1602 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1602")
end

create yyval70.make_power 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 318 then
--|#line 1603 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1603")
end

create yyval70.make_or 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 319 then
--|#line 1604 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1604")
end

create yyval70.make_xor 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 320 then
--|#line 1605 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1605")
end

create yyval70.make_and 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 321 then
--|#line 1606 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1606")
end

create yyval70.make_implies 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 322 then
--|#line 1607 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1607")
end

create yyval70.make_logical_equivalence 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 323 then
--|#line 1608 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1608")
end

create yyval70.make_member_of 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 324 then
--|#line 1609 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1609")
end

create yyval70.make_colon 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
when 325 then
--|#line 1615 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1615")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs64.put (yyval64, yyvsp64)
end
when 326 then
--|#line 1618 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1618")
end

create yyval64.make_optional_rest (yyvs79.item (yyvsp79), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp79 := yyvsp79 -1
	yyvs64.put (yyval64, yyvsp64)
end
when 327 then
--|#line 1622 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1622")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp64 := yyvsp64 + 1
	if yyvsp64 >= yyvsc64 then
		if yyvs64 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs64")
			end
			create yyspecial_routines64
			yyvsc64 := yyInitial_yyvs_size
			yyvs64 := yyspecial_routines64.make (yyvsc64)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs64")
			end
			yyvsc64 := yyvsc64 + yyInitial_yyvs_size
			yyvs64 := yyspecial_routines64.resize (yyvs64, yyvsc64)
		end
	end
	yyvs64.put (yyval64, yyvsp64)
end
when 328 then
--|#line 1623 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1623")
end

create yyval64.make_optional_first (yyvs64.item (yyvsp64), yyvs79.item (yyvsp79)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp79 := yyvsp79 -1
	yyvs64.put (yyval64, yyvsp64)
end
when 329 then
--|#line 1627 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1627")
end

yyval79 := yyvs81.item (yyvsp81) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp79 := yyvsp79 + 1
	yyvsp81 := yyvsp81 -1
	if yyvsp79 >= yyvsc79 then
		if yyvs79 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs79")
			end
			create yyspecial_routines79
			yyvsc79 := yyInitial_yyvs_size
			yyvs79 := yyspecial_routines79.make (yyvsc79)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs79")
			end
			yyvsc79 := yyvsc79 + yyInitial_yyvs_size
			yyvs79 := yyspecial_routines79.resize (yyvs79, yyvsc79)
		end
	end
	yyvs79.put (yyval79, yyvsp79)
end
when 330 then
--|#line 1628 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1628")
end

yyval79 := yyvs80.item (yyvsp80) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp79 := yyvsp79 + 1
	yyvsp80 := yyvsp80 -1
	if yyvsp79 >= yyvsc79 then
		if yyvs79 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs79")
			end
			create yyspecial_routines79
			yyvsc79 := yyInitial_yyvs_size
			yyvs79 := yyspecial_routines79.make (yyvsc79)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs79")
			end
			yyvsc79 := yyvsc79 + yyInitial_yyvs_size
			yyvs79 := yyspecial_routines79.resize (yyvs79, yyvsc79)
		end
	end
	yyvs79.put (yyval79, yyvsp79)
end
when 331 then
--|#line 1630 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1630")
end

create yyval80.make_list (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp80 >= yyvsc80 then
		if yyvs80 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs80")
			end
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs80")
			end
			yyvsc80 := yyvsc80 + yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.resize (yyvs80, yyvsc80)
		end
	end
	yyvs80.put (yyval80, yyvsp80)
end
when 332 then
--|#line 1633 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1633")
end

yyval81 := yyvs81.item (yyvsp81) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs81.put (yyval81, yyvsp81)
end
when 333 then
--|#line 1637 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1637")
end

yyval81 := yyvs83.item (yyvsp83) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp81 := yyvsp81 + 1
	yyvsp83 := yyvsp83 -1
	if yyvsp81 >= yyvsc81 then
		if yyvs81 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs81")
			end
			create yyspecial_routines81
			yyvsc81 := yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.make (yyvsc81)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs81")
			end
			yyvsc81 := yyvsc81 + yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.resize (yyvs81, yyvsc81)
		end
	end
	yyvs81.put (yyval81, yyvsp81)
end
when 334 then
--|#line 1638 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1638")
end

yyval81 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp81 := yyvsp81 + 1
	yyvsp88 := yyvsp88 -1
	if yyvsp81 >= yyvsc81 then
		if yyvs81 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs81")
			end
			create yyspecial_routines81
			yyvsc81 := yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.make (yyvsc81)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs81")
			end
			yyvsc81 := yyvsc81 + yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.resize (yyvs81, yyvsc81)
		end
	end
	yyvs81.put (yyval81, yyvsp81)
end
when 335 then
--|#line 1639 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1639")
end

yyval81 := yyvs92.item (yyvsp92) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp81 := yyvsp81 + 1
	yyvsp92 := yyvsp92 -1
	if yyvsp81 >= yyvsc81 then
		if yyvs81 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs81")
			end
			create yyspecial_routines81
			yyvsc81 := yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.make (yyvsc81)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs81")
			end
			yyvsc81 := yyvsc81 + yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.resize (yyvs81, yyvsc81)
		end
	end
	yyvs81.put (yyval81, yyvsp81)
end
when 336 then
--|#line 1640 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1640")
end

yyval81 := yyvs81.item (yyvsp81) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs81.put (yyval81, yyvsp81)
end
when 337 then
--|#line 1641 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1641")
end

yyval81 := yyvs101.item (yyvsp101) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp81 := yyvsp81 + 1
	yyvsp101 := yyvsp101 -1
	if yyvsp81 >= yyvsc81 then
		if yyvs81 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs81")
			end
			create yyspecial_routines81
			yyvsc81 := yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.make (yyvsc81)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs81")
			end
			yyvsc81 := yyvsc81 + yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.resize (yyvs81, yyvsc81)
		end
	end
	yyvs81.put (yyval81, yyvsp81)
end
when 338 then
--|#line 1644 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1644")
end

create yyval83.make (yyvs82.item (yyvsp82), yyvs84.item (yyvsp84), yyvs81.item (yyvsp81 - 1), yyvs81.item (yyvsp81)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp83 := yyvsp83 + 1
	yyvsp82 := yyvsp82 -1
	yyvsp84 := yyvsp84 -1
	yyvsp81 := yyvsp81 -2
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
when 339 then
--|#line 1648 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1648")
end

create yyval82.make_for_all 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp82 := yyvsp82 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp82 >= yyvsc82 then
		if yyvs82 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs82")
			end
			create yyspecial_routines82
			yyvsc82 := yyInitial_yyvs_size
			yyvs82 := yyspecial_routines82.make (yyvsc82)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs82")
			end
			yyvsc82 := yyvsc82 + yyInitial_yyvs_size
			yyvs82 := yyspecial_routines82.resize (yyvs82, yyvsc82)
		end
	end
	yyvs82.put (yyval82, yyvsp82)
end
when 340 then
--|#line 1649 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1649")
end

create yyval82.make_exists 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp82 := yyvsp82 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp82 >= yyvsc82 then
		if yyvs82 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs82")
			end
			create yyspecial_routines82
			yyvsc82 := yyInitial_yyvs_size
			yyvs82 := yyspecial_routines82.make (yyvsc82)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs82")
			end
			yyvsc82 := yyvsc82 + yyInitial_yyvs_size
			yyvs82 := yyspecial_routines82.resize (yyvs82, yyvsc82)
		end
	end
	yyvs82.put (yyval82, yyvsp82)
end
when 341 then
--|#line 1652 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1652")
end

yyval84 := yyvs84.item (yyvsp84) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs84.put (yyval84, yyvsp84)
end
when 342 then
--|#line 1655 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1655")
end

create yyval84.make_optional_rest (yyvs85.item (yyvsp85), yyvs84.item (yyvsp84)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp85 := yyvsp85 -1
	yyvs84.put (yyval84, yyvsp84)
end
when 343 then
--|#line 1659 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1659")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp84 := yyvsp84 + 1
	if yyvsp84 >= yyvsc84 then
		if yyvs84 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs84")
			end
			create yyspecial_routines84
			yyvsc84 := yyInitial_yyvs_size
			yyvs84 := yyspecial_routines84.make (yyvsc84)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs84")
			end
			yyvsc84 := yyvsc84 + yyInitial_yyvs_size
			yyvs84 := yyspecial_routines84.resize (yyvs84, yyvsc84)
		end
	end
	yyvs84.put (yyval84, yyvsp84)
end
when 344 then
--|#line 1660 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1660")
end

create yyval84.make_optional_first (yyvs84.item (yyvsp84), yyvs85.item (yyvsp85)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp85 := yyvsp85 -1
	yyvs84.put (yyval84, yyvsp84)
end
when 345 then
--|#line 1664 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1664")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp81 := yyvsp81 + 1
	if yyvsp81 >= yyvsc81 then
		if yyvs81 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs81")
			end
			create yyspecial_routines81
			yyvsc81 := yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.make (yyvsc81)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs81")
			end
			yyvsc81 := yyvsc81 + yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.resize (yyvs81, yyvsc81)
		end
	end
	yyvs81.put (yyval81, yyvsp81)
end
when 346 then
--|#line 1665 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1665")
end

yyval81 := yyvs81.item (yyvsp81) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs81.put (yyval81, yyvsp81)
end
when 347 then
--|#line 1668 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1668")
end

yyval81 := yyvs81.item (yyvsp81) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs81.put (yyval81, yyvsp81)
end
when 348 then
--|#line 1671 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1671")
end

yyval81 := yyvs81.item (yyvsp81) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs81.put (yyval81, yyvsp81)
end
when 349 then
--|#line 1674 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1674")
end

yyval85 := yyvs86.item (yyvsp86) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp85 := yyvsp85 + 1
	yyvsp86 := yyvsp86 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
when 350 then
--|#line 1675 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1675")
end

yyval85 := yyvs87.item (yyvsp87) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp85 := yyvsp85 + 1
	yyvsp87 := yyvsp87 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
when 351 then
--|#line 1678 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1678")
end

create yyval86.make (yyvs18.item (yyvsp18), yyvs95.item (yyvsp95)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp86 := yyvsp86 + 1
	yyvsp18 := yyvsp18 -1
	yyvsp1 := yyvsp1 -1
	yyvsp95 := yyvsp95 -1
	if yyvsp86 >= yyvsc86 then
		if yyvs86 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs86")
			end
			create yyspecial_routines86
			yyvsc86 := yyInitial_yyvs_size
			yyvs86 := yyspecial_routines86.make (yyvsc86)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs86")
			end
			yyvsc86 := yyvsc86 + yyInitial_yyvs_size
			yyvs86 := yyspecial_routines86.resize (yyvs86, yyvsc86)
		end
	end
	yyvs86.put (yyval86, yyvsp86)
end
when 352 then
--|#line 1681 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1681")
end

create yyval87.make (yyvs18.item (yyvsp18), yyvs52.item (yyvsp52)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 + 1
	yyvsp18 := yyvsp18 -1
	yyvsp1 := yyvsp1 -1
	yyvsp52 := yyvsp52 -1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
when 353 then
--|#line 1684 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1684")
end

create yyval88.make (yyvs81.item (yyvsp81), yyvs89.item (yyvsp89)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp88 := yyvsp88 + 1
	yyvsp81 := yyvsp81 -1
	yyvsp89 := yyvsp89 -1
	if yyvsp88 >= yyvsc88 then
		if yyvs88 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs88")
			end
			create yyspecial_routines88
			yyvsc88 := yyInitial_yyvs_size
			yyvs88 := yyspecial_routines88.make (yyvsc88)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs88")
			end
			yyvsc88 := yyvsc88 + yyInitial_yyvs_size
			yyvs88 := yyspecial_routines88.resize (yyvs88, yyvsc88)
		end
	end
	yyvs88.put (yyval88, yyvsp88)
end
when 354 then
--|#line 1687 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1687")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp81 := yyvsp81 + 1
	if yyvsp81 >= yyvsc81 then
		if yyvs81 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs81")
			end
			create yyspecial_routines81
			yyvsc81 := yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.make (yyvsc81)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs81")
			end
			yyvsc81 := yyvsc81 + yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.resize (yyvs81, yyvsc81)
		end
	end
	yyvs81.put (yyval81, yyvsp81)
end
when 355 then
--|#line 1688 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1688")
end

yyval81 := yyvs81.item (yyvsp81) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs81.put (yyval81, yyvsp81)
end
when 356 then
--|#line 1691 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1691")
end

yyval81 := yyvs81.item (yyvsp81) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs81.put (yyval81, yyvsp81)
end
when 357 then
--|#line 1694 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1694")
end

yyval89 := yyvs89.item (yyvsp89) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs89.put (yyval89, yyvsp89)
end
when 358 then
--|#line 1697 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1697")
end

create yyval89.make_optional_rest (yyvs90.item (yyvsp90), yyvs89.item (yyvsp89)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp90 := yyvsp90 -1
	yyvs89.put (yyval89, yyvsp89)
end
when 359 then
--|#line 1701 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1701")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp89 := yyvsp89 + 1
	if yyvsp89 >= yyvsc89 then
		if yyvs89 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs89")
			end
			create yyspecial_routines89
			yyvsc89 := yyInitial_yyvs_size
			yyvs89 := yyspecial_routines89.make (yyvsc89)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs89")
			end
			yyvsc89 := yyvsc89 + yyInitial_yyvs_size
			yyvs89 := yyspecial_routines89.resize (yyvs89, yyvsc89)
		end
	end
	yyvs89.put (yyval89, yyvsp89)
end
when 360 then
--|#line 1702 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1702")
end

create yyval89.make_optional_first (yyvs89.item (yyvsp89), yyvs90.item (yyvsp90)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp90 := yyvsp90 -1
	yyvs89.put (yyval89, yyvsp89)
end
when 361 then
--|#line 1706 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1706")
end

create yyval90.make (yyvs2.item (yyvsp2), yyvs91.item (yyvsp91)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp91 := yyvsp91 -1
	if yyvsp90 >= yyvsc90 then
		if yyvs90 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs90")
			end
			create yyspecial_routines90
			yyvsc90 := yyInitial_yyvs_size
			yyvs90 := yyspecial_routines90.make (yyvsc90)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs90")
			end
			yyvsc90 := yyvsc90 + yyInitial_yyvs_size
			yyvs90 := yyspecial_routines90.resize (yyvs90, yyvsc90)
		end
	end
	yyvs90.put (yyval90, yyvsp90)
end
when 362 then
--|#line 1709 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1709")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp91 := yyvsp91 + 1
	if yyvsp91 >= yyvsc91 then
		if yyvs91 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs91")
			end
			create yyspecial_routines91
			yyvsc91 := yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.make (yyvsc91)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs91")
			end
			yyvsc91 := yyvsc91 + yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.resize (yyvs91, yyvsc91)
		end
	end
	yyvs91.put (yyval91, yyvsp91)
end
when 363 then
--|#line 1710 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1710")
end

yyval91 := yyvs91.item (yyvsp91) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs91.put (yyval91, yyvsp91)
end
when 364 then
--|#line 1713 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1713")
end

yyval91 := yyvs91.item (yyvsp91) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs91.put (yyval91, yyvsp91)
end
when 365 then
--|#line 1716 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1716")
end

yyval91 := yyvs91.item (yyvsp91) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs91.put (yyval91, yyvsp91)
end
when 366 then
--|#line 1719 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1719")
end

create yyval91.make_optional_rest (yyvs81.item (yyvsp81), yyvs91.item (yyvsp91)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp81 := yyvsp81 -1
	yyvs91.put (yyval91, yyvsp91)
end
when 367 then
--|#line 1723 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1723")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp91 := yyvsp91 + 1
	if yyvsp91 >= yyvsc91 then
		if yyvs91 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs91")
			end
			create yyspecial_routines91
			yyvsc91 := yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.make (yyvsc91)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs91")
			end
			yyvsc91 := yyvsc91 + yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.resize (yyvs91, yyvsc91)
		end
	end
	yyvs91.put (yyval91, yyvsp91)
end
when 368 then
--|#line 1724 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1724")
end

create yyval91.make_optional_first (yyvs91.item (yyvsp91), yyvs81.item (yyvsp81)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp81 := yyvsp81 -1
	yyvs91.put (yyval91, yyvsp91)
end
when 369 then
--|#line 1732 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1732")
end

yyval92 := yyvs93.item (yyvsp93) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp92 := yyvsp92 + 1
	yyvsp93 := yyvsp93 -1
	if yyvsp92 >= yyvsc92 then
		if yyvs92 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs92")
			end
			create yyspecial_routines92
			yyvsc92 := yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.make (yyvsc92)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs92")
			end
			yyvsc92 := yyvsc92 + yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.resize (yyvs92, yyvsc92)
		end
	end
	yyvs92.put (yyval92, yyvsp92)
end
when 370 then
--|#line 1733 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1733")
end

yyval92 := yyvs94.item (yyvsp94) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp92 := yyvsp92 + 1
	yyvsp94 := yyvsp94 -1
	if yyvsp92 >= yyvsc92 then
		if yyvs92 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs92")
			end
			create yyspecial_routines92
			yyvsc92 := yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.make (yyvsc92)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs92")
			end
			yyvsc92 := yyvsc92 + yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.resize (yyvs92, yyvsc92)
		end
	end
	yyvs92.put (yyval92, yyvsp92)
end
when 371 then
--|#line 1740 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1740")
end

yyval81 := yyvs81.item (yyvsp81) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs81.put (yyval81, yyvsp81)
end
when 372 then
--|#line 1743 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1743")
end

create yyval93.make (yyvs69.item (yyvsp69), yyvs81.item (yyvsp81)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp93 := yyvsp93 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp81 := yyvsp81 -1
	if yyvsp93 >= yyvsc93 then
		if yyvs93 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs93")
			end
			create yyspecial_routines93
			yyvsc93 := yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.make (yyvsc93)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs93")
			end
			yyvsc93 := yyvsc93 + yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.resize (yyvs93, yyvsc93)
		end
	end
	yyvs93.put (yyval93, yyvsp93)
end
when 373 then
--|#line 1746 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1746")
end

create yyval94.make (yyvs69.item (yyvsp69), yyvs81.item (yyvsp81 - 1), yyvs81.item (yyvsp81)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp94 := yyvsp94 + 1
	yyvsp81 := yyvsp81 -2
	yyvsp69 := yyvsp69 -1
	if yyvsp94 >= yyvsc94 then
		if yyvs94 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs94")
			end
			create yyspecial_routines94
			yyvsc94 := yyInitial_yyvs_size
			yyvs94 := yyspecial_routines94.make (yyvsc94)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs94")
			end
			yyvsc94 := yyvsc94 + yyInitial_yyvs_size
			yyvs94 := yyspecial_routines94.resize (yyvs94, yyvsc94)
		end
	end
	yyvs94.put (yyval94, yyvsp94)
end
when 374 then
--|#line 1749 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1749")
end

yyval95 := yyvs96.item (yyvsp96) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp95 := yyvsp95 + 1
	yyvsp96 := yyvsp96 -1
	if yyvsp95 >= yyvsc95 then
		if yyvs95 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs95")
			end
			create yyspecial_routines95
			yyvsc95 := yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.make (yyvsc95)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs95")
			end
			yyvsc95 := yyvsc95 + yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.resize (yyvs95, yyvsc95)
		end
	end
	yyvs95.put (yyval95, yyvsp95)
end
when 375 then
--|#line 1750 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1750")
end

yyval95 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp95 := yyvsp95 + 1
	yyvsp88 := yyvsp88 -1
	if yyvsp95 >= yyvsc95 then
		if yyvs95 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs95")
			end
			create yyspecial_routines95
			yyvsc95 := yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.make (yyvsc95)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs95")
			end
			yyvsc95 := yyvsc95 + yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.resize (yyvs95, yyvsc95)
		end
	end
	yyvs95.put (yyval95, yyvsp95)
end
when 376 then
--|#line 1751 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1751")
end

yyval95 := yyvs92.item (yyvsp92) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp95 := yyvsp95 + 1
	yyvsp92 := yyvsp92 -1
	if yyvsp95 >= yyvsc95 then
		if yyvs95 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs95")
			end
			create yyspecial_routines95
			yyvsc95 := yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.make (yyvsc95)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs95")
			end
			yyvsc95 := yyvsc95 + yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.resize (yyvs95, yyvsc95)
		end
	end
	yyvs95.put (yyval95, yyvsp95)
end
when 377 then
--|#line 1754 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1754")
end

yyval96 := yyvs96.item (yyvsp96) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs96.put (yyval96, yyvsp96)
end
when 378 then
--|#line 1757 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1757")
end

yyval96 := yyvs96.item (yyvsp96) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs96.put (yyval96, yyvsp96)
end
when 379 then
--|#line 1760 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1760")
end

create yyval96.make_optional_rest (yyvs97.item (yyvsp97), yyvs96.item (yyvsp96)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp97 := yyvsp97 -1
	yyvs96.put (yyval96, yyvsp96)
end
when 380 then
--|#line 1764 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1764")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp96 := yyvsp96 + 1
	if yyvsp96 >= yyvsc96 then
		if yyvs96 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs96")
			end
			create yyspecial_routines96
			yyvsc96 := yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.make (yyvsc96)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs96")
			end
			yyvsc96 := yyvsc96 + yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.resize (yyvs96, yyvsc96)
		end
	end
	yyvs96.put (yyval96, yyvsp96)
end
when 381 then
--|#line 1765 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1765")
end

create yyval96.make_optional_first (yyvs96.item (yyvsp96), yyvs97.item (yyvsp97)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp97 := yyvsp97 -1
	yyvs96.put (yyval96, yyvsp96)
end
when 382 then
--|#line 1770 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1770")
end

yyval97 := yyvs81.item (yyvsp81) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp97 := yyvsp97 + 1
	yyvsp81 := yyvsp81 -1
	if yyvsp97 >= yyvsc97 then
		if yyvs97 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs97")
			end
			create yyspecial_routines97
			yyvsc97 := yyInitial_yyvs_size
			yyvs97 := yyspecial_routines97.make (yyvsc97)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs97")
			end
			yyvsc97 := yyvsc97 + yyInitial_yyvs_size
			yyvs97 := yyspecial_routines97.resize (yyvs97, yyvsc97)
		end
	end
	yyvs97.put (yyval97, yyvsp97)
end
when 383 then
--|#line 1771 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1771")
end

yyval97 := yyvs98.item (yyvsp98) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp97 := yyvsp97 + 1
	yyvsp98 := yyvsp98 -1
	if yyvsp97 >= yyvsc97 then
		if yyvs97 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs97")
			end
			create yyspecial_routines97
			yyvsc97 := yyInitial_yyvs_size
			yyvs97 := yyspecial_routines97.make (yyvsc97)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs97")
			end
			yyvsc97 := yyvsc97 + yyInitial_yyvs_size
			yyvs97 := yyspecial_routines97.resize (yyvs97, yyvsc97)
		end
	end
	yyvs97.put (yyval97, yyvsp97)
end
when 384 then
--|#line 1774 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1774")
end

yyval98 := yyvs99.item (yyvsp99) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp98 := yyvsp98 + 1
	yyvsp99 := yyvsp99 -1
	if yyvsp98 >= yyvsc98 then
		if yyvs98 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs98")
			end
			create yyspecial_routines98
			yyvsc98 := yyInitial_yyvs_size
			yyvs98 := yyspecial_routines98.make (yyvsc98)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs98")
			end
			yyvsc98 := yyvsc98 + yyInitial_yyvs_size
			yyvs98 := yyspecial_routines98.resize (yyvs98, yyvsc98)
		end
	end
	yyvs98.put (yyval98, yyvsp98)
end
when 385 then
--|#line 1775 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1775")
end

yyval98 := yyvs100.item (yyvsp100) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp98 := yyvsp98 + 1
	yyvsp100 := yyvsp100 -1
	if yyvsp98 >= yyvsc98 then
		if yyvs98 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs98")
			end
			create yyspecial_routines98
			yyvsc98 := yyInitial_yyvs_size
			yyvs98 := yyspecial_routines98.make (yyvsc98)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs98")
			end
			yyvsc98 := yyvsc98 + yyInitial_yyvs_size
			yyvs98 := yyspecial_routines98.resize (yyvs98, yyvsc98)
		end
	end
	yyvs98.put (yyval98, yyvsp98)
end
when 386 then
--|#line 1778 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1778")
end

create yyval99.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp99 := yyvsp99 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp99 >= yyvsc99 then
		if yyvs99 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs99")
			end
			create yyspecial_routines99
			yyvsc99 := yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.make (yyvsc99)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs99")
			end
			yyvsc99 := yyvsc99 + yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.resize (yyvs99, yyvsc99)
		end
	end
	yyvs99.put (yyval99, yyvsp99)
end
when 387 then
--|#line 1782 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1782")
end

create yyval100.make (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp100 := yyvsp100 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp100 >= yyvsc100 then
		if yyvs100 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs100")
			end
			create yyspecial_routines100
			yyvsc100 := yyInitial_yyvs_size
			yyvs100 := yyspecial_routines100.make (yyvsc100)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs100")
			end
			yyvsc100 := yyvsc100 + yyInitial_yyvs_size
			yyvs100 := yyspecial_routines100.resize (yyvs100, yyvsc100)
		end
	end
	yyvs100.put (yyval100, yyvsp100)
end
when 388 then
--|#line 1790 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1790")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp101 := yyvsp101 + 1
	yyvsp102 := yyvsp102 -1
	if yyvsp101 >= yyvsc101 then
		if yyvs101 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs101")
			end
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs101")
			end
			yyvsc101 := yyvsc101 + yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.resize (yyvs101, yyvsc101)
		end
	end
	yyvs101.put (yyval101, yyvsp101)
end
when 389 then
--|#line 1791 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1791")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp101 := yyvsp101 + 1
	yyvsp96 := yyvsp96 -1
	if yyvsp101 >= yyvsc101 then
		if yyvs101 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs101")
			end
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs101")
			end
			yyvsc101 := yyvsc101 + yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.resize (yyvs101, yyvsc101)
		end
	end
	yyvs101.put (yyval101, yyvsp101)
end
when 390 then
--|#line 1792 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1792")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp101 := yyvsp101 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp101 >= yyvsc101 then
		if yyvs101 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs101")
			end
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs101")
			end
			yyvsc101 := yyvsc101 + yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.resize (yyvs101, yyvsc101)
		end
	end
	yyvs101.put (yyval101, yyvsp101)
end
when 391 then
--|#line 1793 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1793")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp101 := yyvsp101 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp101 >= yyvsc101 then
		if yyvs101 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs101")
			end
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs101")
			end
			yyvsc101 := yyvsc101 + yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.resize (yyvs101, yyvsc101)
		end
	end
	yyvs101.put (yyval101, yyvsp101)
end
when 392 then
--|#line 1794 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1794")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp101 := yyvsp101 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp101 >= yyvsc101 then
		if yyvs101 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs101")
			end
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs101")
			end
			yyvsc101 := yyvsc101 + yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.resize (yyvs101, yyvsc101)
		end
	end
	yyvs101.put (yyval101, yyvsp101)
end
when 393 then
--|#line 1797 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1797")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp102 := yyvsp102 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp102 >= yyvsc102 then
		if yyvs102 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs102")
			end
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs102")
			end
			yyvsc102 := yyvsc102 + yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.resize (yyvs102, yyvsc102)
		end
	end
	yyvs102.put (yyval102, yyvsp102)
end
when 394 then
--|#line 1798 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1798")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp102 := yyvsp102 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp102 >= yyvsc102 then
		if yyvs102 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs102")
			end
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs102")
			end
			yyvsc102 := yyvsc102 + yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.resize (yyvs102, yyvsc102)
		end
	end
	yyvs102.put (yyval102, yyvsp102)
end
when 395 then
--|#line 1799 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1799")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp102 := yyvsp102 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp102 >= yyvsc102 then
		if yyvs102 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs102")
			end
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs102")
			end
			yyvsc102 := yyvsc102 + yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.resize (yyvs102, yyvsc102)
		end
	end
	yyvs102.put (yyval102, yyvsp102)
end
when 396 then
--|#line 1800 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1800")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp102 := yyvsp102 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp102 >= yyvsc102 then
		if yyvs102 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs102")
			end
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs102")
			end
			yyvsc102 := yyvsc102 + yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.resize (yyvs102, yyvsc102)
		end
	end
	yyvs102.put (yyval102, yyvsp102)
end
when 397 then
--|#line 1801 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1801")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp102 := yyvsp102 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp102 >= yyvsc102 then
		if yyvs102 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs102")
			end
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs102")
			end
			yyvsc102 := yyvsc102 + yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.resize (yyvs102, yyvsc102)
		end
	end
	yyvs102.put (yyval102, yyvsp102)
end
when 398 then
--|#line 1803 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1803")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
when 399 then
--|#line 1804 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1804")
end

yyval1 := yyvs72.item (yyvsp72) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp72 := yyvsp72 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
when 400 then
--|#line 1806 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1806")
end

create yyval72.make_plus 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp72 := yyvsp72 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp72 >= yyvsc72 then
		if yyvs72 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs72")
			end
			create yyspecial_routines72
			yyvsc72 := yyInitial_yyvs_size
			yyvs72 := yyspecial_routines72.make (yyvsc72)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs72")
			end
			yyvsc72 := yyvsc72 + yyInitial_yyvs_size
			yyvs72 := yyspecial_routines72.resize (yyvs72, yyvsc72)
		end
	end
	yyvs72.put (yyval72, yyvsp72)
end
when 401 then
--|#line 1807 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1807")
end

create yyval72.make_minus 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp72 := yyvsp72 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp72 >= yyvsc72 then
		if yyvs72 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs72")
			end
			create yyspecial_routines72
			yyvsc72 := yyInitial_yyvs_size
			yyvs72 := yyspecial_routines72.make (yyvsc72)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs72")
			end
			yyvsc72 := yyvsc72 + yyInitial_yyvs_size
			yyvs72 := yyspecial_routines72.resize (yyvs72, yyvsc72)
		end
	end
	yyvs72.put (yyval72, yyvsp72)
end
when 402 then
--|#line 1810 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1810")
end

yyval6 := True 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 then
		if yyvs6 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs6")
			end
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs6")
			end
			yyvsc6 := yyvsc6 + yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
		end
	end
	yyvs6.put (yyval6, yyvsp6)
end
when 403 then
--|#line 1811 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1811")
end

yyval6 := False 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 then
		if yyvs6 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs6")
			end
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs6")
			end
			yyvsc6 := yyvsc6 + yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
		end
	end
	yyvs6.put (yyval6, yyvsp6)
end
when 404 then
--|#line 1814 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1814")
end

yyval3 := last_character_constant 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs3.put (yyval3, yyvsp3)
end
when 405 then
--|#line 1817 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1817")
end

yyval4 := last_integer 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs4.put (yyval4, yyvsp4)
end
when 406 then
--|#line 1820 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1820")
end

yyval5 := last_real 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 407 then
--|#line 1826 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1826")
end

create yyval2.make_from_string(last_string_constant) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs2.put (yyval2, yyvsp2)
end
when 408 then
--|#line 1829 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1829")
end

create yyval2.make_from_string(last_string_constant) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs2.put (yyval2, yyvsp2)
end
when 409 then
--|#line 1831 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1831")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 410 then
--|#line 1833 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1833")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 411 then
--|#line 1836 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1836")
end

create yyval2.make_from_string(last_identifier) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 412 then
--|#line 1838 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1838")
end

create yyval2.make_from_string(last_identifier) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 413 then
--|#line 1958 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1958")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 414 then
--|#line 1959 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1959")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 415 then
--|#line 1960 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1960")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 416 then
--|#line 1962 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1962")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 417 then
--|#line 1964 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1964")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 418 then
--|#line 1966 "bon_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'bon_parser.y' at line 1966")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 589 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER]
			-- Template for `yytranslate'
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,  113,    2,    2,    2,    2,  114,
			  108,  109,   96,   94,  105,   95,  112,   97,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   83,  104,
			   88,   92,   90,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,  110,    2,  111,  100,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  106,    2,  107,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,

			   45,   46,   47,   48,   49,   50,   51,   52,   53,   54,
			   55,   56,   57,   58,   59,   60,   61,   62,   63,   64,
			   65,   66,   67,   68,   69,   70,   71,   72,   73,   74,
			   75,   76,   77,   78,   79,   80,   81,   82,   84,   85,
			   86,   87,   89,   91,   93,   98,   99,  101,  102,  103, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  155,  157,  158,  158,  156,  156,  156,  156,  156,
			  159,  159,  159,  159,  159,  159,  160,  162,  163,  163,
			  161,  164,  170,  170,  168,  140,  140,  142,  142,  178,
			  178,  175,  176,  177,  177,  174,  147,  147,  166,  167,
			  169,  169,  165,  171,  172,  173,  173,  133,  179,  184,
			  184,  181,  182,  183,  183,  180,  126,  126,  126,  185,
			  186,  186,  188,  188,  193,  193,  198,  198,  187,  189,
			  190,  190,  191,  192,  194,  195,  195,  196,  197,  199,
			  200,  200,  201,  202,  203,  204,  204,  124,  124,  124,
			  205,  141,  141,  141,  210,  210,  207,  208,  209,  209,

			  206,  211,  216,  216,  213,  214,  215,  215,  212,  217,
			  219,  219,  218,  220,  129,  129,  128,  128,  128,  222,
			  222,  221,  135,  136,  136,  134,  225,  228,  228,  223,
			  223,  223,  223,  224,  229,  118,  118,  227,  227,  226,
			  230,  143,  143,  143,  143,  117,  117,  116,  116,  270,
			  270,  231,  231,  232,  122,  122,  145,  145,  233,  249,
			  249,  252,  252,  251,  256,  256,  253,  254,  255,  255,
			  250,  250,  250,  257,  260,  260,  259,  259,  258,  262,
			  261,  261,  263,  125,  125,  268,  265,  266,  267,  267,
			  264,  264,  264,  264,  248,  248,  248,  149,  151,  153,

			  152,  154,  150,  148,  148,  127,  146,  146,  121,  144,
			  269,  278,  278,  272,  272,  271,  275,  276,  277,  277,
			  281,  282,  283,  283,  284,  279,  279,  313,  314,  315,
			  315,  316,  139,  139,  139,  139,  288,  288,  296,  296,
			  300,  300,  310,  310,  309,  311,  311,  311,  273,  274,
			  312,  280,  306,  307,  308,  308,  285,  285,  285,  285,
			  285,  294,  295,  297,  298,  299,  299,  301,  304,  304,
			  302,  303,  305,  305,  286,  287,  289,  289,  290,  290,
			  235,  235,  236,  237,  238,  239,  239,  234,  241,  241,
			  130,  130,  240,  242,  242,  243,  244,  245,  246,  246,

			  247,  247,  292,  292,  292,  292,  291,  291,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,  291,
			  291,  291,  291,  291,  291,  317,  318,  319,  319,  320,
			  320,  321,  322,  323,  323,  323,  323,  323,  328,  327,
			  327,  329,  330,  331,  331,  324,  324,  325,  326,  332,
			  332,  333,  334,  335,  336,  336,  337,  339,  340,  341,
			  341,  342,  346,  346,  347,  343,  344,  345,  345,  348,
			  348,  338,  349,  350,  351,  351,  351,  352,  353,  354,
			  355,  355,  356,  356,  357,  357,  358,  359,  360,  360,
			  360,  360,  360,  361,  361,  361,  361,  361,  363,  363,

			  293,  293,  115,  115,  119,  120,  123,  138,  137,  364,
			  365,  131,  132,  362,  362,  362,  366,  367,  368, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    8,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    2,    9,   10,   11,   12,   15,
			   21,   24,   29,   32,   35,   38,   39,    1,    1,    1,
			    1,    2,    2,    2,    2,    2,    2,    1,    2,    1,
			    4,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   10,    1,   17,   17,    2,    2,   39,   39,   17,    1,
			    1,    2,    1,   13,   14,   17,   17,   17,    2,    9,
			    2,   16,   17,   17,    1,    2,    1,    1,    1,    2,
			   17,    2,   14,    1,    2,    2,    2,    1,   17,    2,

			    1,    2,   42,   42,    2,    2,    1,   13,    2,    2,
			    2,    2,    2,   18,   18,    1,    2,    1,   19,   20,
			   20,   20,    1,    1,    1,    1,    1,    1,    2,    2,
			    7,    7,    7,   40,   41,   43,   44,   45,   46,   47,
			    1,   33,   34,   34,   34,    2,    2,   37,    1,   22,
			   23,   23,   23,    1,   25,   18,   16,    2,   20,    1,
			    2,    1,    2,    2,    2,    2,    2,    2,    1,    1,
			    2,   34,    1,    1,   30,   31,   31,   31,    1,    1,
			    1,   36,    2,   23,   20,    2,   25,   25,    1,   26,
			    1,    1,   19,    1,    6,    2,    1,    1,    4,    1,

			   55,   55,    1,   33,    2,   31,    1,    2,    1,    2,
			    1,   22,    1,   25,    2,   26,   26,    2,    1,   27,
			    2,    2,   39,    1,   49,   49,    1,    1,    4,    4,
			   72,    1,    7,    7,    1,    1,    2,    2,    1,    1,
			    2,    4,   54,   55,   55,   55,   56,   57,   57,   57,
			   59,   68,   68,   68,    1,    1,    4,   53,   53,    2,
			    1,   30,    2,    1,    2,    1,   26,    2,   27,   27,
			    2,    1,   28,    1,   42,   42,    2,    2,    2,   48,
			   49,   49,    6,    1,    4,    2,    2,    2,   68,   57,
			   57,    2,    2,    2,    2,    2,   58,   60,    1,    1,

			   55,    1,    1,   58,    1,    7,    7,   25,    1,   25,
			    2,    1,   27,    2,   28,   28,    2,    1,   42,    1,
			   50,   49,    1,    1,    6,   57,    1,    1,   62,    1,
			    1,    1,    2,   69,   71,   72,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    2,   69,   70,   72,    1,    4,
			    2,    2,    1,   28,    1,    2,   50,    1,    1,    6,
			    1,    1,    2,    2,   60,   61,   62,   62,    1,    1,
			   54,    1,    2,    1,    1,   51,   51,   48,   39,   68,
			   62,    1,    2,    2,   50,   51,   51,   52,   17,   63,

			   63,    1,    1,   51,    1,   65,   61,    1,   50,   65,
			   65,    1,   66,   66,   67,   52,   65,    1,   25,   25,
			    1,   64,   66,    1,   25,   39,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    6,    3,    4,    5,
			    2,    2,   64,   69,   72,   64,   64,   79,   80,   81,
			   81,   82,   83,   88,   81,   81,   81,   92,   93,   94,
			   96,  101,  102,    1,    1,   67,   50,    1,    1,    1,
			    1,    2,   77,   77,   78,    3,   81,    3,    4,   81,
			   96,   96,   97,   98,   99,  100,   81,   64,   69,    2,
			   18,   18,   84,   84,   85,   86,   87,    2,   89,   89,

			   90,    1,    5,   57,   77,    1,    1,    1,    1,    1,
			   96,    1,   81,   18,    1,    1,    1,   81,   81,   84,
			    1,   91,   91,   89,   53,   52,   78,    3,    4,    1,
			   79,    1,   52,   81,   88,   92,   95,   96,   81,    1,
			   81,    1,   81,   91,   91,    1,   52,    1,   73,   73,
			   97,    2,   81,   85,   91,    1,   90,    1,   73,   39,
			    1,    2,    1,    1,   74,   74,   74,   75,   81,    1,
			   18,   18,    1,    1,   64,   64,   76,   76,   76,   76,
			   74,   68,    1,   52,   64,   64,   64,    1,   75,    8,
			    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    5,    1,    2,    2,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    2,    2,    2,    2,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    0,    0,  114,    0,    0,    0,    0,    0,
			    0,    0,    0,  123,  121,    3,    1,    6,    7,   10,
			   11,   12,   13,   14,   15,    8,    5,    9,  413,  414,
			  415,  125,  412,  411,   37,   36,   22,  409,    0,    0,
			  118,  115,  119,  117,  116,   22,  418,   91,    0,   22,
			  417,   56,   22,   58,   57,   87,   22,   89,   88,  122,
			    2,    0,   23,   25,  416,    0,  120,    0,   25,   93,
			   92,   22,    0,   18,    0,   25,   25,   25,  124,    4,
			    0,   40,   24,   38,    0,   27,  410,  408,  127,   27,
			   25,    0,   17,   16,   27,   27,   27,    0,   39,   26,

			    0,   29,    0,  203,  102,   27,    0,   19,  110,   49,
			   60,   45,   47,   42,   43,    0,   28,    0,   33,   30,
			   31,    0,  113,  133,  142,  144,  143,    0,    0,    0,
			  200,    0,    0,  128,  132,  129,  130,  131,  151,  152,
			    0,  106,  103,  104,    0,   94,    0,    0,    0,   53,
			   50,   51,   29,    0,   62,   44,   41,    0,   32,   21,
			  135,    0,  206,  207,  204,   58,   57,  202,  154,  161,
			    0,  105,  101,    0,   98,   95,   96,    0,    0,  109,
			    0,  111,    0,   52,    0,   85,   61,   83,    0,   64,
			    0,    0,   34,  136,  119,  280,  205,  398,  203,  398,

			  162,  159,    0,  107,    0,   97,   90,   20,    0,    0,
			    0,   54,   48,   84,   72,   63,   68,   70,    0,   66,
			   46,   35,  137,    0,  135,  281,  401,  400,  208,    0,
			  399,    0,  199,  156,    0,  183,  256,  257,    0,    0,
			  258,  165,  168,  164,  166,    0,  171,  177,    0,  183,
			  172,  176,  259,  260,  194,  195,  196,  160,  203,  108,
			    0,   99,    0,    0,   55,    0,   69,   77,   65,   73,
			   75,    0,    0,  127,  138,  134,  288,  291,  290,  285,
			    0,  283,  145,  155,  405,  209,  157,  153,  254,    0,
			  252,  184,    0,  180,  291,  290,  179,  181,    0,    0,

			  167,  163,  175,  173,  398,  201,  156,  100,  407,  112,
			   86,    0,   74,   82,   67,   78,   80,   59,    0,    0,
			  287,  284,  282,  146,  147,  253,  178,  183,  182,  302,
			  303,  304,  277,    0,  276,  305,  317,  316,  315,  308,
			  307,  314,  313,  312,  310,  311,  309,  319,  318,  320,
			  324,  323,  322,  321,  279,    0,  278,  306,  174,    0,
			  158,   71,    0,   79,  139,  293,  289,    0,  148,  119,
			    0,  190,  192,  193,  191,  188,    0,  186,  274,  275,
			  169,  197,   76,    0,    0,  292,  294,  286,  149,  255,
			  187,  185,   81,  301,  300,    0,  296,  298,  211,  150,

			  140,  183,  295,  297,    0,    0,  189,    0,  218,  212,
			  216,  225,  213,  220,  222,  299,  217,    0,  119,  226,
			  398,    0,  221,    0,    0,  232,    0,  398,  398,  402,
			  339,  403,  340,  392,  390,  391,  393,  394,  395,  396,
			  331,  397,  214,  398,  305,  215,  325,  327,  330,  329,
			  332,    0,  333,  334,    0,  355,  336,  335,  369,  370,
			  389,  337,  388,    0,  210,  223,  219,  251,  235,  234,
			  233,    0,  224,  227,  229,    0,    0,  394,  395,  382,
			    0,  378,  380,  383,  384,  385,  372,  326,  398,  272,
			    0,  270,  345,  341,  343,  349,  350,  362,  353,  357,

			  359,  356,  406,  236,  232,  404,  371,    0,  398,  377,
			  379,  398,  373,  271,    0,  398,  398,    0,  346,  342,
			  398,  361,  363,  358,    0,  238,  230,  387,  386,  398,
			  328,    0,  352,    0,  375,  376,  351,  389,  347,  398,
			  338,    0,  367,    0,  365,    0,  237,    0,  239,  119,
			  381,  273,  348,  344,  366,  364,  360,    0,    0,  240,
			  398,    0,  261,  268,  241,  263,  242,  265,  368,    0,
			    0,    0,  398,  398,  245,  246,  243,  231,    0,  247,
			  264,  262,  269,  267,  248,  249,  250,  244,  266,    0,
			    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			  436,  369,  324,  194,  437,  438,  229,  198,  439,  365,
			  292,   52,  164,   41,   42,  393,   57,   58,  111,   13,
			   14,   59,  441,  207,  471,   85,   71,  101,  128,  286,
			  287,  167,   36,  129,  256,  130,  131,  132,  233,  306,
			  589,   15,   16,   60,   17,   18,   73,   74,   92,   19,
			   81,   82,   83,   62,   98,   63,  113,  114,  155,  118,
			  119,  120,  158,  121,   20,  149,  150,  151,  183,  152,
			   21,  154,  215,  189,  216,  266,  217,  268,  219,  269,
			  312,  270,  314,  272,  315,  363,  316,  186,  187,  213,
			   22,  174,  175,  176,  205,  177,   23,  141,  142,  143,

			  171,  144,   24,  181,  147,   25,   66,   67,  133,  134,
			  102,  274,  275,  103,  135,  136,  137,  138,  139,  279,
			  224,  225,  280,  281,  321,  394,  320,  385,  386,  395,
			  396,  403,  397,  257,  258,  242,  200,  201,  243,  244,
			  300,  245,  246,  247,  248,  249,  296,  250,  297,  375,
			  376,  377,  390,  328,  399,  400,  442,  421,  574,  575,
			  409,  410,  416,  405,  418,  419,  412,  413,  422,  414,
			  251,  252,  253,  525,  443,  488,  356,  334,  444,  548,
			  558,  549,  564,  565,  580,  566,  567,  490,  491,  571,
			  513,  289,  290,  325,  576,  577,  578,  579,  472,  473,

			  504,  474,  445,  446,  487,  447,  448,  449,  450,  517,
			  518,  540,  451,  452,  492,  493,  519,  494,  495,  496,
			  453,  454,  455,  456,  498,  499,  523,  500,  543,  544,
			  554,  521,  522,  457,  458,  459,  536,  460,  480,  481,
			  510,  482,  483,  484,  485,  461,  462,   27,  463,   39,
			   87,   28,   29,   30, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  659,  388,   37,  277,   65,   37,  277,   37,   37,   37,
			  277,   33,   70, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  348, -32768,  277,  381,
			 -32768, -32768,   88, -32768, -32768,  348, -32768,   32,  365,  348,
			 -32768, -32768,  348, -32768, -32768, -32768,  348, -32768, -32768,   88,
			  659,   78, -32768,  349, -32768,  313, -32768,  373,  349, -32768,
			 -32768,  348,   70, -32768,  355,  349,  349,  349, -32768, -32768,
			  301, -32768, -32768, -32768,  277,  321, -32768, -32768, -32768,  321,
			  349,  367,  365, -32768,  321,  321,  321,  277,  279, -32768,

			  277,  344,  346,  238,  288,  321,   33, -32768, -32768,  333,
			  335, -32768, -32768, -32768, -32768,   78, -32768,   33, -32768, -32768,
			 -32768,  343, -32768, -32768, -32768, -32768, -32768,   33,  359,   94,
			  329,  326,  352, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  277, -32768, -32768, -32768,  339,  308,  338,   57,   70, -32768,
			 -32768, -32768,  344,   70,  310,  263, -32768,  337,  344, -32768,
			  264,   70, -32768,  245, -32768, -32768, -32768, -32768,  255,  252,
			  324,  288, -32768,  277, -32768, -32768, -32768,  318,  277, -32768,
			   70, -32768,  319,  333,  314, -32768, -32768, -32768,  277,  325,
			  277,  277, -32768, -32768,   88,  235, -32768,    1, -32768,  334,

			 -32768,  -16,  277, -32768,  296,  308, -32768, -32768,  332,  317,
			  277, -32768, -32768,  231, -32768, -32768, -32768, -32768,  277,  315,
			 -32768, -32768,  312,   37,  264, -32768, -32768, -32768, -32768,  223,
			 -32768,  316, -32768,  277,   41,   70, -32768, -32768,  219,  216,
			 -32768, -32768, -32768, -32768, -32768,  217, -32768, -32768,  240,   70,
			 -32768,  -62, -32768, -32768,  214, -32768, -32768, -32768, -32768, -32768,
			   70, -32768,  313,   70, -32768,   70,  213, -32768, -32768, -32768,
			 -32768,  277,  280, -32768, -32768, -32768,  234, -32768, -32768, -32768,
			  208, -32768,  251, -32768, -32768, -32768, -32768, -32768, -32768,  207,
			 -32768, -32768,  200, -32768,  413,  390, -32768, -32768,  136,  528,

			  202, -32768, -32768, -32768,    1, -32768,  277, -32768, -32768, -32768,
			 -32768,  277,  199, -32768, -32768, -32768, -32768, -32768,  262,   70,
			 -32768,  198, -32768, -32768,  246,  188, -32768,   26, -32768, -32768,
			 -32768, -32768, -32768,  187, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  186, -32768, -32768,   80,  182,
			 -32768, -32768,  277,  184, -32768,  178, -32768,   37, -32768,   88,
			   41, -32768,  177, -32768, -32768, -32768,  175, -32768, -32768, -32768,
			 -32768, -32768, -32768,  277,   70, -32768, -32768, -32768,  179, -32768,
			  180, -32768, -32768, -32768, -32768,  171, -32768, -32768,  233, -32768,

			 -32768,   26, -32768,  170,   70,  205, -32768,   70, -32768, -32768,
			 -32768,  161,  212, -32768, -32768, -32768,  154,   70,   88, -32768,
			  203,  220,  205,   70,  139,  151,  239,   95,   95, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   95, -32768, -32768, -32768, -32768, -32768, -32768,
			  528,   78, -32768, -32768,   78, -32768,  125, -32768, -32768, -32768,
			 -32768, -32768, -32768,  190, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   41, -32768, -32768, -32768,  122,  498,  156,  155,  528,
			  119, -32768, -32768, -32768, -32768, -32768,  528,  116,   95, -32768,
			   90, -32768,  150, -32768, -32768, -32768, -32768,  104, -32768, -32768,

			 -32768, -32768, -32768,  -16,  236, -32768, -32768,   85,    1, -32768,
			  103,  203,  528,  102,   70,   95,   95,  138, -32768,   81,
			   95, -32768, -32768,   69,   70,   68, -32768, -32768, -32768,   95,
			 -32768,   78, -32768,  528,  575,  549, -32768,  -12, -32768,   95,
			 -32768,   78,  528,   58, -32768,   78, -32768,   64, -32768,   88,
			 -32768, -32768, -32768, -32768,   47, -32768, -32768,   70,   23,  -15,
			   95,  -23, -32768,   78, -32768, -32768,   19, -32768,  528,   41,
			    8,   70,  203,  203,   45, -32768, -32768, -32768,   36, -32768,
			  -15, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   60,
			   31, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768,  256, -390, -167, -164, -32768, -32768,    0,
			 -32768,  -51, -32768, -32768, -32768, -201,   -2,    6,  289,  418,
			 -395, -32768,   44, -116, -32768,  204, -32768,   97, -32768, -32768,
			  172, -32768,  243, -32768, -32768, -165, -32768, -32768, -32768, -32768,
			 -32768,  416, -32768, -32768, -32768, -32768,  383, -32768, -32768, -32768,
			  351, -32768, -32768, -32768, -32768,  -29, -32768, -32768, -32768,  311,
			 -32768, -32768, -32768,  320, -32768,  282, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  153, -32768, -32768, -32768,
			 -32768,  101, -32768, -32768, -32768, -32768,   73, -242, -32768, -32768,
			 -32768,  254, -32768, -32768, -32768, -32768, -32768,  284, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768,   28, -193, -32768, -32768,
			  181, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   76,
			 -32768, -32768, -32768, -32768, -32768, -261, -32768, -32768, -32768, -32768,
			 -32768, -32768, -403,  -67, -32768,   82, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  189, -32768, -281,   34,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -141,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   10,
			 -215, -32768, -32768, -32768,  133,  127, -32768, -32768, -148, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -159, -138, -32768, -32768,
			 -32768,  -52, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768,  -89, -368, -32768, -32768, -101, -32768, -475, -366, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -133, -32768, -32768,
			 -111, -32768, -32768, -32768, -32768, -32768, -32768, -142, -32768, -32768,
			 -32768, -32768, -32768, -113, -32768, -32768, -32768, -115, -32768, -32768,
			 -32768, -131, -32768, -32768, -32768, -32768, -32768, -32768, -173, -139,
			  135, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   34,  222,   43,   34,  415,   34,   34,   34,   35,   53,
			   44,   35,   56,   35,   35,   35,   68,   54,  307,  288,
			   75,  309,  276,   76,  231,  440,  231,   77,   26,   33,
			  228,  591,  228,  232,  293,  241,   33, -374,  477,  208,
			   33,  538,   90, -170,  240, -170,  374,   38,  293,  230,
			   46,  230,  208,  573,   50,  146, -374,  255,  366,   80,
			  590,  476,  479,  208,  552,  563,  157,  254,   33,  587,
			   40,  208,   91,   33,   70,  221,  160,  486,  163,  573,
			  572,   33,   64,  240,  180,  239,  259,   69,   26,  569,
			  179,  582, -374,  305,  264,  227,  226,   33, -354,  238,

			  371,   55,   37,   32,   53,  332,  435,  434,  433,   51,
			   32,  532,   54,   80,   32,   53,  440,  527,  237,  236,
			  374,  546,  512,   54,  239,   53,  373,  165,   99,  162,
			  562,  231,  432,   54,  431,  166,  430,  228,  238,  477,
			  359,  112,   32,  408,  116,   55,  332,   32,  182,  533,
			  335,  357,  560,  185,  542,  389,  230,  237,  236,    1,
			  235,  195,  466,  479,  557,  429,  276,  555,  583,   55,
			   51,   32,  515,  514,  547,  424,  388,  440,  440,  470,
			  209,  545,  331,  469,  170,  541,  104,  539,  234,  227,
			  226,  108,  109,  110,  568,  284,  502,  330,  329,  426,

			  373,  428,  145,  427,  584,  585, -354,  531,  529,  426,
			   37,  468,  520,  332,  435,  434,  433,  204,  516,  -22,
			  511,  277,   61,  331,  -22,  425,  509,  508,  507,  278,
			  227,  226,  214,  294,  112,  291,  505,  501,  330,  329,
			  432,  295,  431,  475,  430,  411,  467,  294,   45,  291,
			   47,   48,   49,  464, -141,  295,  288,  127,  423,  420,
			  185,  478,  267,  185,  470,  310,  126,  417,  469, -228,
			  125, -126,   89,  429,    1,  407, -228,  285,  404,   94,
			   95,   96,  402, -228,   37,  401,  391, -184,  384,  383,
			  331,  381,  368,  370,  105,  364,  468,  227,  226,  379,

			  378,  124,  357,  367,  362,  330,  329,  358,  323,  428,
			  327,  427,  123,  317,  319,  313,  326,  426,  311,  322,
			   86,  284,  304,  302,  301,  294,  193,  372,  357,  299,
			  283,  357,  298,  295,  273,  231,  265,  240,  357,  271,
			  262,  528,  263,  173,  260,  223,  218,  212,  210,  148,
			  285,  206,  140,  202,  581,  214,  559,  196,  199,  398,
			  230,  197,  478,  117,  357,  277,  191,  178,  190,  188,
			  169,  168,  172,  278, -198,  161,  159,  100,  239,  122,
			  153,   72,  294,  115,   97,  357,  106,   84,   93,   65,
			  295,   61,  238,  -88,  357,   88,   31,  308,  550,  294,

			  537,  372,  535,  556,  534,  294,  267,  295,  553, -174,
			  530,  237,  236,  295,  235,  526,  -89,  185,  -88,  503,
			  357,  588,  -88,  -88,  -88,  570,  355,  313,  227,  226,
			  -88,  333,  465,  586,  -88,  406,  524,  -88,  303,  -88,
			  380,  -89,  234,  387, -174,  -89,  -89,  -89,  -88,  489,
			  -88,  -88,  497,  -89,  318,  203,  392,  -89,  -88,  261,
			  -89,  -88,  -89,  382,  361,  211,  156,  -88,  -88,  192,
			  -88,  -89,  184,  -89,  -89,  107,   79,   78,  360,  220,
			  282,  -89,    0,    0,  -89,    0,    0,    0,    0,    0,
			  -89,  -89,    0,  -89,  -88,  -88,  -88,    0,    0,    0,

			  -88,  -88,    0,    0,    0,    0,    0,    0,  354,    0,
			    0,    0,  294,    0,    0,    0,    0,  -89,  -89,  -89,
			  295,    0,  294,  -89,  -89,    0,    0,    0,    0,  551,
			  295,    0,    0,    0,    0,    0,    0,    0,  354,  489,
			    0,    0,    0,  497,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  561,    0, -335,
			    0,  489,    0,    0,    0,    0,    0,    0,    0,  294,
			    0,    0,    0,    0,    0,    0,    0,  295,  353,  352,
			  351,  350,  349,  348,  347, -334,  346,  345,  344,  343,
			  342,  341,  227,  226,  340,  339,  338,  337,  336,    0,

			    0,    0,    0,    0,    0,    0,    0,  506,  353,  352,
			  351,  350,  349,  348,  347,    0,  346,  345,  344,  343,
			  342,  341,  227,  226,  340,  339,  338,  337,  336, -335,
			 -335, -335, -335, -335, -335, -335,    0, -335, -335, -335,
			 -335, -335, -335, -335, -335, -335, -335, -335, -335, -335,
			    0,    0,    0,    0,    0, -334, -334, -334, -334, -334,
			 -334, -334,    0, -334, -334, -334, -334, -334, -334, -334,
			 -334, -334, -334, -334, -334, -334,   12,    0,    0,   11,
			    0,    0,   10,    0,    0,    9,    0,    0,    0,    8,
			    0,    0,    0,    0,    0,    7,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    6,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    5,    4,    3,    0,    2,    0,
			    1, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    2,  194,    4,    5,  407,    7,    8,    9,    2,   11,
			    4,    5,   12,    7,    8,    9,   45,   11,  260,  234,
			   49,  263,  223,   52,  197,  420,  199,   56,    0,    3,
			  197,    0,  199,  198,  235,  199,    3,   49,  428,  178,
			    3,  516,   71,  105,    3,  107,  327,    3,  249,  197,
			    6,  199,  191,   34,   10,  106,   68,   73,  319,   61,
			    0,  427,  428,  202,  539,   80,  117,   83,    3,   33,
			    5,  210,   72,    3,   42,  191,  127,  443,  129,   34,
			   61,    3,   38,    3,   27,   44,  202,   55,   60,  112,
			   33,   83,  104,  258,  210,   94,   95,    3,    3,   58,

			   74,   75,    7,   77,  106,   10,   11,   12,   13,   76,
			   77,  514,  106,  115,   77,  117,  511,  507,   77,   78,
			  401,  524,  488,  117,   44,  127,  327,  129,   84,  129,
			  107,  304,   37,  127,   39,  129,   41,  304,   58,  529,
			  304,   97,   77,  404,  100,   75,   10,   77,  148,  515,
			  298,  299,  105,  153,  520,  370,  304,   77,   78,   71,
			   80,  161,  423,  529,  100,   70,  367,  109,  571,   75,
			   76,   77,   82,   83,  106,  417,  369,  572,  573,   28,
			  180,  112,   87,   32,  140,  104,   89,   49,  108,   94,
			   95,   94,   95,   96,  560,    5,    6,  102,  103,  114,

			  401,  106,  105,  108,  572,  573,    3,  105,  105,  114,
			    7,   60,  108,   10,   11,   12,   13,  173,   68,   40,
			  104,  223,   43,   87,   45,  418,  107,   72,   72,  223,
			   94,   95,  188,  235,  190,  235,  114,  112,  102,  103,
			   37,  235,   39,    4,   41,   40,  107,  249,    5,  249,
			    7,    8,    9,   33,   16,  249,  471,   19,  104,   47,
			  260,  428,  218,  263,   28,  265,   28,  106,   32,   33,
			   32,   33,   68,   70,   71,  105,   40,  233,   45,   75,
			   76,   77,  111,   47,    7,  105,  111,  110,  110,  105,
			   87,  109,   46,  105,   90,   33,   60,   94,   95,  113,

			  113,   63,  450,  105,  105,  102,  103,  105,   57,  106,
			  110,  108,   74,   33,   80,  271,  109,  114,  105,  111,
			    7,    5,  108,   83,  107,  327,   62,  327,  476,  113,
			  107,  479,  113,  327,   22,  508,  105,    3,  486,   24,
			    8,  508,   25,   35,   48,  110,   21,   33,   29,   16,
			  306,   33,   64,   29,  569,  311,  549,  112,  106,  388,
			  508,  106,  529,   19,  512,  367,   29,   29,  105,   59,
			   18,   45,   33,  367,   45,   16,   33,   56,   44,   33,
			   45,   16,  384,  104,   83,  533,   19,   38,   33,    8,
			  384,   43,   58,    3,  542,   22,    8,  262,  529,  401,

			  515,  401,  515,  545,  515,  407,  362,  401,  541,   75,
			  511,   77,   78,  407,   80,  504,    3,  417,   28,  471,
			  568,  580,   32,   33,   34,  563,  299,  383,   94,   95,
			   40,  298,  422,  574,   44,  401,  503,   47,  249,   49,
			  358,   28,  108,  367,  110,   32,   33,   34,   58,  451,
			   60,   61,  454,   40,  273,  171,  383,   44,   68,  205,
			   47,   71,   49,  362,  311,  183,  115,   77,   78,  158,
			   80,   58,  152,   60,   61,   92,   60,   59,  306,  190,
			  224,   68,   -1,   -1,   71,   -1,   -1,   -1,   -1,   -1,
			   77,   78,   -1,   80,  104,  105,  106,   -1,   -1,   -1,

			  110,  111,   -1,   -1,   -1,   -1,   -1,   -1,   10,   -1,
			   -1,   -1,  514,   -1,   -1,   -1,   -1,  104,  105,  106,
			  514,   -1,  524,  110,  111,   -1,   -1,   -1,   -1,  531,
			  524,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   10,  541,
			   -1,   -1,   -1,  545,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  557,   -1,   10,
			   -1,  563,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  571,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  571,   80,   81,
			   82,   83,   84,   85,   86,   10,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,   -1,

			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  109,   80,   81,
			   82,   83,   84,   85,   86,   -1,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,   80,
			   81,   82,   83,   84,   85,   86,   -1,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			   -1,   -1,   -1,   -1,   -1,   80,   81,   82,   83,   84,
			   85,   86,   -1,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,   17,   -1,   -1,   20,
			   -1,   -1,   23,   -1,   -1,   26,   -1,   -1,   -1,   30,
			   -1,   -1,   -1,   -1,   -1,   36,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   65,   66,   67,   -1,   69,   -1,
			   71, yyDummy>>)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [ANY]
			-- Stack for semantic values of type ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [ANY]
			-- Routines that ought to be in SPECIAL [ANY]

	yyvs2: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

	yyvs3: SPECIAL [CHARACTER]
			-- Stack for semantic values of type CHARACTER

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [CHARACTER]
			-- Routines that ought to be in SPECIAL [CHARACTER]

	yyvs4: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs5: SPECIAL [REAL]
			-- Stack for semantic values of type REAL

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [REAL]
			-- Routines that ought to be in SPECIAL [REAL]

	yyvs6: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs7: SPECIAL [STATIC_REF]
			-- Stack for semantic values of type STATIC_REF

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [STATIC_REF]
			-- Routines that ought to be in SPECIAL [STATIC_REF]

	yyvs8: SPECIAL [BON_SPECIFICATION]
			-- Stack for semantic values of type BON_SPECIFICATION

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [BON_SPECIFICATION]
			-- Routines that ought to be in SPECIAL [BON_SPECIFICATION]

	yyvs9: SPECIAL [SPECIFICATION_ELEMENT]
			-- Stack for semantic values of type SPECIFICATION_ELEMENT

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [SPECIFICATION_ELEMENT]
			-- Routines that ought to be in SPECIAL [SPECIFICATION_ELEMENT]

	yyvs10: SPECIAL [SPECIFICATION_ELEMENTS]
			-- Stack for semantic values of type SPECIFICATION_ELEMENTS

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [SPECIFICATION_ELEMENTS]
			-- Routines that ought to be in SPECIAL [SPECIFICATION_ELEMENTS]

	yyvs11: SPECIAL [INFORMAL_CHART]
			-- Stack for semantic values of type INFORMAL_CHART

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [INFORMAL_CHART]
			-- Routines that ought to be in SPECIAL [INFORMAL_CHART]

	yyvs12: SPECIAL [CLASS_DICTIONARY]
			-- Stack for semantic values of type CLASS_DICTIONARY

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [CLASS_DICTIONARY]
			-- Routines that ought to be in SPECIAL [CLASS_DICTIONARY]

	yyvs13: SPECIAL [DICTIONARY_ENTRY]
			-- Stack for semantic values of type DICTIONARY_ENTRY

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [DICTIONARY_ENTRY]
			-- Routines that ought to be in SPECIAL [DICTIONARY_ENTRY]

	yyvs14: SPECIAL [DICTIONARY_ENTRIES]
			-- Stack for semantic values of type DICTIONARY_ENTRIES

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [DICTIONARY_ENTRIES]
			-- Routines that ought to be in SPECIAL [DICTIONARY_ENTRIES]

	yyvs15: SPECIAL [SYSTEM_CHART]
			-- Stack for semantic values of type SYSTEM_CHART

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [SYSTEM_CHART]
			-- Routines that ought to be in SPECIAL [SYSTEM_CHART]

	yyvs16: SPECIAL [INDEX_CLAUSE]
			-- Stack for semantic values of type INDEX_CLAUSE

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [INDEX_CLAUSE]
			-- Routines that ought to be in SPECIAL [INDEX_CLAUSE]

	yyvs17: SPECIAL [INDEX_LIST]
			-- Stack for semantic values of type INDEX_LIST

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [INDEX_LIST]
			-- Routines that ought to be in SPECIAL [INDEX_LIST]

	yyvs18: SPECIAL [STRING_LIST]
			-- Stack for semantic values of type STRING_LIST

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [STRING_LIST]
			-- Routines that ought to be in SPECIAL [STRING_LIST]

	yyvs19: SPECIAL [CLUSTER_ENTRY]
			-- Stack for semantic values of type CLUSTER_ENTRY

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [CLUSTER_ENTRY]
			-- Routines that ought to be in SPECIAL [CLUSTER_ENTRY]

	yyvs20: SPECIAL [CLUSTER_ENTRIES]
			-- Stack for semantic values of type CLUSTER_ENTRIES

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [CLUSTER_ENTRIES]
			-- Routines that ought to be in SPECIAL [CLUSTER_ENTRIES]

	yyvs21: SPECIAL [CLUSTER_CHART]
			-- Stack for semantic values of type CLUSTER_CHART

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [CLUSTER_CHART]
			-- Routines that ought to be in SPECIAL [CLUSTER_CHART]

	yyvs22: SPECIAL [CLASS_ENTRY]
			-- Stack for semantic values of type CLASS_ENTRY

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [CLASS_ENTRY]
			-- Routines that ought to be in SPECIAL [CLASS_ENTRY]

	yyvs23: SPECIAL [CLASS_ENTRIES]
			-- Stack for semantic values of type CLASS_ENTRIES

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [CLASS_ENTRIES]
			-- Routines that ought to be in SPECIAL [CLASS_ENTRIES]

	yyvs24: SPECIAL [CLASS_CHART]
			-- Stack for semantic values of type CLASS_CHART

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [CLASS_CHART]
			-- Routines that ought to be in SPECIAL [CLASS_CHART]

	yyvs25: SPECIAL [CLASS_NAME_LIST]
			-- Stack for semantic values of type CLASS_NAME_LIST

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [CLASS_NAME_LIST]
			-- Routines that ought to be in SPECIAL [CLASS_NAME_LIST]

	yyvs26: SPECIAL [QUERY_LIST]
			-- Stack for semantic values of type QUERY_LIST

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [QUERY_LIST]
			-- Routines that ought to be in SPECIAL [QUERY_LIST]

	yyvs27: SPECIAL [COMMAND_LIST]
			-- Stack for semantic values of type COMMAND_LIST

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [COMMAND_LIST]
			-- Routines that ought to be in SPECIAL [COMMAND_LIST]

	yyvs28: SPECIAL [CONSTRAINT_LIST]
			-- Stack for semantic values of type CONSTRAINT_LIST

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [CONSTRAINT_LIST]
			-- Routines that ought to be in SPECIAL [CONSTRAINT_LIST]

	yyvs29: SPECIAL [EVENT_CHART]
			-- Stack for semantic values of type EVENT_CHART

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [EVENT_CHART]
			-- Routines that ought to be in SPECIAL [EVENT_CHART]

	yyvs30: SPECIAL [EVENT_ENTRY]
			-- Stack for semantic values of type EVENT_ENTRY

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [EVENT_ENTRY]
			-- Routines that ought to be in SPECIAL [EVENT_ENTRY]

	yyvs31: SPECIAL [EVENT_ENTRIES]
			-- Stack for semantic values of type EVENT_ENTRIES

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [EVENT_ENTRIES]
			-- Routines that ought to be in SPECIAL [EVENT_ENTRIES]

	yyvs32: SPECIAL [SCENARIO_CHART]
			-- Stack for semantic values of type SCENARIO_CHART

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [SCENARIO_CHART]
			-- Routines that ought to be in SPECIAL [SCENARIO_CHART]

	yyvs33: SPECIAL [SCENARIO_ENTRY]
			-- Stack for semantic values of type SCENARIO_ENTRY

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [SCENARIO_ENTRY]
			-- Routines that ought to be in SPECIAL [SCENARIO_ENTRY]

	yyvs34: SPECIAL [SCENARIO_ENTRIES]
			-- Stack for semantic values of type SCENARIO_ENTRIES

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [SCENARIO_ENTRIES]
			-- Routines that ought to be in SPECIAL [SCENARIO_ENTRIES]

	yyvs35: SPECIAL [CREATION_CHART]
			-- Stack for semantic values of type CREATION_CHART

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [CREATION_CHART]
			-- Routines that ought to be in SPECIAL [CREATION_CHART]

	yyvs36: SPECIAL [CREATION_ENTRY]
			-- Stack for semantic values of type CREATION_ENTRY

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [CREATION_ENTRY]
			-- Routines that ought to be in SPECIAL [CREATION_ENTRY]

	yyvs37: SPECIAL [CREATION_ENTRIES]
			-- Stack for semantic values of type CREATION_ENTRIES

	yyvsc37: INTEGER
			-- Capacity of semantic value stack `yyvs37'

	yyvsp37: INTEGER
			-- Top of semantic value stack `yyvs37'

	yyspecial_routines37: KL_SPECIAL_ROUTINES [CREATION_ENTRIES]
			-- Routines that ought to be in SPECIAL [CREATION_ENTRIES]

	yyvs38: SPECIAL [STATIC_DIAGRAM]
			-- Stack for semantic values of type STATIC_DIAGRAM

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [STATIC_DIAGRAM]
			-- Routines that ought to be in SPECIAL [STATIC_DIAGRAM]

	yyvs39: SPECIAL [COMMENT]
			-- Stack for semantic values of type COMMENT

	yyvsc39: INTEGER
			-- Capacity of semantic value stack `yyvs39'

	yyvsp39: INTEGER
			-- Top of semantic value stack `yyvs39'

	yyspecial_routines39: KL_SPECIAL_ROUTINES [COMMENT]
			-- Routines that ought to be in SPECIAL [COMMENT]

	yyvs40: SPECIAL [STATIC_COMPONENT]
			-- Stack for semantic values of type STATIC_COMPONENT

	yyvsc40: INTEGER
			-- Capacity of semantic value stack `yyvs40'

	yyvsp40: INTEGER
			-- Top of semantic value stack `yyvs40'

	yyspecial_routines40: KL_SPECIAL_ROUTINES [STATIC_COMPONENT]
			-- Routines that ought to be in SPECIAL [STATIC_COMPONENT]

	yyvs41: SPECIAL [UNSPECIFIED_STATIC_COMPONENT]
			-- Stack for semantic values of type UNSPECIFIED_STATIC_COMPONENT

	yyvsc41: INTEGER
			-- Capacity of semantic value stack `yyvs41'

	yyvsp41: INTEGER
			-- Top of semantic value stack `yyvs41'

	yyspecial_routines41: KL_SPECIAL_ROUTINES [UNSPECIFIED_STATIC_COMPONENT]
			-- Routines that ought to be in SPECIAL [UNSPECIFIED_STATIC_COMPONENT]

	yyvs42: SPECIAL [STATIC_COMPONENTS]
			-- Stack for semantic values of type STATIC_COMPONENTS

	yyvsc42: INTEGER
			-- Capacity of semantic value stack `yyvs42'

	yyvsp42: INTEGER
			-- Top of semantic value stack `yyvs42'

	yyspecial_routines42: KL_SPECIAL_ROUTINES [STATIC_COMPONENTS]
			-- Routines that ought to be in SPECIAL [STATIC_COMPONENTS]

	yyvs43: SPECIAL [CLUSTER_SPECIFICATION]
			-- Stack for semantic values of type CLUSTER_SPECIFICATION

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [CLUSTER_SPECIFICATION]
			-- Routines that ought to be in SPECIAL [CLUSTER_SPECIFICATION]

	yyvs44: SPECIAL [CLASS_SPECIFICATION]
			-- Stack for semantic values of type CLASS_SPECIFICATION

	yyvsc44: INTEGER
			-- Capacity of semantic value stack `yyvs44'

	yyvsp44: INTEGER
			-- Top of semantic value stack `yyvs44'

	yyspecial_routines44: KL_SPECIAL_ROUTINES [CLASS_SPECIFICATION]
			-- Routines that ought to be in SPECIAL [CLASS_SPECIFICATION]

	yyvs45: SPECIAL [STATIC_RELATION]
			-- Stack for semantic values of type STATIC_RELATION

	yyvsc45: INTEGER
			-- Capacity of semantic value stack `yyvs45'

	yyvsp45: INTEGER
			-- Top of semantic value stack `yyvs45'

	yyspecial_routines45: KL_SPECIAL_ROUTINES [STATIC_RELATION]
			-- Routines that ought to be in SPECIAL [STATIC_RELATION]

	yyvs46: SPECIAL [INHERITANCE_RELATION]
			-- Stack for semantic values of type INHERITANCE_RELATION

	yyvsc46: INTEGER
			-- Capacity of semantic value stack `yyvs46'

	yyvsp46: INTEGER
			-- Top of semantic value stack `yyvs46'

	yyspecial_routines46: KL_SPECIAL_ROUTINES [INHERITANCE_RELATION]
			-- Routines that ought to be in SPECIAL [INHERITANCE_RELATION]

	yyvs47: SPECIAL [CLIENT_RELATION]
			-- Stack for semantic values of type CLIENT_RELATION

	yyvsc47: INTEGER
			-- Capacity of semantic value stack `yyvs47'

	yyvsp47: INTEGER
			-- Top of semantic value stack `yyvs47'

	yyspecial_routines47: KL_SPECIAL_ROUTINES [CLIENT_RELATION]
			-- Routines that ought to be in SPECIAL [CLIENT_RELATION]

	yyvs48: SPECIAL [FORMAL_GENERIC]
			-- Stack for semantic values of type FORMAL_GENERIC

	yyvsc48: INTEGER
			-- Capacity of semantic value stack `yyvs48'

	yyvsp48: INTEGER
			-- Top of semantic value stack `yyvs48'

	yyspecial_routines48: KL_SPECIAL_ROUTINES [FORMAL_GENERIC]
			-- Routines that ought to be in SPECIAL [FORMAL_GENERIC]

	yyvs49: SPECIAL [FORMAL_GENERIC_LIST]
			-- Stack for semantic values of type FORMAL_GENERIC_LIST

	yyvsc49: INTEGER
			-- Capacity of semantic value stack `yyvs49'

	yyvsp49: INTEGER
			-- Top of semantic value stack `yyvs49'

	yyspecial_routines49: KL_SPECIAL_ROUTINES [FORMAL_GENERIC_LIST]
			-- Routines that ought to be in SPECIAL [FORMAL_GENERIC_LIST]

	yyvs50: SPECIAL [CLASS_TYPE]
			-- Stack for semantic values of type CLASS_TYPE

	yyvsc50: INTEGER
			-- Capacity of semantic value stack `yyvs50'

	yyvsp50: INTEGER
			-- Top of semantic value stack `yyvs50'

	yyspecial_routines50: KL_SPECIAL_ROUTINES [CLASS_TYPE]
			-- Routines that ought to be in SPECIAL [CLASS_TYPE]

	yyvs51: SPECIAL [ACTUAL_GENERICS]
			-- Stack for semantic values of type ACTUAL_GENERICS

	yyvsc51: INTEGER
			-- Capacity of semantic value stack `yyvs51'

	yyvsp51: INTEGER
			-- Top of semantic value stack `yyvs51'

	yyspecial_routines51: KL_SPECIAL_ROUTINES [ACTUAL_GENERICS]
			-- Routines that ought to be in SPECIAL [ACTUAL_GENERICS]

	yyvs52: SPECIAL [BON_TYPE]
			-- Stack for semantic values of type BON_TYPE

	yyvsc52: INTEGER
			-- Capacity of semantic value stack `yyvs52'

	yyvsp52: INTEGER
			-- Top of semantic value stack `yyvs52'

	yyspecial_routines52: KL_SPECIAL_ROUTINES [BON_TYPE]
			-- Routines that ought to be in SPECIAL [BON_TYPE]

	yyvs53: SPECIAL [TYPE_MARK]
			-- Stack for semantic values of type TYPE_MARK

	yyvsc53: INTEGER
			-- Capacity of semantic value stack `yyvs53'

	yyvsp53: INTEGER
			-- Top of semantic value stack `yyvs53'

	yyspecial_routines53: KL_SPECIAL_ROUTINES [TYPE_MARK]
			-- Routines that ought to be in SPECIAL [TYPE_MARK]

	yyvs54: SPECIAL [CLIENT_ENTITY]
			-- Stack for semantic values of type CLIENT_ENTITY

	yyvsc54: INTEGER
			-- Capacity of semantic value stack `yyvs54'

	yyvsp54: INTEGER
			-- Top of semantic value stack `yyvs54'

	yyspecial_routines54: KL_SPECIAL_ROUTINES [CLIENT_ENTITY]
			-- Routines that ought to be in SPECIAL [CLIENT_ENTITY]

	yyvs55: SPECIAL [CLIENT_ENTITIES]
			-- Stack for semantic values of type CLIENT_ENTITIES

	yyvsc55: INTEGER
			-- Capacity of semantic value stack `yyvs55'

	yyvsp55: INTEGER
			-- Top of semantic value stack `yyvs55'

	yyspecial_routines55: KL_SPECIAL_ROUTINES [CLIENT_ENTITIES]
			-- Routines that ought to be in SPECIAL [CLIENT_ENTITIES]

	yyvs56: SPECIAL [SUPPLIER_INDIRECTION]
			-- Stack for semantic values of type SUPPLIER_INDIRECTION

	yyvsc56: INTEGER
			-- Capacity of semantic value stack `yyvs56'

	yyvsp56: INTEGER
			-- Top of semantic value stack `yyvs56'

	yyspecial_routines56: KL_SPECIAL_ROUTINES [SUPPLIER_INDIRECTION]
			-- Routines that ought to be in SPECIAL [SUPPLIER_INDIRECTION]

	yyvs57: SPECIAL [FEATURE_NAME_LIST]
			-- Stack for semantic values of type FEATURE_NAME_LIST

	yyvsc57: INTEGER
			-- Capacity of semantic value stack `yyvs57'

	yyvsp57: INTEGER
			-- Top of semantic value stack `yyvs57'

	yyspecial_routines57: KL_SPECIAL_ROUTINES [FEATURE_NAME_LIST]
			-- Routines that ought to be in SPECIAL [FEATURE_NAME_LIST]

	yyvs58: SPECIAL [GENERIC_INDIRECTION]
			-- Stack for semantic values of type GENERIC_INDIRECTION

	yyvsc58: INTEGER
			-- Capacity of semantic value stack `yyvs58'

	yyvsp58: INTEGER
			-- Top of semantic value stack `yyvs58'

	yyspecial_routines58: KL_SPECIAL_ROUTINES [GENERIC_INDIRECTION]
			-- Routines that ought to be in SPECIAL [GENERIC_INDIRECTION]

	yyvs59: SPECIAL [PARENT_INDIRECTION]
			-- Stack for semantic values of type PARENT_INDIRECTION

	yyvsc59: INTEGER
			-- Capacity of semantic value stack `yyvs59'

	yyvsp59: INTEGER
			-- Top of semantic value stack `yyvs59'

	yyspecial_routines59: KL_SPECIAL_ROUTINES [PARENT_INDIRECTION]
			-- Routines that ought to be in SPECIAL [PARENT_INDIRECTION]

	yyvs60: SPECIAL [NAMED_INDIRECTION]
			-- Stack for semantic values of type NAMED_INDIRECTION

	yyvsc60: INTEGER
			-- Capacity of semantic value stack `yyvs60'

	yyvsp60: INTEGER
			-- Top of semantic value stack `yyvs60'

	yyspecial_routines60: KL_SPECIAL_ROUTINES [NAMED_INDIRECTION]
			-- Routines that ought to be in SPECIAL [NAMED_INDIRECTION]

	yyvs61: SPECIAL [INDIRECTION_ELEMENT]
			-- Stack for semantic values of type INDIRECTION_ELEMENT

	yyvsc61: INTEGER
			-- Capacity of semantic value stack `yyvs61'

	yyvsp61: INTEGER
			-- Top of semantic value stack `yyvs61'

	yyspecial_routines61: KL_SPECIAL_ROUTINES [INDIRECTION_ELEMENT]
			-- Routines that ought to be in SPECIAL [INDIRECTION_ELEMENT]

	yyvs62: SPECIAL [INDIRECTION_LIST]
			-- Stack for semantic values of type INDIRECTION_LIST

	yyvsc62: INTEGER
			-- Capacity of semantic value stack `yyvs62'

	yyvsp62: INTEGER
			-- Top of semantic value stack `yyvs62'

	yyspecial_routines62: KL_SPECIAL_ROUTINES [INDIRECTION_LIST]
			-- Routines that ought to be in SPECIAL [INDIRECTION_LIST]

	yyvs63: SPECIAL [CLASS_INTERFACE]
			-- Stack for semantic values of type CLASS_INTERFACE

	yyvsc63: INTEGER
			-- Capacity of semantic value stack `yyvs63'

	yyvsp63: INTEGER
			-- Top of semantic value stack `yyvs63'

	yyspecial_routines63: KL_SPECIAL_ROUTINES [CLASS_INTERFACE]
			-- Routines that ought to be in SPECIAL [CLASS_INTERFACE]

	yyvs64: SPECIAL [ASSERTION_CLAUSE_LIST]
			-- Stack for semantic values of type ASSERTION_CLAUSE_LIST

	yyvsc64: INTEGER
			-- Capacity of semantic value stack `yyvs64'

	yyvsp64: INTEGER
			-- Top of semantic value stack `yyvs64'

	yyspecial_routines64: KL_SPECIAL_ROUTINES [ASSERTION_CLAUSE_LIST]
			-- Routines that ought to be in SPECIAL [ASSERTION_CLAUSE_LIST]

	yyvs65: SPECIAL [CLASS_TYPE_LIST]
			-- Stack for semantic values of type CLASS_TYPE_LIST

	yyvsc65: INTEGER
			-- Capacity of semantic value stack `yyvs65'

	yyvsp65: INTEGER
			-- Top of semantic value stack `yyvs65'

	yyspecial_routines65: KL_SPECIAL_ROUTINES [CLASS_TYPE_LIST]
			-- Routines that ought to be in SPECIAL [CLASS_TYPE_LIST]

	yyvs66: SPECIAL [FEATURE_CLAUSE_LIST]
			-- Stack for semantic values of type FEATURE_CLAUSE_LIST

	yyvsc66: INTEGER
			-- Capacity of semantic value stack `yyvs66'

	yyvsp66: INTEGER
			-- Top of semantic value stack `yyvs66'

	yyspecial_routines66: KL_SPECIAL_ROUTINES [FEATURE_CLAUSE_LIST]
			-- Routines that ought to be in SPECIAL [FEATURE_CLAUSE_LIST]

	yyvs67: SPECIAL [FEATURE_CLAUSE]
			-- Stack for semantic values of type FEATURE_CLAUSE

	yyvsc67: INTEGER
			-- Capacity of semantic value stack `yyvs67'

	yyvsp67: INTEGER
			-- Top of semantic value stack `yyvs67'

	yyspecial_routines67: KL_SPECIAL_ROUTINES [FEATURE_CLAUSE]
			-- Routines that ought to be in SPECIAL [FEATURE_CLAUSE]

	yyvs68: SPECIAL [FEATURE_NAME]
			-- Stack for semantic values of type FEATURE_NAME

	yyvsc68: INTEGER
			-- Capacity of semantic value stack `yyvs68'

	yyvsp68: INTEGER
			-- Top of semantic value stack `yyvs68'

	yyspecial_routines68: KL_SPECIAL_ROUTINES [FEATURE_NAME]
			-- Routines that ought to be in SPECIAL [FEATURE_NAME]

	yyvs69: SPECIAL [OPERATOR]
			-- Stack for semantic values of type OPERATOR

	yyvsc69: INTEGER
			-- Capacity of semantic value stack `yyvs69'

	yyvsp69: INTEGER
			-- Top of semantic value stack `yyvs69'

	yyspecial_routines69: KL_SPECIAL_ROUTINES [OPERATOR]
			-- Routines that ought to be in SPECIAL [OPERATOR]

	yyvs70: SPECIAL [BINARY_OPERATOR]
			-- Stack for semantic values of type BINARY_OPERATOR

	yyvsc70: INTEGER
			-- Capacity of semantic value stack `yyvs70'

	yyvsp70: INTEGER
			-- Top of semantic value stack `yyvs70'

	yyspecial_routines70: KL_SPECIAL_ROUTINES [BINARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [BINARY_OPERATOR]

	yyvs71: SPECIAL [UNARY_OPERATOR]
			-- Stack for semantic values of type UNARY_OPERATOR

	yyvsc71: INTEGER
			-- Capacity of semantic value stack `yyvs71'

	yyvsp71: INTEGER
			-- Top of semantic value stack `yyvs71'

	yyspecial_routines71: KL_SPECIAL_ROUTINES [UNARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [UNARY_OPERATOR]

	yyvs72: SPECIAL [SIGN]
			-- Stack for semantic values of type SIGN

	yyvsc72: INTEGER
			-- Capacity of semantic value stack `yyvs72'

	yyvsp72: INTEGER
			-- Top of semantic value stack `yyvs72'

	yyspecial_routines72: KL_SPECIAL_ROUTINES [SIGN]
			-- Routines that ought to be in SPECIAL [SIGN]

	yyvs73: SPECIAL [RENAMING]
			-- Stack for semantic values of type RENAMING

	yyvsc73: INTEGER
			-- Capacity of semantic value stack `yyvs73'

	yyvsp73: INTEGER
			-- Top of semantic value stack `yyvs73'

	yyspecial_routines73: KL_SPECIAL_ROUTINES [RENAMING]
			-- Routines that ought to be in SPECIAL [RENAMING]

	yyvs74: SPECIAL [FEATURE_ARGUMENT_LIST]
			-- Stack for semantic values of type FEATURE_ARGUMENT_LIST

	yyvsc74: INTEGER
			-- Capacity of semantic value stack `yyvs74'

	yyvsp74: INTEGER
			-- Top of semantic value stack `yyvs74'

	yyspecial_routines74: KL_SPECIAL_ROUTINES [FEATURE_ARGUMENT_LIST]
			-- Routines that ought to be in SPECIAL [FEATURE_ARGUMENT_LIST]

	yyvs75: SPECIAL [FEATURE_ARGUMENT]
			-- Stack for semantic values of type FEATURE_ARGUMENT

	yyvsc75: INTEGER
			-- Capacity of semantic value stack `yyvs75'

	yyvsp75: INTEGER
			-- Top of semantic value stack `yyvs75'

	yyspecial_routines75: KL_SPECIAL_ROUTINES [FEATURE_ARGUMENT]
			-- Routines that ought to be in SPECIAL [FEATURE_ARGUMENT]

	yyvs76: SPECIAL [CONTRACT_CLAUSE]
			-- Stack for semantic values of type CONTRACT_CLAUSE

	yyvsc76: INTEGER
			-- Capacity of semantic value stack `yyvs76'

	yyvsp76: INTEGER
			-- Top of semantic value stack `yyvs76'

	yyspecial_routines76: KL_SPECIAL_ROUTINES [CONTRACT_CLAUSE]
			-- Routines that ought to be in SPECIAL [CONTRACT_CLAUSE]

	yyvs77: SPECIAL [FEATURE_SPECIFICATION_LIST]
			-- Stack for semantic values of type FEATURE_SPECIFICATION_LIST

	yyvsc77: INTEGER
			-- Capacity of semantic value stack `yyvs77'

	yyvsp77: INTEGER
			-- Top of semantic value stack `yyvs77'

	yyspecial_routines77: KL_SPECIAL_ROUTINES [FEATURE_SPECIFICATION_LIST]
			-- Routines that ought to be in SPECIAL [FEATURE_SPECIFICATION_LIST]

	yyvs78: SPECIAL [FEATURE_SPECIFICATION]
			-- Stack for semantic values of type FEATURE_SPECIFICATION

	yyvsc78: INTEGER
			-- Capacity of semantic value stack `yyvs78'

	yyvsp78: INTEGER
			-- Top of semantic value stack `yyvs78'

	yyspecial_routines78: KL_SPECIAL_ROUTINES [FEATURE_SPECIFICATION]
			-- Routines that ought to be in SPECIAL [FEATURE_SPECIFICATION]

	yyvs79: SPECIAL [ASSERTION_CLAUSE]
			-- Stack for semantic values of type ASSERTION_CLAUSE

	yyvsc79: INTEGER
			-- Capacity of semantic value stack `yyvs79'

	yyvsp79: INTEGER
			-- Top of semantic value stack `yyvs79'

	yyspecial_routines79: KL_SPECIAL_ROUTINES [ASSERTION_CLAUSE]
			-- Routines that ought to be in SPECIAL [ASSERTION_CLAUSE]

	yyvs80: SPECIAL [ASSERTION_COMMENT]
			-- Stack for semantic values of type ASSERTION_COMMENT

	yyvsc80: INTEGER
			-- Capacity of semantic value stack `yyvs80'

	yyvsp80: INTEGER
			-- Top of semantic value stack `yyvs80'

	yyspecial_routines80: KL_SPECIAL_ROUTINES [ASSERTION_COMMENT]
			-- Routines that ought to be in SPECIAL [ASSERTION_COMMENT]

	yyvs81: SPECIAL [BOOLEAN_EXPRESSION]
			-- Stack for semantic values of type BOOLEAN_EXPRESSION

	yyvsc81: INTEGER
			-- Capacity of semantic value stack `yyvs81'

	yyvsp81: INTEGER
			-- Top of semantic value stack `yyvs81'

	yyspecial_routines81: KL_SPECIAL_ROUTINES [BOOLEAN_EXPRESSION]
			-- Routines that ought to be in SPECIAL [BOOLEAN_EXPRESSION]

	yyvs82: SPECIAL [QUANTIFIER]
			-- Stack for semantic values of type QUANTIFIER

	yyvsc82: INTEGER
			-- Capacity of semantic value stack `yyvs82'

	yyvsp82: INTEGER
			-- Top of semantic value stack `yyvs82'

	yyspecial_routines82: KL_SPECIAL_ROUTINES [QUANTIFIER]
			-- Routines that ought to be in SPECIAL [QUANTIFIER]

	yyvs83: SPECIAL [QUANTIFICATION]
			-- Stack for semantic values of type QUANTIFICATION

	yyvsc83: INTEGER
			-- Capacity of semantic value stack `yyvs83'

	yyvsp83: INTEGER
			-- Top of semantic value stack `yyvs83'

	yyspecial_routines83: KL_SPECIAL_ROUTINES [QUANTIFICATION]
			-- Routines that ought to be in SPECIAL [QUANTIFICATION]

	yyvs84: SPECIAL [VARIABLE_RANGE_LIST]
			-- Stack for semantic values of type VARIABLE_RANGE_LIST

	yyvsc84: INTEGER
			-- Capacity of semantic value stack `yyvs84'

	yyvsp84: INTEGER
			-- Top of semantic value stack `yyvs84'

	yyspecial_routines84: KL_SPECIAL_ROUTINES [VARIABLE_RANGE_LIST]
			-- Routines that ought to be in SPECIAL [VARIABLE_RANGE_LIST]

	yyvs85: SPECIAL [VARIABLE_RANGE]
			-- Stack for semantic values of type VARIABLE_RANGE

	yyvsc85: INTEGER
			-- Capacity of semantic value stack `yyvs85'

	yyvsp85: INTEGER
			-- Top of semantic value stack `yyvs85'

	yyspecial_routines85: KL_SPECIAL_ROUTINES [VARIABLE_RANGE]
			-- Routines that ought to be in SPECIAL [VARIABLE_RANGE]

	yyvs86: SPECIAL [MEMBER_RANGE]
			-- Stack for semantic values of type MEMBER_RANGE

	yyvsc86: INTEGER
			-- Capacity of semantic value stack `yyvs86'

	yyvsp86: INTEGER
			-- Top of semantic value stack `yyvs86'

	yyspecial_routines86: KL_SPECIAL_ROUTINES [MEMBER_RANGE]
			-- Routines that ought to be in SPECIAL [MEMBER_RANGE]

	yyvs87: SPECIAL [TYPE_RANGE]
			-- Stack for semantic values of type TYPE_RANGE

	yyvsc87: INTEGER
			-- Capacity of semantic value stack `yyvs87'

	yyvsp87: INTEGER
			-- Top of semantic value stack `yyvs87'

	yyspecial_routines87: KL_SPECIAL_ROUTINES [TYPE_RANGE]
			-- Routines that ought to be in SPECIAL [TYPE_RANGE]

	yyvs88: SPECIAL [CALL]
			-- Stack for semantic values of type CALL

	yyvsc88: INTEGER
			-- Capacity of semantic value stack `yyvs88'

	yyvsp88: INTEGER
			-- Top of semantic value stack `yyvs88'

	yyspecial_routines88: KL_SPECIAL_ROUTINES [CALL]
			-- Routines that ought to be in SPECIAL [CALL]

	yyvs89: SPECIAL [UNQUALIFIED_CALLS]
			-- Stack for semantic values of type UNQUALIFIED_CALLS

	yyvsc89: INTEGER
			-- Capacity of semantic value stack `yyvs89'

	yyvsp89: INTEGER
			-- Top of semantic value stack `yyvs89'

	yyspecial_routines89: KL_SPECIAL_ROUTINES [UNQUALIFIED_CALLS]
			-- Routines that ought to be in SPECIAL [UNQUALIFIED_CALLS]

	yyvs90: SPECIAL [UNQUALIFIED_CALL]
			-- Stack for semantic values of type UNQUALIFIED_CALL

	yyvsc90: INTEGER
			-- Capacity of semantic value stack `yyvs90'

	yyvsp90: INTEGER
			-- Top of semantic value stack `yyvs90'

	yyspecial_routines90: KL_SPECIAL_ROUTINES [UNQUALIFIED_CALL]
			-- Routines that ought to be in SPECIAL [UNQUALIFIED_CALL]

	yyvs91: SPECIAL [EXPRESSION_LIST]
			-- Stack for semantic values of type EXPRESSION_LIST

	yyvsc91: INTEGER
			-- Capacity of semantic value stack `yyvs91'

	yyvsp91: INTEGER
			-- Top of semantic value stack `yyvs91'

	yyspecial_routines91: KL_SPECIAL_ROUTINES [EXPRESSION_LIST]
			-- Routines that ought to be in SPECIAL [EXPRESSION_LIST]

	yyvs92: SPECIAL [OPERATOR_EXPRESSION]
			-- Stack for semantic values of type OPERATOR_EXPRESSION

	yyvsc92: INTEGER
			-- Capacity of semantic value stack `yyvs92'

	yyvsp92: INTEGER
			-- Top of semantic value stack `yyvs92'

	yyspecial_routines92: KL_SPECIAL_ROUTINES [OPERATOR_EXPRESSION]
			-- Routines that ought to be in SPECIAL [OPERATOR_EXPRESSION]

	yyvs93: SPECIAL [UNARY_EXPRESSION]
			-- Stack for semantic values of type UNARY_EXPRESSION

	yyvsc93: INTEGER
			-- Capacity of semantic value stack `yyvs93'

	yyvsp93: INTEGER
			-- Top of semantic value stack `yyvs93'

	yyspecial_routines93: KL_SPECIAL_ROUTINES [UNARY_EXPRESSION]
			-- Routines that ought to be in SPECIAL [UNARY_EXPRESSION]

	yyvs94: SPECIAL [BINARY_EXPRESSION]
			-- Stack for semantic values of type BINARY_EXPRESSION

	yyvsc94: INTEGER
			-- Capacity of semantic value stack `yyvs94'

	yyvsp94: INTEGER
			-- Top of semantic value stack `yyvs94'

	yyspecial_routines94: KL_SPECIAL_ROUTINES [BINARY_EXPRESSION]
			-- Routines that ought to be in SPECIAL [BINARY_EXPRESSION]

	yyvs95: SPECIAL [SET_EXPRESSION]
			-- Stack for semantic values of type SET_EXPRESSION

	yyvsc95: INTEGER
			-- Capacity of semantic value stack `yyvs95'

	yyvsp95: INTEGER
			-- Top of semantic value stack `yyvs95'

	yyspecial_routines95: KL_SPECIAL_ROUTINES [SET_EXPRESSION]
			-- Routines that ought to be in SPECIAL [SET_EXPRESSION]

	yyvs96: SPECIAL [ENUMERATED_SET]
			-- Stack for semantic values of type ENUMERATED_SET

	yyvsc96: INTEGER
			-- Capacity of semantic value stack `yyvs96'

	yyvsp96: INTEGER
			-- Top of semantic value stack `yyvs96'

	yyspecial_routines96: KL_SPECIAL_ROUTINES [ENUMERATED_SET]
			-- Routines that ought to be in SPECIAL [ENUMERATED_SET]

	yyvs97: SPECIAL [ENUMERATION_ELEMENT]
			-- Stack for semantic values of type ENUMERATION_ELEMENT

	yyvsc97: INTEGER
			-- Capacity of semantic value stack `yyvs97'

	yyvsp97: INTEGER
			-- Top of semantic value stack `yyvs97'

	yyspecial_routines97: KL_SPECIAL_ROUTINES [ENUMERATION_ELEMENT]
			-- Routines that ought to be in SPECIAL [ENUMERATION_ELEMENT]

	yyvs98: SPECIAL [BON_INTERVAL]
			-- Stack for semantic values of type BON_INTERVAL

	yyvsc98: INTEGER
			-- Capacity of semantic value stack `yyvs98'

	yyvsp98: INTEGER
			-- Top of semantic value stack `yyvs98'

	yyspecial_routines98: KL_SPECIAL_ROUTINES [BON_INTERVAL]
			-- Routines that ought to be in SPECIAL [BON_INTERVAL]

	yyvs99: SPECIAL [BON_INTEGER_INTERVAL]
			-- Stack for semantic values of type BON_INTEGER_INTERVAL

	yyvsc99: INTEGER
			-- Capacity of semantic value stack `yyvs99'

	yyvsp99: INTEGER
			-- Top of semantic value stack `yyvs99'

	yyspecial_routines99: KL_SPECIAL_ROUTINES [BON_INTEGER_INTERVAL]
			-- Routines that ought to be in SPECIAL [BON_INTEGER_INTERVAL]

	yyvs100: SPECIAL [CHARACTER_INTERVAL]
			-- Stack for semantic values of type CHARACTER_INTERVAL

	yyvsc100: INTEGER
			-- Capacity of semantic value stack `yyvs100'

	yyvsp100: INTEGER
			-- Top of semantic value stack `yyvs100'

	yyspecial_routines100: KL_SPECIAL_ROUTINES [CHARACTER_INTERVAL]
			-- Routines that ought to be in SPECIAL [CHARACTER_INTERVAL]

	yyvs101: SPECIAL [CONSTANT]
			-- Stack for semantic values of type CONSTANT

	yyvsc101: INTEGER
			-- Capacity of semantic value stack `yyvs101'

	yyvsp101: INTEGER
			-- Top of semantic value stack `yyvs101'

	yyspecial_routines101: KL_SPECIAL_ROUTINES [CONSTANT]
			-- Routines that ought to be in SPECIAL [CONSTANT]

	yyvs102: SPECIAL [MANIFEST_CONSTANT]
			-- Stack for semantic values of type MANIFEST_CONSTANT

	yyvsc102: INTEGER
			-- Capacity of semantic value stack `yyvs102'

	yyvsp102: INTEGER
			-- Top of semantic value stack `yyvs102'

	yyspecial_routines102: KL_SPECIAL_ROUTINES [MANIFEST_CONSTANT]
			-- Routines that ought to be in SPECIAL [MANIFEST_CONSTANT]

	yyvs103: SPECIAL [DYNAMIC_DIAGRAM]
			-- Stack for semantic values of type DYNAMIC_DIAGRAM

	yyvsc103: INTEGER
			-- Capacity of semantic value stack `yyvs103'

	yyvsp103: INTEGER
			-- Top of semantic value stack `yyvs103'

	yyspecial_routines103: KL_SPECIAL_ROUTINES [DYNAMIC_DIAGRAM]
			-- Routines that ought to be in SPECIAL [DYNAMIC_DIAGRAM]

	yyvs104: SPECIAL [DYNAMIC_COMPONENTS]
			-- Stack for semantic values of type DYNAMIC_COMPONENTS

	yyvsc104: INTEGER
			-- Capacity of semantic value stack `yyvs104'

	yyvsp104: INTEGER
			-- Top of semantic value stack `yyvs104'

	yyspecial_routines104: KL_SPECIAL_ROUTINES [DYNAMIC_COMPONENTS]
			-- Routines that ought to be in SPECIAL [DYNAMIC_COMPONENTS]

	yyvs105: SPECIAL [DYNAMIC_COMPONENT]
			-- Stack for semantic values of type DYNAMIC_COMPONENT

	yyvsc105: INTEGER
			-- Capacity of semantic value stack `yyvs105'

	yyvsp105: INTEGER
			-- Top of semantic value stack `yyvs105'

	yyspecial_routines105: KL_SPECIAL_ROUTINES [DYNAMIC_COMPONENT]
			-- Routines that ought to be in SPECIAL [DYNAMIC_COMPONENT]

	yyvs106: SPECIAL [SCENARIO_DESCRIPTION]
			-- Stack for semantic values of type SCENARIO_DESCRIPTION

	yyvsc106: INTEGER
			-- Capacity of semantic value stack `yyvs106'

	yyvsp106: INTEGER
			-- Top of semantic value stack `yyvs106'

	yyspecial_routines106: KL_SPECIAL_ROUTINES [SCENARIO_DESCRIPTION]
			-- Routines that ought to be in SPECIAL [SCENARIO_DESCRIPTION]

	yyvs107: SPECIAL [OBJECT_GROUP]
			-- Stack for semantic values of type OBJECT_GROUP

	yyvsc107: INTEGER
			-- Capacity of semantic value stack `yyvs107'

	yyvsp107: INTEGER
			-- Top of semantic value stack `yyvs107'

	yyspecial_routines107: KL_SPECIAL_ROUTINES [OBJECT_GROUP]
			-- Routines that ought to be in SPECIAL [OBJECT_GROUP]

	yyvs108: SPECIAL [OBJECT_STACK]
			-- Stack for semantic values of type OBJECT_STACK

	yyvsc108: INTEGER
			-- Capacity of semantic value stack `yyvs108'

	yyvsp108: INTEGER
			-- Top of semantic value stack `yyvs108'

	yyspecial_routines108: KL_SPECIAL_ROUTINES [OBJECT_STACK]
			-- Routines that ought to be in SPECIAL [OBJECT_STACK]

	yyvs109: SPECIAL [OBJECT]
			-- Stack for semantic values of type OBJECT

	yyvsc109: INTEGER
			-- Capacity of semantic value stack `yyvs109'

	yyvsp109: INTEGER
			-- Top of semantic value stack `yyvs109'

	yyspecial_routines109: KL_SPECIAL_ROUTINES [OBJECT]
			-- Routines that ought to be in SPECIAL [OBJECT]

	yyvs110: SPECIAL [MESSAGE_RELATION]
			-- Stack for semantic values of type MESSAGE_RELATION

	yyvsc110: INTEGER
			-- Capacity of semantic value stack `yyvs110'

	yyvsp110: INTEGER
			-- Top of semantic value stack `yyvs110'

	yyspecial_routines110: KL_SPECIAL_ROUTINES [MESSAGE_RELATION]
			-- Routines that ought to be in SPECIAL [MESSAGE_RELATION]

	yyvs111: SPECIAL [LABELED_ACTIONS]
			-- Stack for semantic values of type LABELED_ACTIONS

	yyvsc111: INTEGER
			-- Capacity of semantic value stack `yyvs111'

	yyvsp111: INTEGER
			-- Top of semantic value stack `yyvs111'

	yyspecial_routines111: KL_SPECIAL_ROUTINES [LABELED_ACTIONS]
			-- Routines that ought to be in SPECIAL [LABELED_ACTIONS]

	yyvs112: SPECIAL [LABELED_ACTION]
			-- Stack for semantic values of type LABELED_ACTION

	yyvsc112: INTEGER
			-- Capacity of semantic value stack `yyvs112'

	yyvsp112: INTEGER
			-- Top of semantic value stack `yyvs112'

	yyspecial_routines112: KL_SPECIAL_ROUTINES [LABELED_ACTION]
			-- Routines that ought to be in SPECIAL [LABELED_ACTION]

	yyvs113: SPECIAL [DYNAMIC_REF]
			-- Stack for semantic values of type DYNAMIC_REF

	yyvsc113: INTEGER
			-- Capacity of semantic value stack `yyvs113'

	yyvsp113: INTEGER
			-- Top of semantic value stack `yyvs113'

	yyspecial_routines113: KL_SPECIAL_ROUTINES [DYNAMIC_REF]
			-- Routines that ought to be in SPECIAL [DYNAMIC_REF]

	yyvs114: SPECIAL [OBJECT_NAME]
			-- Stack for semantic values of type OBJECT_NAME

	yyvsc114: INTEGER
			-- Capacity of semantic value stack `yyvs114'

	yyvsp114: INTEGER
			-- Top of semantic value stack `yyvs114'

	yyspecial_routines114: KL_SPECIAL_ROUTINES [OBJECT_NAME]
			-- Routines that ought to be in SPECIAL [OBJECT_NAME]

feature {NONE} -- Constants

	yyFinal: INTEGER = 591
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 115
			-- Number of tokens

	yyLast: INTEGER = 730
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 349
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 369
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class BON_PARSER

-- Local Variables :
-- mode :text
-- End :
