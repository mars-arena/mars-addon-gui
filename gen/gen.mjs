import path from 'path'
import {rmdir} from './rmdir.mjs'
import {cpdir} from './cpdir.mjs'
import fs from 'fs'

const root = path.join('..')

const UI = path.join(root, 'src', 'UI')

rmdir(UI)
cpdir(path.join(root, 'src', 'umswe', 'UI'), UI)

const MiscData = path.join(UI, 'MiscData.txt')

const append = (filePath, s, part) => {
    const data = fs.readFileSync(filePath)
    const h = `[${part}]`
    const pos = data.indexOf(h) + h.length
    fs.writeFileSync(filePath, Buffer.concat([data.subarray(0, pos), Buffer.from('\n' + s), data.subarray(pos)]))
}


//append(MiscData, 'a=b', 'Camera')
