import parse, {Native} from 'jass-to-ast'
import fs from 'fs'
import path from 'path'

const map = {}

for (const native of parse(fs.readFileSync(path.join('..', 'data', 'common.j'), {
    encoding: 'utf8',
    flag: 'r'
}).replace(/\r\n/g, '\n'))) {
    if (native instanceof Native) {
        if (!native.params) continue
        for (const p of native.params) {
            if (!map[p.type]) map[p.type] = []
            if (map[p.type].indexOf(p.name) < 0) map[p.type].push(p.name)
        }
    }
}

fs.writeFileSync('param-name.json', JSON.stringify(map, null, 4), {encoding: 'utf8', flag: 'w'})

