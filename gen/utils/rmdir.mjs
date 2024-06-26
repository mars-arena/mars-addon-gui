import fs from 'fs'
import path from 'path'

/**
 * @param {string} directoryPath
 */
export const rmdir = directoryPath => {
    if (fs.existsSync(directoryPath)) {
        fs.readdirSync(directoryPath).forEach(file => {
            const curPath = path.join(directoryPath, file)
            if (fs.lstatSync(curPath).isDirectory()) {
                rmdir(curPath)
            } else {
                fs.unlinkSync(curPath)
            }
        })
        fs.rmdirSync(directoryPath)
    }
}
