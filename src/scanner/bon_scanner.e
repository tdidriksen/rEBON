--
-- The Extended BON Toolsuite: BON Scanner
-- Copyright (C) 2001 Joseph Kiniry
-- All Rights Reserved
--

--
-- $Id: bon_scanner.l,v 1.2 2005/12/21 14:11:10 kiniry Exp $
--

note
	title:       "The Extended BON Tool Suite"
	description: "The BON Scanner."
	copyright:   "Copyright (c) 2001-2002 Joseph R. Kiniry and others, %
					% see file 'forum.txt'"
	license:     "Eiffel Forum License v1 (see forum.txt)"
	author:      "Joseph R. Kiniry <kiniry@acm.org>"
	revision:    "$Revision: 1.2 $"
	version:     "v2-2002"

class BON_SCANNER
	-- A scanner for the BON specification language.

inherit
	BON_SCANNER_SKELETON
		-- All core code for scanner is in the skeleton.

create
	make_scanner, scan_file

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= BINARY_OPERATOR_CONDITION)
		end

feature {NONE} -- Implementation

	yy_build_tables
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_template
			yy_chk := yy_chk_template
			yy_base := yy_base_template
			yy_def := yy_def_template
			yy_ec := yy_ec_template
			yy_meta := yy_meta_template
			yy_accept := yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
if yy_act <= 76 then
if yy_act <= 38 then
if yy_act <= 19 then
if yy_act <= 10 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 129 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 129")
end
last_token := ACTION_TOKEN
else
--|#line 130 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 130")
end
last_token := AND_TOKEN
end
else
--|#line 131 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 131")
end
last_token := CALLS_TOKEN
end
else
if yy_act = 4 then
--|#line 132 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 132")
end
last_token := CLASS_TOKEN
else
--|#line 133 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 133")
end
last_token := CLASS_CHART_TOKEN
end
end
else
if yy_act <= 8 then
if yy_act <= 7 then
if yy_act = 6 then
--|#line 134 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 134")
end
last_token := CLIENT_TOKEN
else
--|#line 135 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 135")
end
last_token := CLUSTER_TOKEN
end
else
--|#line 136 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 136")
end
last_token := CLUSTER_CHART_TOKEN
end
else
if yy_act = 9 then
--|#line 137 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 137")
end
last_token := COMMAND_TOKEN
else
--|#line 138 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 138")
end
last_token := COMPONENT_TOKEN
end
end
end
else
if yy_act <= 15 then
if yy_act <= 13 then
if yy_act <= 12 then
if yy_act = 11 then
--|#line 139 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 139")
end
last_token := CONCATENATOR_TOKEN
else
--|#line 140 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 140")
end
last_token := CONSTRAINT_TOKEN
end
else
--|#line 141 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 141")
end
last_token := CREATES_TOKEN
end
else
if yy_act = 14 then
--|#line 142 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 142")
end
last_token := CREATION_CHART_TOKEN
else
--|#line 144 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 144")
end
last_token := CREATOR_TOKEN
end
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 145 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 145")
end
last_token := CURRENT_TOKEN
else
--|#line 146 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 146")
end
last_token := DEFERRED_TOKEN
end
else
if yy_act = 18 then
--|#line 147 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 147")
end
last_token := DELTA_TOKEN
else
--|#line 148 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 148")
end
last_token := DESCRIPTION_TOKEN
end
end
end
end
else
if yy_act <= 29 then
if yy_act <= 24 then
if yy_act <= 22 then
if yy_act <= 21 then
if yy_act = 20 then
--|#line 149 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 149")
end
last_token := DICTIONARY_TOKEN
else
--|#line 150 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 150")
end
last_token := DYNAMIC_DIAGRAM_TOKEN
end
else
--|#line 151 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 151")
end
last_token := EFFECTIVE_TOKEN
end
else
if yy_act = 23 then
--|#line 152 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 152")
end
last_token := END_TOKEN
else
--|#line 153 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 153")
end
last_token := ENSURE_TOKEN
end
end
else
if yy_act <= 27 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 154 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 154")
end
last_token := EVENT_TOKEN
else
--|#line 155 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 155")
end
last_token := EVENT_CHART_TOKEN
end
else
--|#line 156 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 156")
end
last_token := EXISTS_TOKEN
end
else
if yy_act = 28 then
--|#line 157 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 157")
end
last_token := EXPLANATION_TOKEN
else
--|#line 159 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 159")
end
last_token := FALSE_TOKEN
end
end
end
else
if yy_act <= 34 then
if yy_act <= 32 then
if yy_act <= 31 then
if yy_act = 30 then
--|#line 160 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 160")
end
last_token := FEATURE_TOKEN
else
--|#line 161 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 161")
end
last_token := FOR_ALL_TOKEN
end
else
--|#line 162 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 162")
end
last_token := INCOMING_TOKEN
end
else
if yy_act = 33 then
--|#line 163 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 163")
end
last_token := INDEXING_TOKEN
else
--|#line 164 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 164")
end
last_token := INHERIT_TOKEN
end
end
else
if yy_act <= 36 then
if yy_act = 35 then
--|#line 165 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 165")
end
last_token := INTERFACED_TOKEN
else
--|#line 166 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 166")
end
last_token := INVARIANT_TOKEN
end
else
if yy_act = 37 then
--|#line 167 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 167")
end
last_token := INVOLVES_TOKEN
else
--|#line 168 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 168")
end
last_token := IT_HOLDS_TOKEN
end
end
end
end
end
else
if yy_act <= 57 then
if yy_act <= 48 then
if yy_act <= 43 then
if yy_act <= 41 then
if yy_act <= 40 then
if yy_act = 39 then
--|#line 169 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 169")
end
last_token := KEYWORD_PREFIX_TOKEN
else
--|#line 170 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 170")
end
last_token := MEMBER_OF_TOKEN
end
else
--|#line 171 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 171")
end
last_token := NAMELESS_TOKEN
end
else
if yy_act = 42 then
--|#line 173 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 173")
end
last_token := NOT_TOKEN
else
--|#line 174 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 174")
end
last_token := OBJECT_TOKEN
end
end
else
if yy_act <= 46 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 175 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 175")
end
last_token := OBJECT_GROUP_TOKEN
else
--|#line 176 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 176")
end
last_token := OBJECT_STACK_TOKEN
end
else
--|#line 177 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 177")
end
last_token := OLD_TOKEN
end
else
if yy_act = 47 then
--|#line 178 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 178")
end
last_token := OR_TOKEN
else
--|#line 179 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 179")
end
last_token := OUTGOING_TOKEN
end
end
end
else
if yy_act <= 53 then
if yy_act <= 51 then
if yy_act <= 50 then
if yy_act = 49 then
--|#line 180 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 180")
end
last_token := PART_TOKEN
else
--|#line 181 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 181")
end
last_token := PERSISTENT_TOKEN
end
else
--|#line 183 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 183")
end
last_token := QUERY_TOKEN
end
else
if yy_act = 52 then
--|#line 184 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 184")
end
last_token := REDEFINED_TOKEN
else
--|#line 185 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 185")
end
last_token := REQUIRE_TOKEN
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
--|#line 186 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 186")
end
last_token := RESULT_TOKEN
else
--|#line 188 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 188")
end
last_token := REUSED_TOKEN
end
else
if yy_act = 56 then
--|#line 189 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 189")
end
last_token := ROOT_TOKEN
else
--|#line 190 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 190")
end
last_token := SCENARIO_TOKEN
end
end
end
end
else
if yy_act <= 67 then
if yy_act <= 62 then
if yy_act <= 60 then
if yy_act <= 59 then
if yy_act = 58 then
--|#line 191 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 191")
end
last_token := SCENARIO_CHART_TOKEN
else
--|#line 192 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 192")
end
last_token := STATIC_DIAGRAM_TOKEN
end
else
--|#line 193 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 193")
end
last_token := STRING_MARKS_TOKEN
end
else
if yy_act = 61 then
--|#line 194 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 194")
end
last_token := SUCH_THAT_TOKEN
else
--|#line 195 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 195")
end
last_token := SYSTEM_CHART_TOKEN
end
end
else
if yy_act <= 65 then
if yy_act <= 64 then
if yy_act = 63 then
--|#line 196 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 196")
end
last_token := TRUE_TOKEN
else
--|#line 197 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 197")
end
last_token := VOID_TOKEN
end
else
--|#line 198 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 198")
end
last_token := XOR_TOKEN
end
else
if yy_act = 66 then
--|#line 208 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 208")
end

  -- declares a prefix operator
  last_token := PREFIX_TOKEN
  set_start_condition (UNARY_OPERATOR_DECLARATION_CONDITION)

else
--|#line 216 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 216")
end

  last_token := Double_quote_code
  set_start_condition (UNARY_OPERATOR_CONDITION)

end
end
end
else
if yy_act <= 72 then
if yy_act <= 70 then
if yy_act <= 69 then
if yy_act = 68 then
--|#line 227 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 227")
end

  last_token := DELTA_TOKEN
  last_free_operator := "delta"

else
--|#line 232 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 232")
end

  last_token := OLD_TOKEN
  last_free_operator := "old"

end
else
--|#line 237 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 237")
end

  last_token := NOT_TOKEN
  last_free_operator := "not"

end
else
if yy_act = 71 then
--|#line 242 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 242")
end

  last_token := Plus_code
  last_free_operator := "+"

else
--|#line 247 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 247")
end

  last_token := Minus_code
  last_free_operator := "-"

end
end
else
if yy_act <= 74 then
if yy_act = 73 then
--|#line 260 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 260")
end

  last_token := INFIX_TOKEN
  set_start_condition (BINARY_OPERATOR_DECLARATION_CONDITION)

else
--|#line 267 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 267")
end

  last_token := Double_quote_code
  set_start_condition (BINARY_OPERATOR_CONDITION)

end
else
if yy_act = 75 then
--|#line 275 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 275")
end

  last_token := Plus_code
  last_free_operator := "+"

else
--|#line 279 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 279")
end

  last_token := Minus_code
  last_free_operator := "-"

end
end
end
end
end
end
else
if yy_act <= 114 then
if yy_act <= 95 then
if yy_act <= 86 then
if yy_act <= 81 then
if yy_act <= 79 then
if yy_act <= 78 then
if yy_act = 77 then
--|#line 283 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 283")
end

  last_token := Star_code
  last_free_operator := "*"

else
--|#line 287 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 287")
end

  last_token := Slash_code
  last_free_operator := "/"

end
else
--|#line 291 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 291")
end

  last_token := Less_than_code
  last_free_operator := "<"

end
else
if yy_act = 80 then
--|#line 295 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 295")
end

  last_token := Greater_than_code
  last_free_operator := ">"

else
--|#line 299 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 299")
end

  last_token := LESS_THAN_OR_EQUAL_TOKEN
  last_free_operator := "<="

end
end
else
if yy_act <= 84 then
if yy_act <= 83 then
if yy_act = 82 then
--|#line 303 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 303")
end

  last_token := GREATER_THAN_OR_EQUAL_TOKEN
  last_free_operator := ">="

else
--|#line 307 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 307")
end

  last_token := Equal_code
  last_free_operator := "="

end
else
--|#line 311 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 311")
end

  last_token := NOT_EQUAL_TOKEN
  last_free_operator := "/="

end
else
if yy_act = 85 then
--|#line 315 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 315")
end

  last_token := DOUBLE_SLASH_TOKEN
  last_free_operator := "//"

else
--|#line 319 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 319")
end

  last_token := DOUBLE_BACKSLASH_TOKEN
  last_free_operator := "\\"

end
end
end
else
if yy_act <= 91 then
if yy_act <= 89 then
if yy_act <= 88 then
if yy_act = 87 then
--|#line 323 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 323")
end

  last_token := Caret_code
  last_free_operator := "^"

else
--|#line 327 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 327")
end

  last_token := OR_TOKEN
  last_free_operator := "or"

end
else
--|#line 331 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 331")
end

  last_token := XOR_TOKEN 
  last_free_operator := "xor"

end
else
if yy_act = 90 then
--|#line 335 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 335")
end

  last_token := AND_TOKEN 
  last_free_operator := "and"

else
--|#line 339 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 339")
end

  last_token := IMPLIES_TOKEN
  last_free_operator := "->"

end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 343 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 343")
end

  last_token := EQUIVALENT_TO_TOKEN
  last_free_operator := "<->"

else
--|#line 347 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 347")
end

  last_token := MEMBER_OF_TOKEN 
  last_free_operator := "member_of"

end
else
if yy_act = 94 then
--|#line 351 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 351")
end

  last_token := Colon_code
  last_free_operator := ":"

else
--|#line 359 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 359")
end

  last_token := Double_quote_code
  set_start_condition (INITIAL)

end
end
end
end
else
if yy_act <= 105 then
if yy_act <= 100 then
if yy_act <= 98 then
if yy_act <= 97 then
if yy_act = 96 then
--|#line 366 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 366")
end

else
--|#line 370 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 370")
end

  last_token := FREE_OPERATOR_TOKEN
  last_value := text
  last_free_operator := text

end
else
--|#line 386 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 386")
end

  -- Introduces comments
  last_token := DOUBLE_DASH_TOKEN
  set_start_condition (SIMPLE_STRING_CONDITION)

end
else
if yy_act = 99 then
--|#line 393 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 393")
end

  last_token := IMPLIES_TOKEN

else
--|#line 398 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 398")
end
last_token := Comma_code
end
end
else
if yy_act <= 103 then
if yy_act <= 102 then
if yy_act = 101 then
--|#line 401 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 401")
end
last_token := Semicolon_code
else
--|#line 403 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 403")
end
last_token := Left_parenthesis_code  -- Grouping of expressions,
end
else
--|#line 404 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 404")
end
last_token := Right_parenthesis_code -- multiplicity
end
else
if yy_act = 104 then
--|#line 405 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 405")
end
last_token := Left_bracket_code      -- Encloses generic
else
--|#line 406 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 406")
end
last_token := Right_bracket_code     -- parameters
end
end
end
else
if yy_act <= 110 then
if yy_act <= 108 then
if yy_act <= 107 then
if yy_act = 106 then
--|#line 407 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 407")
end
last_token := Left_brace_code        -- Encloses restricted export lists,
else
--|#line 408 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 408")
end
last_token := Right_brace_code       -- renaming, enumerated sets
end
else
--|#line 409 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 409")
end
last_token := Plus_code              -- Arithmetic operators 
end
else
if yy_act = 109 then
--|#line 410 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 410")
end
last_token := Minus_code
else
--|#line 411 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 411")
end
last_token := Star_code
end
end
else
if yy_act <= 112 then
if yy_act = 111 then
--|#line 412 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 412")
end
last_token := Slash_code
else
--|#line 413 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 413")
end
last_token := DOUBLE_SLASH_TOKEN     -- Integer division operator
end
else
if yy_act = 113 then
--|#line 414 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 414")
end
last_token := DOUBLE_BACKSLASH_TOKEN -- Modulo operator
else
--|#line 415 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 415")
end
last_token := Caret_code             -- Power operator, renaming 
end
end
end
end
end
else
if yy_act <= 133 then
if yy_act <= 124 then
if yy_act <= 119 then
if yy_act <= 117 then
if yy_act <= 116 then
if yy_act = 115 then
--|#line 416 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 416")
end
last_token := EQUIVALENT_TO_TOKEN    -- Logical equivalence 
else
--|#line 417 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 417")
end
last_token := LESS_THAN_OR_EQUAL_TOKEN
end
else
--|#line 418 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 418")
end
last_token := Less_than_code         -- Relational operators 
end
else
if yy_act = 118 then
--|#line 419 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 419")
end
last_token := GREATER_THAN_OR_EQUAL_TOKEN 
else
--|#line 420 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 420")
end
last_token := Greater_than_code
end
end
else
if yy_act <= 122 then
if yy_act <= 121 then
if yy_act = 120 then
--|#line 421 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 421")
end
last_token := Equal_code             -- Equality and non-equality  
else
--|#line 422 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 422")
end
last_token := NOT_EQUAL_TOKEN 
end
else
--|#line 423 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 423")
end
last_token := Dot_code               -- Feature calls, renaming,
end
else
if yy_act = 123 then
--|#line 426 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 426")
end
last_token := DOUBLE_DOT_TOKEN       -- Interval marker
else
--|#line 429 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 429")
end
last_token := Colon_code
end
end
end
else
if yy_act <= 129 then
if yy_act <= 127 then
if yy_act <= 126 then
if yy_act = 125 then
--|#line 431 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 431")
end
last_token := AGGREGATE_MARK_TOKEN   -- Indicates aggregate supplier
else
--|#line 435 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 435")
end
last_token := ELLIPSES_TOKEN
end
else
--|#line 441 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 441")
end

  -- Encloses character constants
  last_token := Single_quote_code
  set_start_condition (CHARACTER_CONDITION)

end
else
if yy_act = 128 then
--|#line 447 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 447")
end

  last_token := CHARACTER_TOKEN
  last_character_constant := text @ 1
  unread_character ('%'')

else
--|#line 453 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 453")
end

  last_token := Single_quote_code
  set_start_condition (INITIAL)

end
end
else
if yy_act <= 131 then
if yy_act = 130 then
--|#line 465 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 465")
end

  set_start_condition (INITIAL)
  last_token := SIMPLE_STRING_TOKEN
  last_value := text
  last_string_constant := text

else
--|#line 475 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 475")
end

  set_start_condition (INITIAL)
  last_token := SIMPLE_STRING_TOKEN
  last_value := ""
  last_string_constant := ""

end
else
if yy_act = 132 then
--|#line 486 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 486")
end

  set_start_condition (STRING_CONDITION)
  last_token := STRING_DELIMITER_TOKEN
  bon_buffer.wipe_out

else
--|#line 495 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 495")
end
append_text_to_string (bon_buffer)
end
end
end
end
else
if yy_act <= 142 then
if yy_act <= 138 then
if yy_act <= 136 then
if yy_act <= 135 then
if yy_act = 134 then
--|#line 501 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 501")
end
set_start_condition (CONCATENATE_CONDITION)
else
--|#line 505 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 505")
end

end
else
--|#line 510 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 510")
end
set_start_condition (STRING_CONDITION)
end
else
if yy_act = 137 then
--|#line 517 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 517")
end

  set_start_condition (END_OF_STRING_CONDITION)
  last_token := SIMPLE_STRING_TOKEN
  last_value := bon_buffer.twin
  last_string_constant := bon_buffer.twin
  debug ("GELEX")
	stdoutput.put_string ("Returning string '" + 
								  last_string_constant + "'%N")
  end
  unread_character ('%"')

else
--|#line 529 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 529")
end

  last_token := STRING_DELIMITER_TOKEN
  set_start_condition (INITIAL)

end
end
else
if yy_act <= 140 then
if yy_act = 139 then
--|#line 582 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 582")
end

  if (is_class_name (text)) then
	last_token := CLASS_NAME_TOKEN
  else if (is_cluster_name (text)) then
			last_token := CLUSTER_NAME_TOKEN
		 else
			last_token := ALL_CAPS_IDENTIFIER_TOKEN
		 end
  end
  last_value := text
  last_identifier := text

else
--|#line 595 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 595")
end

  if (is_class_name (text)) then
	last_token := CLASS_NAME_TOKEN
  else if (is_cluster_name (text)) then
			last_token := CLUSTER_NAME_TOKEN
		 else
			last_token := ALL_CAPS_IDENTIFIER_TOKEN
		 end
  end
  last_value := text
  last_identifier := text

end
else
if yy_act = 141 then
--|#line 610 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 610")
end

  if (is_feature_name (text)) then
	last_token := FEATURE_NAME_TOKEN
  else
	last_token := IDENTIFIER_TOKEN
  end
  last_value := text
  last_identifier := text

else
--|#line 620 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 620")
end

  if (is_feature_name (text)) then
	last_token := FEATURE_NAME_TOKEN
  else
	last_token := IDENTIFIER_TOKEN
  end
  last_value := text
  last_identifier := text

end
end
end
else
if yy_act <= 147 then
if yy_act <= 145 then
if yy_act <= 144 then
if yy_act = 143 then
--|#line 633 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 633")
end

  if (is_object_group_or_constant_name (text)) then
	last_token := OBJECT_GROUP_OR_CONSTANT_NAME_TOKEN
  else
	last_token := IDENTIFIER_TOKEN
  end
  last_value := text
  last_identifier := text

else
--|#line 643 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 643")
end

  if (is_object_group_or_constant_name (text)) then
	last_token := OBJECT_GROUP_OR_CONSTANT_NAME_TOKEN
  else
	last_token := IDENTIFIER_TOKEN
  end
  last_value := text
  last_identifier := text

end
else
--|#line 655 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 655")
end

  last_token := IDENTIFIER_TOKEN
  last_value := text
  last_identifier := text

end
else
if yy_act = 146 then
--|#line 661 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 661")
end

  last_token := IDENTIFIER_TOKEN
  last_value := text
  last_identifier := text

else
--|#line 671 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 671")
end

  last_token := REAL_TOKEN
  last_value := text.to_real
  last_real := text.to_real

end
end
else
if yy_act <= 149 then
if yy_act = 148 then
--|#line 677 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 677")
end

  last_token := INTEGER_TOKEN
  last_value := text.to_integer
  last_integer := text.to_integer

else
--|#line 693 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 693")
end
-- Just ignore whitespace.
end
else
if yy_act = 150 then
--|#line 697 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 697")
end
default_action
else
--|#line 0 "bon_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bon_scanner.l' at line 0")
end
default_action
end
end
end
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			terminate
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2400)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   22,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,
			   41,   42,   43,   44,   45,   46,   47,   48,   22,   49,
			   50,   51,   52,   53,   54,   50,   50,   55,   50,   56,
			   50,   57,   58,   59,   60,   61,   62,   63,   64,   50,
			   50,   50,   65,   50,   50,   66,   67,   69,   69,   75,
			   75,   78,   78,   82,  103,  103,   82,  512,   83,  105,
			   84,   83,  104,   84,  103,  103,  108,  106,   70,   70,
			  124,  109,  486,  115,  123,  453,  121,  110,  147,  111,
			  116,   85,  126,  413,   85,  112,  112,  112,  112,  366,

			  121,   86,   87,  365,   86,   87,   82,  176,  126,  260,
			   89,   90,  177,   91,  315,   92,  118,   93,  314,   94,
			   95,   96,  119,  119,  119,  119,  118,   97,  198,   98,
			  120,   99,  119,  119,  119,  119,  127,  127,  127,  127,
			  120,  103,  103,  100,  128,  101,  178,  129,  127,  127,
			  127,  127,  260,  179,  102,  110,  128,  104,  130,  186,
			  257,  122,  127,  127,  127,  127,  256,  255,  254,  126,
			  128,  131,  253,  135,  252,  126,  138,  136,  251,  126,
			  126,  198,  132,  126,  139,  133,  126,  148,  134,  121,
			  121,  126,  140,  137,  141,  126,  142,  126,  192,  186,

			  143,  126,  149,  185,  126,  184,  145,  126,  183,  182,
			  144,  181,  146,  126,  126,  151,  150,  126,  155,  126,
			  126,  180,  156,  126,  175,  152,  159,  126,  126,  126,
			  126,  153,  126,  174,  154,  157,  160,  126,  161,  158,
			  126,  126,  173,  126,  126,  126,  126,  172,  126,  126,
			  165,  170,  126,  170,  125,  162,  163,  126,  166,  117,
			  164,  110,  126,  111,  114,  126,  126,  112,  126,  112,
			  112,  112,  112,  187,  187,  187,  187,  570,  107,  104,
			  570,  188,  126,  119,   88,  190,  190,  190,  190,  119,
			  119,  119,  119,  191,   88,   80,   80,  193,  127,  127,

			  127,  127,  127,  127,  127,  127,  194,   76,   76,   74,
			  194,  127,  127,  127,  127,  127,  127,  127,  127,  194,
			  126,  200,  126,  194,  126,  202,  126,  126,  195,  126,
			   74,  126,  197,  203,  201,  199,   72,  207,  196,  216,
			  126,  126,  126,  126,  126,  204,   72,  126,  126,  126,
			  570,  570,  205,  206,  126,  208,  570,  126,  126,  126,
			  211,  209,  126,  126,  126,  570,  126,  126,  210,  126,
			  213,  570,  212,  126,  126,  214,  126,  126,  570,  570,
			  126,  217,  126,  126,  570,  570,  570,  126,  218,  126,
			  215,  126,  570,  570,  219,  220,  126,  126,  126,  126,

			  570,  570,  126,  126,  228,  222,  223,  126,  224,  126,
			  225,  221,  570,  126,  570,  570,  126,  126,  126,  126,
			  570,  126,  226,  126,  227,  570,  126,  126,  126,  126,
			  126,  230,  126,  570,  126,  126,  231,  229,  570,  126,
			  233,  234,  126,  126,  570,  232,  126,  126,  126,  126,
			  126,  126,  126,  126,  238,  126,  126,  126,  126,  239,
			  570,  126,  126,  126,  235,  236,  570,  126,  570,  126,
			  237,  570,  126,  245,  126,  240,  126,  126,  244,  126,
			  126,  126,  126,  570,  126,  126,  570,  126,  241,  570,
			  246,  243,  242,  247,  570,  126,  126,  570,  126,  126,

			  126,  126,  126,  126,  126,  570,  126,  126,  570,  190,
			  190,  190,  190,  570,  248,  126,  250,  259,  249,  187,
			  126,  570,  126,  126,  570,  187,  187,  187,  187,  112,
			  570,  570,  570,  258,  570,  187,  187,  187,  187,  190,
			  190,  190,  190,  188,  119,  570,  570,  191,  570,  570,
			  119,  119,  119,  119,  127,  127,  127,  127,  193,  570,
			  570,  570,  194,  127,  127,  127,  127,  127,  127,  127,
			  127,  194,  570,  570,  570,  194,  127,  127,  127,  127,
			  570,  126,  126,  126,  194,  264,  126,  126,  263,  261,
			  265,  126,  570,  267,  126,  126,  262,  126,  126,  570,

			  570,  126,  126,  126,  570,  266,  570,  570,  268,  570,
			  570,  126,  126,  126,  126,  271,  126,  126,  273,  570,
			  269,  126,  126,  270,  274,  126,  126,  570,  126,  126,
			  570,  272,  126,  276,  126,  126,  570,  126,  126,  126,
			  275,  570,  126,  278,  126,  126,  279,  126,  126,  277,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  570,
			  126,  570,  126,  570,  570,  281,  126,  126,  126,  280,
			  126,  126,  282,  126,  126,  126,  126,  283,  126,  126,
			  570,  570,  126,  126,  286,  284,  126,  570,  570,  126,
			  126,  126,  287,  126,  285,  570,  288,  126,  570,  126,

			  126,  289,  126,  290,  291,  570,  570,  126,  126,  126,
			  126,  292,  570,  294,  126,  126,  126,  126,  570,  126,
			  570,  570,  126,  126,  126,  293,  570,  297,  126,  296,
			  126,  126,  126,  295,  126,  126,  126,  298,  126,  126,
			  126,  126,  299,  126,  126,  570,  126,  126,  570,  126,
			  126,  570,  126,  126,  126,  570,  570,  126,  126,  126,
			  126,  300,  126,  301,  126,  302,  126,  570,  126,  126,
			  304,  303,  126,  126,  126,  570,  126,  126,  126,  126,
			  570,  126,  126,  126,  126,  126,  126,  306,  305,  570,
			  126,  308,  126,  126,  307,  570,  309,  570,  570,  126,

			  126,  126,  126,  126,  310,  570,  311,  126,  313,  126,
			  126,  570,  126,  126,  126,  570,  570,  570,  323,  570,
			  126,  570,  126,  126,  312,  187,  126,  570,  126,  126,
			  126,  187,  187,  187,  187,  190,  190,  190,  190,  258,
			  570,  570,  126,  259,  127,  127,  127,  127,  127,  127,
			  127,  127,  194,  570,  570,  570,  194,  316,  127,  127,
			  127,  127,  570,  126,  570,  126,  194,  126,  317,  126,
			  126,  126,  126,  318,  126,  126,  126,  570,  126,  319,
			  321,  570,  126,  126,  320,  126,  570,  322,  324,  325,
			  126,  126,  126,  126,  570,  126,  126,  126,  126,  126,

			  126,  126,  570,  126,  329,  126,  570,  331,  126,  570,
			  326,  327,  126,  126,  328,  126,  126,  570,  126,  570,
			  570,  126,  126,  126,  333,  126,  126,  570,  126,  126,
			  126,  330,  126,  332,  570,  126,  126,  338,  126,  126,
			  126,  126,  570,  570,  126,  126,  126,  335,  334,  126,
			  337,  570,  126,  126,  126,  126,  339,  126,  126,  340,
			  126,  126,  126,  126,  336,  126,  126,  126,  126,  126,
			  341,  126,  126,  126,  126,  126,  570,  126,  570,  570,
			  342,  126,  126,  126,  344,  126,  345,  343,  126,  126,
			  126,  126,  126,  126,  126,  570,  126,  347,  346,  126, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  350,  570,  348,  126,  126,  126,  570,  126,  570,  349,
			  126,  126,  126,  570,  351,  352,  570,  126,  126,  126,
			  126,  126,  126,  570,  570,  126,  126,  126,  353,  126,
			  354,  126,  126,  570,  570,  355,  126,  126,  126,  126,
			  357,  570,  570,  126,  126,  126,  126,  570,  358,  359,
			  126,  126,  356,  126,  126,  570,  126,  360,  126,  126,
			  361,  126,  126,  363,  126,  126,  570,  362,  126,  126,
			  126,  364,  126,  126,  570,  126,  126,  126,  126,  570,
			  570,  126,  127,  127,  127,  127,  570,  570,  126,  570,
			  194,  126,  570,  126,  127,  127,  127,  127,  570,  126,

			  570,  126,  194,  126,  367,  126,  370,  570,  369,  126,
			  372,  126,  570,  126,  126,  126,  126,  570,  570,  126,
			  126,  126,  368,  126,  371,  373,  570,  126,  570,  126,
			  126,  126,  374,  126,  126,  377,  126,  126,  126,  378,
			  126,  570,  570,  126,  126,  379,  126,  376,  375,  570,
			  126,  570,  126,  126,  126,  126,  381,  126,  126,  380,
			  126,  126,  383,  570,  126,  385,  126,  382,  126,  126,
			  126,  386,  126,  570,  126,  570,  126,  126,  126,  384,
			  126,  570,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  388,  126,  391,  126,  126,  126,  387,  392,  126,

			  126,  389,  126,  126,  126,  570,  126,  390,  126,  126,
			  393,  570,  126,  394,  126,  126,  126,  126,  126,  570,
			  126,  395,  126,  126,  570,  570,  126,  126,  570,  126,
			  397,  570,  126,  126,  570,  396,  570,  126,  126,  570,
			  126,  400,  398,  126,  126,  126,  126,  126,  570,  126,
			  402,  126,  126,  399,  126,  126,  126,  570,  126,  126,
			  126,  126,  401,  570,  570,  126,  126,  126,  403,  405,
			  570,  404,  126,  126,  126,  126,  126,  126,  407,  126,
			  126,  570,  409,  126,  126,  126,  406,  126,  126,  408,
			  126,  126,  410,  126,  126,  570,  126,  126,  570,  126,

			  570,  126,  411,  570,  126,  412,  570,  126,  570,  570,
			  126,  127,  127,  127,  127,  570,  570,  126,  570,  194,
			  127,  127,  127,  127,  415,  126,  126,  126,  194,  126,
			  126,  126,  417,  126,  418,  570,  126,  126,  126,  414,
			  126,  570,  570,  570,  419,  126,  126,  126,  126,  416,
			  570,  420,  570,  126,  126,  126,  126,  126,  126,  126,
			  570,  126,  126,  126,  126,  424,  570,  126,  422,  126,
			  126,  421,  570,  570,  126,  126,  423,  126,  126,  570,
			  126,  425,  570,  126,  126,  126,  427,  126,  126,  426,
			  126,  428,  126,  126,  570,  126,  429,  126,  126,  126,

			  126,  430,  126,  570,  570,  126,  431,  126,  126,  126,
			  126,  570,  126,  126,  570,  126,  126,  570,  126,  432,
			  126,  570,  570,  570,  126,  126,  126,  126,  570,  433,
			  126,  126,  126,  436,  126,  437,  434,  126,  438,  126,
			  126,  126,  126,  126,  570,  435,  570,  126,  439,  126,
			  126,  440,  126,  126,  570,  441,  126,  126,  126,  126,
			  126,  126,  443,  570,  126,  126,  570,  126,  570,  126,
			  126,  126,  126,  126,  126,  442,  570,  126,  126,  444,
			  126,  126,  126,  570,  570,  126,  570,  126,  445,  126,
			  126,  447,  126,  126,  446,  126,  126,  126,  126,  449,

			  570,  448,  570,  126,  126,  126,  451,  126,  126,  450,
			  452,  126,  126,  570,  126,  126,  570,  126,  126,  126,
			  570,  570,  570,  126,  126,  127,  127,  127,  127,  570,
			  570,  570,  455,  194,  126,  126,  126,  126,  126,  454,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  458,
			  126,  126,  456,  457,  570,  126,  126,  126,  126,  570,
			  459,  570,  570,  126,  126,  126,  126,  570,  126,  460,
			  126,  126,  126,  462,  126,  126,  126,  126,  463,  126,
			  126,  126,  126,  126,  570,  465,  126,  126,  126,  126,
			  126,  461,  464,  126,  126,  126,  126,  126,  126,  570,

			  570,  126,  126,  126,  466,  126,  126,  570,  467,  126,
			  126,  126,  126,  468,  126,  126,  126,  469,  126,  126,
			  126,  126,  126,  126,  126,  570,  126,  470,  570,  126,
			  570,  126,  126,  126,  471,  570,  473,  570,  126,  126,
			  126,  126,  126,  472,  126,  126,  126,  570,  126,  126,
			  570,  126,  474,  476,  570,  126,  479,  570,  475,  480,
			  126,  126,  126,  126,  126,  477,  126,  570,  478,  126,
			  126,  126,  570,  126,  126,  570,  126,  570,  126,  126,
			  482,  126,  570,  126,  481,  126,  126,  126,  484,  126,
			  570,  483,  126,  485,  126,  126,  126,  570,  487,  126,

			  570,  126,  126,  126,  126,  488,  126,  126,  126,  490,
			  570,  126,  126,  126,  126,  126,  492,  126,  126,  489,
			  570,  126,  126,  491,  126,  126,  126,  126,  126,  570,
			  126,  126,  493,  126,  126,  126,  496,  495,  126,  497,
			  126,  126,  126,  126,  494,  126,  126,  126,  126,  498,
			  126,  126,  570,  126,  126,  499,  126,  126,  126,  126,
			  126,  570,  126,  126,  126,  126,  126,  126,  126,  570,
			  126,  126,  126,  126,  126,  126,  570,  500,  126,  501,
			  126,  570,  126,  570,  570,  126,  502,  126,  126,  126,
			  570,  126,  126,  126,  126,  126,  126,  126,  570,  126,

			  570,  506,  126,  126,  503,  126,  126,  504,  505,  507,
			  570,  126,  126,  126,  126,  570,  126,  509,  126,  126,
			  508,  126,  126,  126,  126,  126,  126,  126,  126,  511,
			  126,  126,  570,  570,  126,  126,  126,  513,  510,  570,
			  570,  126,  570,  126,  126,  126,  126,  570,  514,  126,
			  126,  126,  126,  126,  126,  570,  126,  126,  517,  126,
			  126,  570,  126,  126,  126,  126,  520,  515,  516,  518,
			  519,  126,  126,  126,  126,  126,  523,  126,  126,  126,
			  126,  126,  126,  570,  126,  126,  126,  521,  126,  126,
			  126,  126,  126,  570,  126,  522,  126,  126,  126,  524,

			  570,  570,  126,  526,  126,  126,  126,  126,  525,  126,
			  126,  126,  126,  126,  126,  528,  570,  126,  126,  126,
			  570,  126,  126,  126,  527,  570,  126,  126,  529,  126,
			  126,  570,  126,  570,  126,  530,  126,  126,  126,  126,
			  531,  126,  126,  533,  126,  126,  126,  126,  126,  532,
			  126,  126,  126,  126,  126,  126,  534,  126,  535,  126,
			  570,  126,  536,  570,  126,  126,  126,  126,  537,  126,
			  570,  570,  126,  126,  126,  126,  126,  126,  126,  126,
			  540,  126,  570,  126,  126,  126,  539,  126,  570,  538,
			  570,  126,  126,  570,  126,  570,  542,  126,  126,  126, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  126,  126,  126,  541,  570,  126,  126,  126,  126,  543,
			  126,  126,  126,  544,  545,  126,  126,  570,  126,  126,
			  126,  126,  570,  126,  570,  570,  126,  570,  126,  546,
			  126,  126,  570,  126,  126,  570,  126,  126,  126,  126,
			  549,  570,  126,  547,  126,  126,  548,  550,  126,  126,
			  126,  126,  126,  126,  570,  126,  126,  126,  126,  126,
			  551,  126,  554,  126,  126,  126,  126,  570,  552,  126,
			  126,  126,  126,  126,  126,  553,  126,  126,  126,  126,
			  126,  126,  570,  570,  126,  126,  126,  555,  126,  126,
			  556,  126,  570,  126,  126,  126,  126,  561,  570,  557,

			  570,  126,  570,  126,  126,  126,  558,  126,  126,  126,
			  126,  126,  126,  126,  126,  570,  559,  126,  560,  570,
			  126,  126,  126,  126,  126,  126,  126,  563,  126,  570,
			  126,  126,  126,  562,  126,  126,  126,  126,  126,  565,
			  126,  126,  126,  126,  126,  126,  570,  126,  126,  564,
			  570,  126,  126,  126,  126,  570,  570,  126,  126,  567,
			  566,  126,  126,  126,  126,  126,  568,  126,  126,  126,
			  126,  126,  126,  126,  126,  569,  126,  570,  126,  570,
			  126,  570,  570,  570,  570,  126,  570,  126,  126,  570,
			  126,  570,  570,  570,  570,  570,  126,   68,   68,   68,

			   68,   68,   68,   68,   68,   68,   68,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,  113,  113,  113,
			  570,  570,  113,  113,  121,  121,  570,  121,  121,  121,
			  126,  126,  570,  126,  126,  126,  167,  167,  570,  167,
			  167,  167,  570,  167,  167,  167,  168,  570,  168,  168,

			  168,  168,  168,  168,  168,  168,  169,  169,  169,  169,
			  169,  169,  570,  169,  169,  169,  171,  171,  570,  171,
			  171,  171,  171,  171,  171,  171,  189,  189,  570,  189,
			  189,  189,  127,  127,  570,  127,  127,  127,  190,  190,
			  570,  190,  190,  190,   21,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,

			  570, yy_Dummy>>,
			1, 401, 2000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2400)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    3,    4,   11,
			   12,   11,   12,   15,   23,   23,   16,  486,   15,   32,
			   15,   16,   32,   16,   24,   24,   34,   32,    3,    4,
			   44,   34,  453,   38,   43,  413,   44,   35,   56,   35,
			   38,   15,   56,  366,   16,   35,   35,   35,   35,  315,

			   43,   15,   15,  314,   16,   16,   19,   92,   56,  260,
			   19,   19,   92,   19,  256,   19,   41,   19,  251,   19,
			   19,   19,   41,   41,   41,   41,   42,   19,  198,   19,
			   41,   19,   42,   42,   42,   42,   49,   49,   49,   49,
			   42,  103,  103,   19,   49,   19,   94,   49,   50,   50,
			   50,   50,  190,   94,   19,  104,   50,  104,   49,  186,
			  184,   42,   51,   51,   51,   51,  182,  181,  178,   52,
			   51,   51,  174,   52,  173,   53,   53,   52,  172,   53,
			   52,  127,   51,   52,   53,   51,   52,   57,   51,  120,
			  118,   57,   53,   52,   53,   53,   54,   55,  115,  110,

			   54,   55,   58,  107,   54,  102,   55,   57,  101,  100,
			   54,   99,   55,   58,   59,   59,   58,   55,   60,   58,
			   54,   96,   60,   61,   91,   59,   62,   61,   59,   60,
			   62,   59,   60,   87,   59,   60,   62,   64,   63,   61,
			   63,   64,   86,   61,   63,  126,   62,   85,   65,  126,
			   64,   78,   65,   77,   46,   63,   63,   64,   65,   40,
			   63,  111,  128,  111,   36,  126,  128,  112,   65,  111,
			  111,  111,  111,  112,  112,  112,  112,  113,   33,   30,
			   21,  112,  128,  119,   18,  113,  113,  113,  113,  119,
			  119,  119,  119,  113,   17,   14,   13,  119,  121,  121,

			  121,  121,  122,  122,  122,  122,  121,   10,    9,    8,
			  122,  123,  123,  123,  123,  124,  124,  124,  124,  123,
			  129,  130,  130,  124,  129,  132,  130,  131,  122,  132,
			    7,  131,  124,  132,  131,  129,    6,  134,  123,  140,
			  129,  134,  130,  140,  133,  132,    5,  131,  133,  132,
			    0,    0,  133,  133,  135,  135,    0,  134,  135,  140,
			  136,  135,  136,  137,  133,    0,  136,  137,  135,  138,
			  138,    0,  137,  138,  135,  139,  139,  141,    0,    0,
			  139,  141,  136,  137,    0,    0,    0,  142,  141,  138,
			  139,  142,    0,    0,  142,  143,  139,  141,  144,  143,

			    0,    0,  144,  143,  146,  145,  145,  142,  145,  146,
			  145,  144,    0,  146,    0,    0,  145,  147,  144,  143,
			    0,  147,  145,  148,  145,    0,  145,  148,  149,  146,
			  150,  148,  149,    0,  150,  151,  149,  147,    0,  151,
			  151,  152,  152,  148,    0,  150,  152,  153,  149,  154,
			  150,  153,  155,  154,  157,  151,  155,  156,  157,  158,
			    0,  156,  152,  158,  154,  155,    0,  153,    0,  154,
			  156,    0,  155,  162,  157,  159,  159,  156,  161,  158,
			  159,  160,  161,    0,  162,  160,    0,  162,  159,    0,
			  162,  160,  159,  163,    0,  163,  159,    0,  161,  163,

			  164,  160,  165,  166,  164,    0,  165,  166,    0,  189,
			  189,  189,  189,    0,  164,  163,  166,  189,  165,  187,
			  164,    0,  165,  166,    0,  187,  187,  187,  187,  188,
			    0,  191,    0,  187,    0,  188,  188,  188,  188,  191,
			  191,  191,  191,  188,  193,    0,    0,  191,    0,    0,
			  193,  193,  193,  193,  194,  194,  194,  194,  193,    0,
			    0,    0,  194,  195,  195,  195,  195,  196,  196,  196,
			  196,  195,    0,    0,    0,  196,  197,  197,  197,  197,
			    0,  199,  200,  201,  197,  199,  200,  201,  197,  195,
			  201,  202,    0,  203,  204,  202,  196,  203,  204,    0,

			    0,  199,  200,  201,    0,  202,    0,    0,  204,    0,
			    0,  202,  205,  203,  204,  206,  205,  206,  207,    0,
			  205,  206,  207,  205,  208,  209,  207,    0,  208,  209,
			    0,  206,  205,  210,  211,  210,    0,  206,  211,  210,
			  209,    0,  207,  212,  208,  209,  213,  212,  214,  211,
			  213,  212,  214,  215,  211,  210,  216,  215,  217,    0,
			  216,    0,  217,    0,    0,  216,  213,  212,  214,  215,
			  218,  219,  217,  215,  218,  219,  216,  218,  217,  220,
			    0,    0,  222,  220,  221,  219,  222,    0,    0,  221,
			  218,  219,  222,  221,  220,    0,  223,  224,    0,  220,

			  223,  224,  222,  225,  226,    0,    0,  225,  226,  221,
			  228,  227,    0,  228,  228,  229,  223,  224,    0,  229,
			    0,    0,  227,  225,  226,  227,    0,  231,  227,  230,
			  228,  231,  230,  229,  232,  229,  230,  233,  232,  234,
			  235,  233,  235,  234,  235,    0,  236,  231,    0,  237,
			  236,    0,  230,  237,  232,    0,    0,  233,  239,  234,
			  235,  236,  239,  237,  238,  238,  236,    0,  238,  237,
			  240,  239,  241,  242,  240,    0,  241,  242,  239,  243,
			    0,  245,  244,  243,  238,  245,  244,  242,  241,    0,
			  240,  244,  241,  242,  243,    0,  245,    0,    0,  243,

			  246,  245,  244,  247,  246,    0,  247,  247,  249,  248,
			  250,    0,  249,  248,  250,    0,    0,    0,  269,    0,
			  246,    0,  269,  247,  248,  258,  269,    0,  249,  248,
			  250,  258,  258,  258,  258,  259,  259,  259,  259,  258,
			    0,    0,  269,  259,  261,  261,  261,  261,  262,  262,
			  262,  262,  261,    0,    0,    0,  262,  261,  263,  263,
			  263,  263,    0,  264,    0,  265,  263,  264,  262,  265,
			  266,  267,  268,  264,  266,  267,  268,    0,  270,  265,
			  267,    0,  270,  264,  266,  265,    0,  268,  270,  271,
			  266,  267,  268,  271,    0,  272,  273,  271,  270,  272,

			  273,  274,    0,  277,  275,  274,    0,  277,  275,    0,
			  272,  273,  275,  271,  274,  272,  273,    0,  276,    0,
			    0,  274,  276,  277,  279,  278,  279,    0,  275,  278,
			  279,  276,  281,  278,    0,  280,  281,  284,  276,  280,
			  285,  284,    0,    0,  285,  278,  279,  281,  280,  282,
			  283,    0,  281,  282,  283,  280,  285,  284,  283,  286,
			  285,  288,  287,  286,  282,  288,  287,  286,  289,  282,
			  287,  290,  289,  291,  283,  290,    0,  291,    0,    0,
			  288,  288,  287,  286,  290,  292,  291,  289,  289,  292,
			  293,  290,  294,  291,  293,    0,  294,  293,  292,  295, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  296,    0,  294,  295,  296,  292,    0,  297,    0,  295,
			  293,  297,  294,    0,  297,  298,    0,  298,  299,  295,
			  296,  298,  299,    0,    0,  300,  301,  297,  299,  300,
			  301,  302,  303,    0,    0,  302,  303,  298,  299,  304,
			  304,    0,    0,  304,  305,  300,  301,    0,  305,  306,
			  307,  302,  303,  306,  307,    0,  309,  308,  310,  304,
			  309,  308,  310,  311,  305,  308,    0,  310,  311,  306,
			  307,  312,  311,  313,    0,  312,  309,  313,  310,    0,
			    0,  308,  316,  316,  316,  316,    0,    0,  311,    0,
			  316,  312,    0,  313,  317,  317,  317,  317,    0,  318,

			    0,  319,  317,  318,  316,  319,  320,    0,  318,  321,
			  322,  320,    0,  321,  322,  320,  323,    0,    0,  318,
			  323,  319,  317,  324,  321,  323,    0,  324,    0,  321,
			  322,  320,  324,  325,  326,  327,  323,  325,  326,  327,
			  329,    0,    0,  324,  329,  327,  328,  326,  325,    0,
			  328,    0,  330,  325,  326,  327,  330,  331,  332,  328,
			  329,  331,  332,    0,  333,  334,  328,  331,  333,  334,
			  338,  335,  330,    0,  338,    0,  335,  331,  332,  333,
			  335,    0,  337,  336,  333,  334,  337,  336,  339,  341,
			  338,  337,  339,  341,  342,  343,  335,  336,  342,  343,

			  340,  339,  337,  336,  340,    0,  344,  340,  339,  341,
			  344,    0,  345,  345,  342,  343,  345,  346,  347,    0,
			  340,  346,  347,  348,    0,    0,  344,  348,    0,  349,
			  348,    0,  345,  349,    0,  347,    0,  346,  347,    0,
			  350,  351,  349,  348,  350,  351,  353,  352,    0,  349,
			  353,  352,  355,  350,  354,  356,  355,    0,  354,  356,
			  350,  351,  352,    0,    0,  357,  353,  352,  354,  357,
			    0,  355,  355,  358,  354,  356,  360,  358,  359,  359,
			  360,    0,  361,  359,  361,  357,  358,  363,  361,  360,
			  362,  363,  362,  358,  362,    0,  360,  364,    0,  359,

			    0,  364,  363,    0,  361,  364,    0,  363,    0,    0,
			  362,  367,  367,  367,  367,    0,    0,  364,    0,  367,
			  368,  368,  368,  368,  370,  369,  370,  371,  368,  369,
			  370,  371,  373,  373,  374,    0,  372,  373,  374,  367,
			  372,    0,    0,    0,  375,  369,  370,  371,  375,  372,
			    0,  376,    0,  373,  374,  376,  372,  377,  378,  376,
			    0,  377,  378,  379,  375,  380,    0,  379,  378,  380,
			  381,  377,    0,    0,  381,  376,  379,  377,  378,    0,
			  382,  381,    0,  379,  382,  380,  383,  384,  383,  382,
			  381,  384,  383,  385,    0,  387,  386,  385,  386,  387,

			  382,  388,  386,    0,    0,  388,  389,  384,  383,  388,
			  389,    0,  390,  385,    0,  387,  390,    0,  386,  390,
			  391,    0,    0,    0,  391,  388,  389,  392,    0,  391,
			  393,  392,  390,  394,  393,  395,  392,  394,  396,  395,
			  391,  394,  396,  395,    0,  393,    0,  392,  397,  397,
			  393,  398,  398,  397,    0,  399,  398,  394,  396,  395,
			  399,  400,  401,    0,  399,  400,    0,  401,    0,  397,
			  402,  401,  398,  403,  402,  400,    0,  403,  404,  402,
			  399,  400,  404,    0,    0,  405,    0,  401,  403,  405,
			  402,  406,  407,  403,  405,  406,  407,  408,  404,  409,

			    0,  408,    0,  411,  409,  405,  411,  411,  409,  410,
			  412,  406,  407,    0,  410,  412,    0,  408,  410,  412,
			    0,    0,    0,  411,  409,  414,  414,  414,  414,    0,
			    0,    0,  416,  414,  410,  412,  415,  416,  417,  415,
			  415,  416,  417,  418,  419,  420,  421,  418,  419,  420,
			  421,  422,  418,  419,    0,  422,  415,  416,  417,    0,
			  422,    0,    0,  418,  419,  420,  421,    0,  423,  424,
			  424,  422,  423,  426,  424,  428,  425,  426,  427,  428,
			  425,  426,  429,  427,    0,  429,  429,  427,  423,  430,
			  424,  425,  428,  430,  431,  428,  425,  426,  431,    0,

			    0,  432,  429,  427,  430,  432,  433,    0,  433,  430,
			  433,  434,  435,  434,  431,  434,  435,  436,  437,  436,
			  438,  432,  437,  436,  438,    0,  433,  437,    0,  439,
			    0,  434,  435,  439,  438,    0,  440,    0,  437,  436,
			  438,  440,  441,  439,  442,  440,  441,    0,  442,  439,
			    0,  443,  441,  443,    0,  443,  445,    0,  442,  446,
			  445,  440,  441,  446,  442,  443,  444,    0,  444,  447,
			  444,  443,    0,  447,  448,    0,  445,    0,  448,  446,
			  449,  449,    0,  450,  448,  449,  444,  450,  451,  447,
			    0,  450,  451,  452,  448,  452,  451,    0,  454,  452,

			    0,  449,  454,  450,  456,  455,  454,  455,  456,  457,
			    0,  455,  451,  457,  458,  452,  459,  457,  458,  456,
			    0,  459,  454,  458,  456,  459,  460,  455,  461,    0,
			  460,  462,  461,  457,  458,  462,  464,  463,  463,  465,
			  464,  459,  463,  465,  462,  466,  460,  465,  461,  466,
			  467,  462,    0,  468,  467,  469,  464,  468,  463,  469,
			  471,    0,  470,  465,  471,  466,  470,  472,  473,    0,
			  467,  472,  473,  468,  475,  469,    0,  470,  475,  473,
			  471,    0,  470,    0,    0,  474,  474,  472,  473,  474,
			    0,  476,  477,  478,  475,  476,  477,  478,    0,  479,

			    0,  480,  480,  479,  476,  474,  480,  477,  479,  481,
			    0,  476,  477,  478,  481,    0,  482,  483,  481,  479,
			  482,  483,  480,  484,  487,  483,  485,  484,  487,  485,
			  485,  489,    0,    0,  481,  489,  482,  487,  484,    0,
			    0,  483,    0,  484,  487,  488,  485,    0,  488,  488,
			  494,  489,  490,  491,  494,    0,  490,  491,  492,  493,
			  492,    0,  495,  493,  492,  488,  495,  490,  491,  493,
			  494,  496,  490,  491,  497,  496,  499,  499,  497,  493,
			  492,  499,  495,    0,  500,  498,  501,  497,  500,  498,
			  501,  496,  502,    0,  497,  498,  502,  499,  503,  501,

			    0,    0,  503,  504,  500,  498,  501,  504,  503,  505,
			  506,  504,  502,  505,  506,  507,    0,  507,  503,  510,
			    0,  507,  509,  510,  505,    0,  509,  504,  508,  505,
			  506,    0,  508,    0,  513,  509,  508,  507,  513,  510,
			  511,  516,  509,  514,  511,  516,  515,  514,  511,  513,
			  515,  514,  508,  518,  513,  517,  515,  518,  517,  517,
			    0,  516,  518,    0,  511,  519,  515,  514,  520,  519,
			    0,    0,  520,  518,  521,  517,  520,  522,  521,  523,
			  524,  522,    0,  523,  524,  519,  522,  525,    0,  521,
			    0,  525,  520,    0,  521,    0,  526,  522,  526,  523, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  524,  527,  526,  525,    0,  527,  528,  525,  530,  528,
			  528,  529,  530,  529,  530,  529,  531,    0,  526,  532,
			  531,  527,    0,  532,    0,    0,  528,    0,  530,  531,
			  533,  529,    0,  534,  533,    0,  531,  534,  536,  532,
			  535,    0,  536,  533,  535,  537,  534,  537,  535,  537,
			  533,  538,  539,  534,    0,  538,  539,  541,  536,  540,
			  540,  541,  543,  540,  535,  537,  543,    0,  541,  542,
			  543,  538,  539,  542,  544,  542,  545,  541,  544,  540,
			  545,  548,    0,    0,  546,  548,  543,  544,  546,  542,
			  545,  547,    0,  551,  544,  547,  545,  551,    0,  546,

			    0,  548,    0,  549,  546,  550,  547,  549,  552,  550,
			  553,  547,  552,  551,  553,    0,  549,  556,  550,    0,
			  554,  556,  557,  549,  554,  550,  557,  555,  552,    0,
			  553,  555,  558,  554,  559,  555,  558,  556,  559,  560,
			  554,  561,  557,  560,  562,  561,    0,  560,  562,  559,
			    0,  555,  558,  564,  559,    0,    0,  564,  563,  562,
			  561,  561,  563,  560,  562,  566,  563,  565,  567,  566,
			  568,  565,  567,  564,  568,  565,  569,    0,  563,    0,
			  569,    0,    0,    0,    0,  566,    0,  565,  567,    0,
			  568,    0,    0,    0,    0,    0,  569,  571,  571,  571,

			  571,  571,  571,  571,  571,  571,  571,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  573,  573,  573,
			  573,  573,  573,  573,  573,  573,  573,  574,  574,  574,
			  574,  574,  574,  574,  574,  574,  574,  575,  575,  575,
			  575,  575,  575,  575,  575,  575,  575,  576,  576,  576,
			  576,  576,  576,  576,  576,  576,  576,  577,  577,  577,
			  577,  577,  577,  577,  577,  577,  577,  578,  578,  578,
			    0,    0,  578,  578,  579,  579,    0,  579,  579,  579,
			  580,  580,    0,  580,  580,  580,  581,  581,    0,  581,
			  581,  581,    0,  581,  581,  581,  582,    0,  582,  582,

			  582,  582,  582,  582,  582,  582,  583,  583,  583,  583,
			  583,  583,    0,  583,  583,  583,  584,  584,    0,  584,
			  584,  584,  584,  584,  584,  584,  585,  585,    0,  585,
			  585,  585,  586,  586,    0,  586,  586,  586,  587,  587,
			    0,  587,  587,  587,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,

			  570, yy_Dummy>>,
			1, 401, 2000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   53,   54,  343,  333,  305,  284,  304,
			  303,   56,   57,  292,  291,   59,   62,  290,  280,  102,
			    0,  280, 2344,   62,   72, 2344, 2344, 2344, 2344, 2344,
			  265, 2344,   58,  266,   63,   75,  209, 2344,   72, 2344,
			  241,  102,  112,   51,   37, 2344,  229, 2344, 2344,  116,
			  128,  142,  140,  142,  167,  164,   55,  154,  173,  185,
			  189,  190,  193,  207,  204,  215, 2344, 2344,    0, 2344,
			 2344,    0, 2344,    0, 2344, 2344, 2344,  248,  246, 2344,
			 2344,    0, 2344,    0,    0,  214,  199,  193, 2344,    0,
			    0,  205,   94,    0,  135,    0,  203,    0,    0,  169,

			  176,  162,  162,  139,  143, 2344, 2344,  191, 2344, 2344,
			  185,  249,  253,  265, 2344,  179, 2344, 2344,  141,  269,
			  140,  278,  282,  291,  295, 2344,  212,  153,  229,  287,
			  289,  294,  296,  311,  304,  321,  329,  330,  336,  343,
			  306,  344,  354,  366,  365,  374,  376,  384,  390,  395,
			  397,  402,  409,  414,  416,  419,  424,  421,  426,  443,
			  448,  445,  444,  462,  467,  469,  470,    0,    0,    0,
			 2344,    0,  138,  126,  140,    0,    0,    0,  149,    0,
			    0,  135,  125,    0,  114, 2344,  145,  505,  515,  489,
			  124,  519, 2344,  530,  534,  543,  547,  556,  100,  548,

			  549,  550,  558,  560,  561,  579,  584,  589,  591,  592,
			  602,  601,  614,  613,  615,  620,  623,  625,  637,  638,
			  646,  656,  649,  663,  664,  670,  671,  682,  677,  682,
			  699,  694,  701,  704,  706,  707,  713,  716,  731,  725,
			  737,  739,  740,  746,  749,  748,  767,  770,  776,  775,
			  777,   70,    0,    0,    0,    0,   84,    0,  811,  815,
			   81,  824,  828,  838,  830,  832,  837,  838,  839,  789,
			  845,  860,  862,  863,  868,  875,  885,  870,  892,  893,
			  902,  899,  916,  921,  904,  907,  930,  929,  928,  935,
			  938,  940,  952,  957,  959,  966,  967,  974,  984,  985,

			  992,  993,  998,  999, 1006, 1011, 1016, 1017, 1028, 1023,
			 1025, 1035, 1038, 1040,   74,   66, 1062, 1074, 1066, 1068,
			 1078, 1076, 1077, 1083, 1090, 1100, 1101, 1102, 1113, 1107,
			 1119, 1124, 1125, 1131, 1132, 1143, 1150, 1149, 1137, 1155,
			 1167, 1156, 1161, 1162, 1173, 1179, 1184, 1185, 1190, 1196,
			 1207, 1208, 1214, 1213, 1221, 1219, 1222, 1232, 1240, 1246,
			 1243, 1251, 1257, 1254, 1264,    0,   47, 1291, 1300, 1292,
			 1293, 1294, 1303, 1300, 1301, 1311, 1322, 1324, 1325, 1330,
			 1332, 1337, 1347, 1355, 1354, 1360, 1365, 1362, 1372, 1373,
			 1379, 1387, 1394, 1397, 1404, 1406, 1405, 1416, 1419, 1427,

			 1428, 1434, 1437, 1440, 1445, 1452, 1458, 1459, 1464, 1471,
			 1481, 1470, 1482,   57, 1505, 1503, 1504, 1505, 1510, 1511,
			 1512, 1513, 1518, 1535, 1537, 1543, 1544, 1550, 1542, 1549,
			 1556, 1561, 1568, 1573, 1578, 1579, 1586, 1585, 1587, 1596,
			 1608, 1609, 1611, 1618, 1633, 1623, 1626, 1636, 1641, 1648,
			 1650, 1659, 1662,   39, 1669, 1674, 1671, 1680, 1681, 1688,
			 1693, 1695, 1698, 1705, 1703, 1710, 1712, 1717, 1720, 1722,
			 1729, 1727, 1734, 1735, 1752, 1741, 1758, 1759, 1760, 1766,
			 1769, 1781, 1783, 1788, 1790, 1793,   33, 1791, 1812, 1798,
			 1819, 1820, 1827, 1826, 1817, 1829, 1838, 1841, 1852, 1844,

			 1851, 1853, 1859, 1865, 1874, 1876, 1877, 1884, 1899, 1889,
			 1886, 1911,    0, 1901, 1914, 1913, 1908, 1922, 1920, 1932,
			 1939, 1941, 1944, 1946, 1947, 1954, 1965, 1968, 1973, 1978,
			 1975, 1983, 1986, 1997, 2000, 2011, 2005, 2012, 2018, 2019,
			 2026, 2024, 2036, 2033, 2041, 2043, 2051, 2058, 2048, 2070,
			 2072, 2060, 2075, 2077, 2087, 2098, 2084, 2089, 2099, 2101,
			 2110, 2108, 2111, 2125, 2120, 2134, 2132, 2135, 2137, 2143,
			 2344, 2196, 2206, 2216, 2226, 2236, 2246, 2256, 2263, 2269,
			 2275, 2285, 2295, 2305, 2315, 2321, 2327, 2333, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  570,    1,  571,  571,  572,  572,  573,  573,  574,
			  574,  575,  575,  576,  576,  577,  577,  576,  576,  577,
			   19,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  578,  570,  570,  570,  570,
			  570,  579,  579,   42,   42,  570,  570,  570,  570,  580,
			  580,  580,   51,   52,   52,   52,   52,   52,   51,   51,
			   51,   52,   52,   52,   52,   52,  570,  570,  581,  570,
			  570,  582,  570,  583,  570,  570,  570,  570,  570,  570,
			  570,  584,  570,  584,  584,  584,  584,  584,  570,  584,
			  584,  584,  584,  584,  584,  584,  584,  584,  584,  584,

			  584,  584,  584,  570,  570,  570,  570,  570,  570,  570,
			  570,  578,  585,  578,  570,  570,  570,  570,   42,  586,
			   42,  579,  579,  579,  579,  570,   52,  586,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   53,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   51,   52,   52,   52,   52,  581,  582,  583,
			  570,  584,  584,  584,  584,  584,  584,  584,  584,  584,
			  584,  584,  584,  584,  584,  570,  570,  587,  585,  585,
			  587,  578,  570,  586,  579,  579,  579,  579,  586,   52,

			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   51,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,  584,  584,  584,  584,  584,  584,  584,  587,  585,
			  587,  579,  579,  579,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,

			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,  584,  584,  579,  579,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,  584,  584,  579,  579,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,

			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,  584,  579,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,  584,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,  584,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,

			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,  584,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			    0,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    4,    1,    1,    1,    1,    5,
			    6,    7,    8,    9,   10,   11,   12,   13,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   15,   16,
			   17,   18,   19,    1,    1,   20,   20,   21,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   22,   20,   20,   20,   23,   20,   20,   20,
			   20,   24,   25,   26,   27,   28,    1,   29,   30,   31,

			   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   47,   48,   49,   50,   51,
			   52,   53,   54,   55,    1,   56,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    1,    1,    1,    1,    1,
			    1,    1,    4,    1,    5,    1,    1,    1,    1,    1,
			    5,    5,    5,    6,    1,    7,    1,    1,    8,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    9,   10,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,  133,  133,  130,  130,  135,  135,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  152,  150,  149,  149,  132,  127,  102,  103,  110,
			  108,  100,  109,  122,  111,  148,  124,  101,  117,  120,
			  119,  139,  139,  139,  139,  104,  150,  105,  114,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  106,  107,  133,  137,
			  134,  130,  131,  135,  136,  151,  138,  151,  129,   96,
			   67,   97,   95,   71,   72,   97,   97,   97,   74,   77,
			   75,   76,   78,   94,   79,   83,   80,   86,   87,   97,

			   97,   97,   97,  149,  148,   98,   99,  123,  112,  121,
			    0,  148,  140,  142,  125,    0,  116,  118,  139,  139,
			    0,  143,  143,  143,  143,  113,  141,  145,    0,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,   47,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  133,  130,  135,
			  128,   97,   97,   97,   97,   91,   85,   84,   97,   81,
			   82,   97,   97,   88,   97,  126,  147,  140,    0,  144,
			  146,    0,  115,    0,    0,  143,  143,  143,    0,  141,

			    2,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,   23,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,    0,  141,
			  141,  141,   42,  141,   46,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			   65,   97,   70,   69,   92,   90,   97,   89,    0,    0,
			    0,  143,  143,   64,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,    0,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,

			   49,  141,  141,  141,  141,  141,  141,   56,  141,  141,
			  141,  141,  141,   63,   97,   97,  143,  143,  141,    3,
			    4,  141,  141,  141,  141,  141,  141,  141,  141,   18,
			  141,  141,  141,  141,  141,   25,  141,  141,   29,  141,
			  141,  141,  141,   73,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,   51,  141,  141,  141,
			  141,  141,  141,    0,  141,   68,   97,  143,   54,    1,
			    0,    6,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,   24,    0,   27,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,

			  141,   43,  141,  141,   66,  141,  141,   55,  141,  141,
			  141,  141,  141,   97,   16,  141,    7,    9,  141,  141,
			  141,   13,  141,   15,  141,  141,  141,  141,  141,  141,
			  141,   30,   31,  141,  141,   34,  141,  141,  141,  141,
			  141,    0,  141,    0,  141,  141,  141,   53,  141,    0,
			    0,  141,    0,   97,  141,    0,  141,  141,  141,  141,
			   17,  141,  141,    0,  141,  141,  141,   32,   33,  141,
			  141,   37,   38,    0,  141,   41,  141,  141,   48,  141,
			  141,   57,  141,  141,  141,  141,   97,  141,  141,   10,
			  141,  141,    0,  141,  141,  141,   22,  141,  141,  141,

			   36,  141,   40,  141,  141,  141,   52,    0,  141,  141,
			   61,  141,   93,  141,  141,  141,   12,  141,  141,   20,
			  141,  141,  141,   35,  141,  141,  141,   50,  141,  141,
			  141,  141,    5,  141,  141,  141,   19,  141,   26,   28,
			  141,  141,  141,  141,  141,  141,  141,  141,   11,  141,
			  141,  141,   44,   45,  141,  141,   60,   62,    8,  141,
			  141,  141,  141,  141,   14,  141,   39,   58,   59,   21,
			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2344
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 570
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 571
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN = false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN = false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN = false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER = 151
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 152
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	STRING_CONDITION: INTEGER = 1
	SIMPLE_STRING_CONDITION: INTEGER = 2
	CONCATENATE_CONDITION: INTEGER = 3
	END_OF_STRING_CONDITION: INTEGER = 4
	CHARACTER_CONDITION: INTEGER = 5
	UNARY_OPERATOR_DECLARATION_CONDITION: INTEGER = 6
	UNARY_OPERATOR_CONDITION: INTEGER = 7
	BINARY_OPERATOR_DECLARATION_CONDITION: INTEGER = 8
	BINARY_OPERATOR_CONDITION: INTEGER = 9
			-- Start condition codes

feature -- User-defined features


end -- class BON_SCANNER

-- Local Variables:
-- mode:eiffel
-- font-lock-mode:nil
-- End:
