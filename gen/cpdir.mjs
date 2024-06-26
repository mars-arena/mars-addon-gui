import fs from 'fs'
import path from 'path'

/**
 * Look ma, it's cp -R.
 * @param {string} src  The path to the thing to copy.
 * @param {string} dest The path to the new copy.
 */
export const cpdir = (src, dest) => {
    const exists = fs.existsSync(src)
    const stats = exists && fs.statSync(src)
    const isDirectory = exists && stats.isDirectory()
    if (isDirectory) {
        fs.mkdirSync(dest)
        fs.readdirSync(src).forEach(childItemName => {
            cpdir(path.join(src, childItemName),
                path.join(dest, childItemName))
        })
    } else {
        fs.copyFileSync(src, dest)
    }
}
