module lang

import analyzer.psi.types

pub fn get_zero_value_for(typ types.Type) string {
	return match typ {
		types.PrimitiveType {
			match typ.name {
				'bool' { 'false' }
				'rune' { '`0`' }
				'char', 'u8' { '0' }
				'voidptr', 'byteptr', 'charptr', 'nil' { 'unsafe { nil }' }
				'f32', 'f64' { '0.0' }
				else { '0' }
			}
		}
		types.StructType {
			match typ.name() {
				'string' { "''" }
				else { typ.readable_name() + '{}' }
			}
		}
		types.ArrayType {
			return '[]'
		}
		types.FixedArrayType {
			return '[]!'
		}
		types.MapType {
			return '{}'
		}
		types.ChannelType {
			return 'chan ${typ.inner.readable_name()}{}'
		}
		types.FunctionType {
			return '${typ.readable_name()} {}'
		}
		types.AliasType {
			return get_zero_value_for(typ.inner)
		}
		types.GenericInstantiationType {
			return get_zero_value_for(typ.inner)
		}
		types.InterfaceType, types.PointerType {
			return 'unsafe { nil }'
		}
		types.OptionType {
			return 'none'
		}
		else {
			return '0'
		}
	}
}