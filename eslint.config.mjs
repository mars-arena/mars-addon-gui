import globals from 'globals'

export default [
	{
		ignores: [
			'node_modules/',
			'dist/',
			'build/',
			'.gradle/',
			'.kotlin/'
		]
	},
	{
		files: ['**/*.js', '**/*.mjs'],
		languageOptions: {
			ecmaVersion: 'latest',
			sourceType: 'module',
			globals: {
				...globals.node,
				...globals.es2021
			}
		},
		rules: {
			curly: 'off',
			semi: ['error', 'never'],
			quotes: ['error', 'single'],
			'no-unsafe-optional-chaining': 'off',
			'no-console': 'off',
			'no-eq-null': 'warn',
			'no-case-declarations': 'off'
		}
	}
]
