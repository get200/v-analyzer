module tests

import testing

fn documentation() testing.Tester {
	mut t := testing.with_name('documentation')

	t.documentation_test('rendered', 'documentation/rendered.vv')
	t.documentation_test('stubs', 'documentation/stubs.vv')

	return t
}
