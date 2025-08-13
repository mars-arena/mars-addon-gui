import fs from 'fs'
import path from 'path'

/**
 * @param {string} src
 * @param {string} dest
 */
export const cpdir = (src, dest) => {
    const stats = fs.statSync(src, { throwIfNoEntry: true })
    if (stats.isDirectory()) {
        fs.mkdirSync(dest, { recursive: true })
        for (const name of fs.readdirSync(src)) {
            cpdir(path.join(src, name), path.join(dest, name))
        }
        return
    }
    fs.mkdirSync(path.dirname(dest), { recursive: true })
    fs.copyFileSync(src, dest)
}
