/**
 * @param  {string|number} s
 * @return {string}
 */
export default (s) => String(s)
    .replace(/[_\-]+/g, ' ')
    .replace(/([A-Z]+)([A-Z][a-z])/g, '$1 $2')	// HTMLParser -> HTML Parser
    .replace(/([a-z0-9])([A-Z])/g, '$1 $2')		// camelCase -> camel Case
    .replace(/([A-Za-z])([0-9])/g, '$1 $2')		// X9 -> X 9
    .replace(/([0-9])([A-Za-z])/g, '$1 $2')		// 9X -> 9 X
    .replace(/\s+/g, ' ')
    .trim()
