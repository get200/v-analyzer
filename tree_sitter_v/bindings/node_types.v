// This is an AUTO-GENERATED file. DO NOT EDIT this file directly! See `generate_types.vsh`
module bindings

import arrays { merge }

pub enum SuperType {
	unknown
	expression
	expression_with_blocks
	statement
	top_level_declaration
}

pub enum NodeType {
	unknown
	error
	anon_struct_type
	anon_struct_value_expression
	append_statement
	argument
	argument_list
	array_creation
	array_type
	as_type_cast_expression
	asm_statement
	assert_statement
	assignment_statement
	atomic_type
	attribute
	attribute_expression
	attributes
	binary_expression
	block
	block_comment
	break_statement
	c_string_literal
	call_expression
	capture
	capture_list
	channel_type
	compile_time_for_statement
	compile_time_if_expression
	compile_time_selector_expression
	const_declaration
	const_definition
	continue_statement
	dec_expression
	defer_statement
	element_list
	else_branch
	embedded_definition
	enum_backed_type
	enum_declaration
	enum_fetch
	enum_field_definition
	expression_list
	field_name
	fixed_array_creation
	fixed_array_type
	for_clause
	for_statement
	format_specifier
	function_declaration
	function_literal
	function_type
	generic_parameter
	generic_parameters
	generic_type
	global_var_declaration
	global_var_definition
	go_expression
	goto_statement
	hash_statement
	identifier_list
	if_attribute
	if_expression
	implements
	import_alias
	import_declaration
	import_list
	import_name
	import_path
	import_spec
	in_expression
	inc_expression
	index_expression
	interface_declaration
	interface_method_definition
	interpreted_string_literal
	is_clause
	is_expression
	key_value_attribute
	keyed_element
	label_definition
	label_reference
	labeled_statement
	line_comment
	literal
	literal_attribute
	lock_expression
	map_init_expression
	map_keyed_element
	map_type
	match_arm
	match_arm_type
	match_arms
	match_else_arm_clause
	match_expression
	match_expression_list
	module_clause
	multi_return_type
	mutability_modifiers
	mutable_expression
	mutable_identifier
	option_propagation_expression
	option_type
	or_block
	or_block_expression
	overridable_operator
	parameter_declaration
	parameter_list
	parenthesized_expression
	plain_type
	pointer_type
	qualified_type
	range
	range_clause
	raw_string_literal
	receive_expression
	receiver
	reference_expression
	result_propagation_expression
	result_type
	return_statement
	select_arm
	select_arm_statement
	select_else_arn_clause
	select_expression
	selective_import_list
	selector_expression
	send_statement
	shared_type
	shebang
	short_element_list
	short_lambda
	signature
	simple_statement
	slice_expression
	source_file
	spawn_expression
	special_argument_list
	spread_expression
	sql_expression
	static_method_declaration
	static_receiver
	string_interpolation
	struct_declaration
	struct_field_declaration
	struct_field_scope
	sum_type
	thread_type
	type_declaration
	type_initializer
	type_initializer_body
	type_parameter_declaration
	type_parameter_list
	type_parameters
	type_reference_expression
	unary_expression
	unsafe_expression
	value_attribute
	var_declaration
	var_definition
	var_definition_list
	visibility_modifiers
	wrong_pointer_type
	escape_sequence
	false_
	float_literal
	identifier
	int_literal
	interpolation_closing
	interpolation_opening
	nil_
	none_
	pseudo_compile_time_identifier
	rune_literal
	true_
}

const supertype__expression_nodes = merge(supertype__expression_with_blocks_nodes, [
	NodeType.array_creation,
	.as_type_cast_expression,
	.binary_expression,
	.call_expression,
	.dec_expression,
	.enum_fetch,
	.fixed_array_creation,
	.function_literal,
	.go_expression,
	.in_expression,
	.inc_expression,
	.index_expression,
	.is_expression,
	.literal,
	.option_propagation_expression,
	.or_block_expression,
	.parenthesized_expression,
	.pseudo_compile_time_identifier,
	.receive_expression,
	.reference_expression,
	.result_propagation_expression,
	.selector_expression,
	.slice_expression,
	.spawn_expression,
	.unary_expression,
])

const supertype__expression_with_blocks_nodes = [
	NodeType.anon_struct_value_expression,
	.compile_time_if_expression,
	.if_expression,
	.lock_expression,
	.map_init_expression,
	.match_expression,
	.select_expression,
	.sql_expression,
	.type_initializer,
	.unsafe_expression,
]

const supertype__statement_nodes = [
	NodeType.append_statement,
	.asm_statement,
	.assert_statement,
	.block,
	.break_statement,
	.compile_time_for_statement,
	.continue_statement,
	.defer_statement,
	.for_statement,
	.goto_statement,
	.hash_statement,
	.labeled_statement,
	.return_statement,
	.send_statement,
	.simple_statement,
]

const supertype__top_level_declaration_nodes = [
	NodeType.const_declaration,
	.enum_declaration,
	.function_declaration,
	.global_var_declaration,
	.interface_declaration,
	.static_method_declaration,
	.struct_declaration,
	.type_declaration,
]

pub fn (typ NodeType) group() SuperType {
	return if typ in supertype__top_level_declaration_nodes {
		SuperType.top_level_declaration
	} else if typ in supertype__expression_nodes {
		SuperType.expression
	} else if typ in supertype__statement_nodes {
		SuperType.statement
	} else {
		SuperType.unknown
	}
}

const declaration_node_types = [
	NodeType.const_declaration,
	.enum_declaration,
	.function_declaration,
	.global_var_declaration,
	.import_declaration,
	.interface_declaration,
	.parameter_declaration,
	.static_method_declaration,
	.struct_declaration,
	.struct_field_declaration,
	.type_declaration,
	.type_parameter_declaration,
	.var_declaration,
]

const identifier_node_types = [
	NodeType.mutable_identifier,
	.identifier,
	.pseudo_compile_time_identifier,
]

const literal_node_types = [
	NodeType.c_string_literal,
	.function_literal,
	.interpreted_string_literal,
	.raw_string_literal,
	.float_literal,
	.int_literal,
	.rune_literal,
]

pub fn (typ NodeType) is_declaration() bool {
	return typ in declaration_node_types
}

pub fn (typ NodeType) is_identifier() bool {
	return typ in identifier_node_types
}

pub fn (typ NodeType) is_literal() bool {
	return typ in literal_node_types
}

pub const type_factory = &VNodeTypeFactory{}

pub struct VNodeTypeFactory {}

pub fn (nf VNodeTypeFactory) get_type(type_name string) NodeType {
	return node_type_name_to_enum[type_name] or { NodeType.unknown }
}

const node_type_name_to_enum = {
	'ERROR':                            NodeType.error
	'anon_struct_type':                 NodeType.anon_struct_type
	'anon_struct_value_expression':     NodeType.anon_struct_value_expression
	'append_statement':                 NodeType.append_statement
	'argument':                         NodeType.argument
	'argument_list':                    NodeType.argument_list
	'array_creation':                   NodeType.array_creation
	'array_type':                       NodeType.array_type
	'as_type_cast_expression':          NodeType.as_type_cast_expression
	'asm_statement':                    NodeType.asm_statement
	'assert_statement':                 NodeType.assert_statement
	'assignment_statement':             NodeType.assignment_statement
	'atomic_type':                      NodeType.atomic_type
	'attribute':                        NodeType.attribute
	'attribute_expression':             NodeType.attribute_expression
	'attributes':                       NodeType.attributes
	'binary_expression':                NodeType.binary_expression
	'block':                            NodeType.block
	'block_comment':                    NodeType.block_comment
	'break_statement':                  NodeType.break_statement
	'c_string_literal':                 NodeType.c_string_literal
	'call_expression':                  NodeType.call_expression
	'capture':                          NodeType.capture
	'capture_list':                     NodeType.capture_list
	'channel_type':                     NodeType.channel_type
	'compile_time_for_statement':       NodeType.compile_time_for_statement
	'compile_time_if_expression':       NodeType.compile_time_if_expression
	'compile_time_selector_expression': NodeType.compile_time_selector_expression
	'const_declaration':                NodeType.const_declaration
	'const_definition':                 NodeType.const_definition
	'continue_statement':               NodeType.continue_statement
	'dec_expression':                   NodeType.dec_expression
	'defer_statement':                  NodeType.defer_statement
	'element_list':                     NodeType.element_list
	'else_branch':                      NodeType.else_branch
	'embedded_definition':              NodeType.embedded_definition
	'enum_backed_type':                 NodeType.enum_backed_type
	'enum_declaration':                 NodeType.enum_declaration
	'enum_fetch':                       NodeType.enum_fetch
	'enum_field_definition':            NodeType.enum_field_definition
	'expression_list':                  NodeType.expression_list
	'field_name':                       NodeType.field_name
	'fixed_array_creation':             NodeType.fixed_array_creation
	'fixed_array_type':                 NodeType.fixed_array_type
	'for_clause':                       NodeType.for_clause
	'for_statement':                    NodeType.for_statement
	'format_specifier':                 NodeType.format_specifier
	'function_declaration':             NodeType.function_declaration
	'function_literal':                 NodeType.function_literal
	'function_type':                    NodeType.function_type
	'generic_parameter':                NodeType.generic_parameter
	'generic_parameters':               NodeType.generic_parameters
	'generic_type':                     NodeType.generic_type
	'global_var_declaration':           NodeType.global_var_declaration
	'global_var_definition':            NodeType.global_var_definition
	'go_expression':                    NodeType.go_expression
	'goto_statement':                   NodeType.goto_statement
	'hash_statement':                   NodeType.hash_statement
	'identifier_list':                  NodeType.identifier_list
	'if_attribute':                     NodeType.if_attribute
	'if_expression':                    NodeType.if_expression
	'implements':                       NodeType.implements
	'import_alias':                     NodeType.import_alias
	'import_declaration':               NodeType.import_declaration
	'import_list':                      NodeType.import_list
	'import_name':                      NodeType.import_name
	'import_path':                      NodeType.import_path
	'import_spec':                      NodeType.import_spec
	'in_expression':                    NodeType.in_expression
	'inc_expression':                   NodeType.inc_expression
	'index_expression':                 NodeType.index_expression
	'interface_declaration':            NodeType.interface_declaration
	'interface_method_definition':      NodeType.interface_method_definition
	'interpreted_string_literal':       NodeType.interpreted_string_literal
	'is_clause':                        NodeType.is_clause
	'is_expression':                    NodeType.is_expression
	'key_value_attribute':              NodeType.key_value_attribute
	'keyed_element':                    NodeType.keyed_element
	'label_definition':                 NodeType.label_definition
	'label_reference':                  NodeType.label_reference
	'labeled_statement':                NodeType.labeled_statement
	'line_comment':                     NodeType.line_comment
	'literal':                          NodeType.literal
	'literal_attribute':                NodeType.literal_attribute
	'lock_expression':                  NodeType.lock_expression
	'map_init_expression':              NodeType.map_init_expression
	'map_keyed_element':                NodeType.map_keyed_element
	'map_type':                         NodeType.map_type
	'match_arm':                        NodeType.match_arm
	'match_arm_type':                   NodeType.match_arm_type
	'match_arms':                       NodeType.match_arms
	'match_else_arm_clause':            NodeType.match_else_arm_clause
	'match_expression':                 NodeType.match_expression
	'match_expression_list':            NodeType.match_expression_list
	'module_clause':                    NodeType.module_clause
	'multi_return_type':                NodeType.multi_return_type
	'mutability_modifiers':             NodeType.mutability_modifiers
	'mutable_expression':               NodeType.mutable_expression
	'mutable_identifier':               NodeType.mutable_identifier
	'option_propagation_expression':    NodeType.option_propagation_expression
	'option_type':                      NodeType.option_type
	'or_block':                         NodeType.or_block
	'or_block_expression':              NodeType.or_block_expression
	'overridable_operator':             NodeType.overridable_operator
	'parameter_declaration':            NodeType.parameter_declaration
	'parameter_list':                   NodeType.parameter_list
	'parenthesized_expression':         NodeType.parenthesized_expression
	'plain_type':                       NodeType.plain_type
	'pointer_type':                     NodeType.pointer_type
	'qualified_type':                   NodeType.qualified_type
	'range':                            NodeType.range
	'range_clause':                     NodeType.range_clause
	'raw_string_literal':               NodeType.raw_string_literal
	'receive_expression':               NodeType.receive_expression
	'receiver':                         NodeType.receiver
	'reference_expression':             NodeType.reference_expression
	'result_propagation_expression':    NodeType.result_propagation_expression
	'result_type':                      NodeType.result_type
	'return_statement':                 NodeType.return_statement
	'select_arm':                       NodeType.select_arm
	'select_arm_statement':             NodeType.select_arm_statement
	'select_else_arn_clause':           NodeType.select_else_arn_clause
	'select_expression':                NodeType.select_expression
	'selective_import_list':            NodeType.selective_import_list
	'selector_expression':              NodeType.selector_expression
	'send_statement':                   NodeType.send_statement
	'shared_type':                      NodeType.shared_type
	'shebang':                          NodeType.shebang
	'short_element_list':               NodeType.short_element_list
	'short_lambda':                     NodeType.short_lambda
	'signature':                        NodeType.signature
	'simple_statement':                 NodeType.simple_statement
	'slice_expression':                 NodeType.slice_expression
	'source_file':                      NodeType.source_file
	'spawn_expression':                 NodeType.spawn_expression
	'special_argument_list':            NodeType.special_argument_list
	'spread_expression':                NodeType.spread_expression
	'sql_expression':                   NodeType.sql_expression
	'static_method_declaration':        NodeType.static_method_declaration
	'static_receiver':                  NodeType.static_receiver
	'string_interpolation':             NodeType.string_interpolation
	'struct_declaration':               NodeType.struct_declaration
	'struct_field_declaration':         NodeType.struct_field_declaration
	'struct_field_scope':               NodeType.struct_field_scope
	'sum_type':                         NodeType.sum_type
	'thread_type':                      NodeType.thread_type
	'type_declaration':                 NodeType.type_declaration
	'type_initializer':                 NodeType.type_initializer
	'type_initializer_body':            NodeType.type_initializer_body
	'type_parameter_declaration':       NodeType.type_parameter_declaration
	'type_parameter_list':              NodeType.type_parameter_list
	'type_parameters':                  NodeType.type_parameters
	'type_reference_expression':        NodeType.type_reference_expression
	'unary_expression':                 NodeType.unary_expression
	'unsafe_expression':                NodeType.unsafe_expression
	'value_attribute':                  NodeType.value_attribute
	'var_declaration':                  NodeType.var_declaration
	'var_definition':                   NodeType.var_definition
	'var_definition_list':              NodeType.var_definition_list
	'visibility_modifiers':             NodeType.visibility_modifiers
	'wrong_pointer_type':               NodeType.wrong_pointer_type
	'escape_sequence':                  NodeType.escape_sequence
	'false':                            NodeType.false_
	'float_literal':                    NodeType.float_literal
	'identifier':                       NodeType.identifier
	'int_literal':                      NodeType.int_literal
	'interpolation_closing':            NodeType.interpolation_closing
	'interpolation_opening':            NodeType.interpolation_opening
	'nil':                              NodeType.nil_
	'none':                             NodeType.none_
	'pseudo_compile_time_identifier':   NodeType.pseudo_compile_time_identifier
	'rune_literal':                     NodeType.rune_literal
	'true':                             NodeType.true_
}
