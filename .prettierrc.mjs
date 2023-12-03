import * as ppa from "prettier-plugin-astro"

export default {
	plugins: [
		ppa
	],
	overrides: [
		{
			files: "*.astro",
			options: { parser: "astro" }
		}
	],
	trailingComma: "none",
	semi: false,
	singleQuote: false,
	printWidth: 80
}
