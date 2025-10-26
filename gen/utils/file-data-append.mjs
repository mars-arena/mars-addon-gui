import fs from 'fs'

/**
 * @param {string} filePath
 * @param {string} s
 * @param {string} part
 */
export default (filePath, s, part) => {
	const data = fs.readFileSync(filePath)
	const h = `[${part}]`
	const start = data.indexOf(h)
	if (start === -1) return

	const sectionStart = start + h.length

	const n1 = data.indexOf('\n\n[', sectionStart)
	const n2 = data.indexOf('\r\n\r\n[', sectionStart)
	let sectionEnd = -1
	if (n1 === -1 && n2 === -1) sectionEnd = data.length
	else if (n1 === -1) sectionEnd = n2
	else if (n2 === -1) sectionEnd = n1
	else sectionEnd = Math.min(n1, n2)

	fs.writeFileSync(filePath, Buffer.concat([
		data.subarray(0, sectionEnd),
		Buffer.from('\n' + s),
		data.subarray(sectionEnd)
	]))
}
