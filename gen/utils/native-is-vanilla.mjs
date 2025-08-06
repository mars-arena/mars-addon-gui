import * as fs from 'fs'
import parse, {Native} from 'jass-to-ast'
import * as path from 'node:path'

const read = p => fs.readFileSync(p, {encoding: 'utf8', flag: 'r'}).replace(/\r\n/g, '\n')

const vanilla = {}

for (const node of parse(read(path.join('.', 'data', 'common.vanilla.j')))) {
    if (node instanceof Native) {
        vanilla[node.name] = true
    }
}

/**
 * @param {Native} native
 * @return {boolean}
 */
export default native => !!vanilla[native.name]
