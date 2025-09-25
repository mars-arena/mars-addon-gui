import fs from 'fs'

/**
 * @param {string} filePath
 * @param {string} s
 * @param {string} part
 */
export default (filePath, s, part) => {
    const data = fs.readFileSync(filePath)
    const h = `[${part}]`
    const pos = data.indexOf(h) + h.length
    fs.writeFileSync(filePath, Buffer.concat([data.subarray(0, pos), Buffer.from('\n' + s), data.subarray(pos)]))
}
