note

	description: "Parser token codes"
	generator: "geyacc version 3.9"

class BON_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
	last_string_value: STRING
	last_character_value: CHARACTER
	last_integer_value: INTEGER
	last_real_value: REAL

feature -- Access

	token_name (a_token: INTEGER): STRING
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when IDENTIFIER_TOKEN then
				Result := "IDENTIFIER_TOKEN"
			when CHARACTER_TOKEN then
				Result := "CHARACTER_TOKEN"
			when INTEGER_TOKEN then
				Result := "INTEGER_TOKEN"
			when REAL_TOKEN then
				Result := "REAL_TOKEN"
			when STRING_DELIMITER_TOKEN then
				Result := "STRING_DELIMITER_TOKEN"
			when SIMPLE_STRING_TOKEN then
				Result := "SIMPLE_STRING_TOKEN"
			when NEWLINE_TOKEN then
				Result := "NEWLINE_TOKEN"
			when FREE_OPERATOR_TOKEN then
				Result := "FREE_OPERATOR_TOKEN"
			when CURRENT_TOKEN then
				Result := "CURRENT_TOKEN"
			when RESULT_TOKEN then
				Result := "RESULT_TOKEN"
			when VOID_TOKEN then
				Result := "VOID_TOKEN"
			when ACTION_TOKEN then
				Result := "ACTION_TOKEN"
			when CALLS_TOKEN then
				Result := "CALLS_TOKEN"
			when CLASS_TOKEN then
				Result := "CLASS_TOKEN"
			when CLASS_CHART_TOKEN then
				Result := "CLASS_CHART_TOKEN"
			when CLIENT_TOKEN then
				Result := "CLIENT_TOKEN"
			when CLUSTER_TOKEN then
				Result := "CLUSTER_TOKEN"
			when CLUSTER_CHART_TOKEN then
				Result := "CLUSTER_CHART_TOKEN"
			when COMMAND_TOKEN then
				Result := "COMMAND_TOKEN"
			when COMPONENT_TOKEN then
				Result := "COMPONENT_TOKEN"
			when CONCATENATOR_TOKEN then
				Result := "CONCATENATOR_TOKEN"
			when CONSTRAINT_TOKEN then
				Result := "CONSTRAINT_TOKEN"
			when CREATES_TOKEN then
				Result := "CREATES_TOKEN"
			when CREATION_CHART_TOKEN then
				Result := "CREATION_CHART_TOKEN"
			when CREATOR_TOKEN then
				Result := "CREATOR_TOKEN"
			when DEFERRED_TOKEN then
				Result := "DEFERRED_TOKEN"
			when DESCRIPTION_TOKEN then
				Result := "DESCRIPTION_TOKEN"
			when DICTIONARY_TOKEN then
				Result := "DICTIONARY_TOKEN"
			when DYNAMIC_DIAGRAM_TOKEN then
				Result := "DYNAMIC_DIAGRAM_TOKEN"
			when EFFECTIVE_TOKEN then
				Result := "EFFECTIVE_TOKEN"
			when END_TOKEN then
				Result := "END_TOKEN"
			when ENSURE_TOKEN then
				Result := "ENSURE_TOKEN"
			when EVENT_TOKEN then
				Result := "EVENT_TOKEN"
			when EVENT_CHART_TOKEN then
				Result := "EVENT_CHART_TOKEN"
			when EXISTS_TOKEN then
				Result := "EXISTS_TOKEN"
			when EXPLANATION_TOKEN then
				Result := "EXPLANATION_TOKEN"
			when FALSE_TOKEN then
				Result := "FALSE_TOKEN"
			when FEATURE_TOKEN then
				Result := "FEATURE_TOKEN"
			when FOR_ALL_TOKEN then
				Result := "FOR_ALL_TOKEN"
			when INCOMING_TOKEN then
				Result := "INCOMING_TOKEN"
			when INDEXING_TOKEN then
				Result := "INDEXING_TOKEN"
			when INFIX_TOKEN then
				Result := "INFIX_TOKEN"
			when INHERIT_TOKEN then
				Result := "INHERIT_TOKEN"
			when INTERFACED_TOKEN then
				Result := "INTERFACED_TOKEN"
			when INVARIANT_TOKEN then
				Result := "INVARIANT_TOKEN"
			when INVOLVES_TOKEN then
				Result := "INVOLVES_TOKEN"
			when IT_HOLDS_TOKEN then
				Result := "IT_HOLDS_TOKEN"
			when KEYWORD_PREFIX_TOKEN then
				Result := "KEYWORD_PREFIX_TOKEN"
			when NAMELESS_TOKEN then
				Result := "NAMELESS_TOKEN"
			when OBJECT_TOKEN then
				Result := "OBJECT_TOKEN"
			when OBJECT_GROUP_TOKEN then
				Result := "OBJECT_GROUP_TOKEN"
			when OBJECT_STACK_TOKEN then
				Result := "OBJECT_STACK_TOKEN"
			when OUTGOING_TOKEN then
				Result := "OUTGOING_TOKEN"
			when PART_TOKEN then
				Result := "PART_TOKEN"
			when PERSISTENT_TOKEN then
				Result := "PERSISTENT_TOKEN"
			when PREFIX_TOKEN then
				Result := "PREFIX_TOKEN"
			when QUERY_TOKEN then
				Result := "QUERY_TOKEN"
			when REDEFINED_TOKEN then
				Result := "REDEFINED_TOKEN"
			when REQUIRE_TOKEN then
				Result := "REQUIRE_TOKEN"
			when REUSED_TOKEN then
				Result := "REUSED_TOKEN"
			when ROOT_TOKEN then
				Result := "ROOT_TOKEN"
			when SCENARIO_TOKEN then
				Result := "SCENARIO_TOKEN"
			when SCENARIO_CHART_TOKEN then
				Result := "SCENARIO_CHART_TOKEN"
			when STATIC_DIAGRAM_TOKEN then
				Result := "STATIC_DIAGRAM_TOKEN"
			when STRING_MARKS_TOKEN then
				Result := "STRING_MARKS_TOKEN"
			when SUCH_THAT_TOKEN then
				Result := "SUCH_THAT_TOKEN"
			when SYSTEM_CHART_TOKEN then
				Result := "SYSTEM_CHART_TOKEN"
			when TRUE_TOKEN then
				Result := "TRUE_TOKEN"
			when DOUBLE_DASH_TOKEN then
				Result := "DOUBLE_DASH_TOKEN (%"--%")"
			when DOUBLE_DOT_TOKEN then
				Result := "DOUBLE_DOT_TOKEN (%"..%")"
			when AGGREGATE_MARK_TOKEN then
				Result := "AGGREGATE_MARK_TOKEN (%":{%")"
			when ELLIPSES_TOKEN then
				Result := "ELLIPSES_TOKEN (%"...%")"
			when CLASS_NAME_TOKEN then
				Result := "CLASS_NAME_TOKEN"
			when CLUSTER_NAME_TOKEN then
				Result := "CLUSTER_NAME_TOKEN"
			when ALL_CAPS_IDENTIFIER_TOKEN then
				Result := "ALL_CAPS_IDENTIFIER_TOKEN"
			when FEATURE_NAME_TOKEN then
				Result := "FEATURE_NAME_TOKEN"
			when OBJECT_GROUP_OR_CONSTANT_NAME_TOKEN then
				Result := "OBJECT_GROUP_OR_CONSTANT_NAME_TOKEN"
			when IMPLIES_TOKEN then
				Result := "IMPLIES_TOKEN"
			when EQUIVALENT_TO_TOKEN then
				Result := "EQUIVALENT_TO_TOKEN"
			when MEMBER_OF_TOKEN then
				Result := "MEMBER_OF_TOKEN"
			when AND_TOKEN then
				Result := "AND_TOKEN"
			when OR_TOKEN then
				Result := "OR_TOKEN"
			when XOR_TOKEN then
				Result := "XOR_TOKEN"
			when NOT_TOKEN then
				Result := "NOT_TOKEN"
			when LESS_THAN_OR_EQUAL_TOKEN then
				Result := "LESS_THAN_OR_EQUAL_TOKEN"
			when GREATER_THAN_OR_EQUAL_TOKEN then
				Result := "GREATER_THAN_OR_EQUAL_TOKEN"
			when NOT_EQUAL_TOKEN then
				Result := "NOT_EQUAL_TOKEN"
			when DOUBLE_SLASH_TOKEN then
				Result := "DOUBLE_SLASH_TOKEN"
			when DOUBLE_BACKSLASH_TOKEN then
				Result := "DOUBLE_BACKSLASH_TOKEN"
			when UNARY_DUMMY then
				Result := "UNARY_DUMMY"
			when OLD_TOKEN then
				Result := "OLD_TOKEN"
			when DELTA_TOKEN then
				Result := "DELTA_TOKEN"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	IDENTIFIER_TOKEN: INTEGER = 258
	CHARACTER_TOKEN: INTEGER = 259
	INTEGER_TOKEN: INTEGER = 260
	REAL_TOKEN: INTEGER = 261
	STRING_DELIMITER_TOKEN: INTEGER = 262
	SIMPLE_STRING_TOKEN: INTEGER = 263
	NEWLINE_TOKEN: INTEGER = 264
	FREE_OPERATOR_TOKEN: INTEGER = 265
	CURRENT_TOKEN: INTEGER = 266
	RESULT_TOKEN: INTEGER = 267
	VOID_TOKEN: INTEGER = 268
	ACTION_TOKEN: INTEGER = 269
	CALLS_TOKEN: INTEGER = 270
	CLASS_TOKEN: INTEGER = 271
	CLASS_CHART_TOKEN: INTEGER = 272
	CLIENT_TOKEN: INTEGER = 273
	CLUSTER_TOKEN: INTEGER = 274
	CLUSTER_CHART_TOKEN: INTEGER = 275
	COMMAND_TOKEN: INTEGER = 276
	COMPONENT_TOKEN: INTEGER = 277
	CONCATENATOR_TOKEN: INTEGER = 278
	CONSTRAINT_TOKEN: INTEGER = 279
	CREATES_TOKEN: INTEGER = 280
	CREATION_CHART_TOKEN: INTEGER = 281
	CREATOR_TOKEN: INTEGER = 282
	DEFERRED_TOKEN: INTEGER = 283
	DESCRIPTION_TOKEN: INTEGER = 284
	DICTIONARY_TOKEN: INTEGER = 285
	DYNAMIC_DIAGRAM_TOKEN: INTEGER = 286
	EFFECTIVE_TOKEN: INTEGER = 287
	END_TOKEN: INTEGER = 288
	ENSURE_TOKEN: INTEGER = 289
	EVENT_TOKEN: INTEGER = 290
	EVENT_CHART_TOKEN: INTEGER = 291
	EXISTS_TOKEN: INTEGER = 292
	EXPLANATION_TOKEN: INTEGER = 293
	FALSE_TOKEN: INTEGER = 294
	FEATURE_TOKEN: INTEGER = 295
	FOR_ALL_TOKEN: INTEGER = 296
	INCOMING_TOKEN: INTEGER = 297
	INDEXING_TOKEN: INTEGER = 298
	INFIX_TOKEN: INTEGER = 299
	INHERIT_TOKEN: INTEGER = 300
	INTERFACED_TOKEN: INTEGER = 301
	INVARIANT_TOKEN: INTEGER = 302
	INVOLVES_TOKEN: INTEGER = 303
	IT_HOLDS_TOKEN: INTEGER = 304
	KEYWORD_PREFIX_TOKEN: INTEGER = 305
	NAMELESS_TOKEN: INTEGER = 306
	OBJECT_TOKEN: INTEGER = 307
	OBJECT_GROUP_TOKEN: INTEGER = 308
	OBJECT_STACK_TOKEN: INTEGER = 309
	OUTGOING_TOKEN: INTEGER = 310
	PART_TOKEN: INTEGER = 311
	PERSISTENT_TOKEN: INTEGER = 312
	PREFIX_TOKEN: INTEGER = 313
	QUERY_TOKEN: INTEGER = 314
	REDEFINED_TOKEN: INTEGER = 315
	REQUIRE_TOKEN: INTEGER = 316
	REUSED_TOKEN: INTEGER = 317
	ROOT_TOKEN: INTEGER = 318
	SCENARIO_TOKEN: INTEGER = 319
	SCENARIO_CHART_TOKEN: INTEGER = 320
	STATIC_DIAGRAM_TOKEN: INTEGER = 321
	STRING_MARKS_TOKEN: INTEGER = 322
	SUCH_THAT_TOKEN: INTEGER = 323
	SYSTEM_CHART_TOKEN: INTEGER = 324
	TRUE_TOKEN: INTEGER = 325
	DOUBLE_DASH_TOKEN: INTEGER = 326
	DOUBLE_DOT_TOKEN: INTEGER = 327
	AGGREGATE_MARK_TOKEN: INTEGER = 328
	ELLIPSES_TOKEN: INTEGER = 329
	CLASS_NAME_TOKEN: INTEGER = 330
	CLUSTER_NAME_TOKEN: INTEGER = 331
	ALL_CAPS_IDENTIFIER_TOKEN: INTEGER = 332
	FEATURE_NAME_TOKEN: INTEGER = 333
	OBJECT_GROUP_OR_CONSTANT_NAME_TOKEN: INTEGER = 334
	IMPLIES_TOKEN: INTEGER = 335
	EQUIVALENT_TO_TOKEN: INTEGER = 336
	MEMBER_OF_TOKEN: INTEGER = 337
	AND_TOKEN: INTEGER = 338
	OR_TOKEN: INTEGER = 339
	XOR_TOKEN: INTEGER = 340
	NOT_TOKEN: INTEGER = 341
	LESS_THAN_OR_EQUAL_TOKEN: INTEGER = 342
	GREATER_THAN_OR_EQUAL_TOKEN: INTEGER = 343
	NOT_EQUAL_TOKEN: INTEGER = 344
	DOUBLE_SLASH_TOKEN: INTEGER = 345
	DOUBLE_BACKSLASH_TOKEN: INTEGER = 346
	UNARY_DUMMY: INTEGER = 347
	OLD_TOKEN: INTEGER = 348
	DELTA_TOKEN: INTEGER = 349

end
