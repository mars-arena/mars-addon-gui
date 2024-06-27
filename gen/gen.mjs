import path from 'path'
import {rmdir} from './utils/rmdir.mjs'
import {cpdir} from './utils/cpdir.mjs'
import fs from 'fs'
import parse, {Native} from 'jass-to-ast'

const root = path.join('..')

const UI = path.join(root, 'src', 'UI')

rmdir(UI)
cpdir(path.join(root, 'src', 'umswe', 'UI'), UI)

/**
 * @param {string} filePath
 * @param {string} s
 * @param {string} part
 */
const append = (filePath, s, part) => {
    const data = fs.readFileSync(filePath)
    const h = `[${part}]`
    const pos = data.indexOf(h) + h.length
    fs.writeFileSync(filePath, Buffer.concat([data.subarray(0, pos), Buffer.from('\n' + s), data.subarray(pos)]))
}

const TriggerData = path.join(UI, 'TriggerData.txt')
const TriggerStrings = path.join(UI, 'TriggerStrings.txt')

const TriggerActionsMap = {}
const TriggerActions = []
const TriggerActionStrings = []
const TriggerCallsMap = {}
const TriggerCalls = []
const TriggerCallStrings = []

let cat = ''
for (const s of fs.readFileSync(TriggerData, {encoding: 'utf8', flag: 'r'}).split(/\r\n|\n/)) {
    const cm = s.match(/^\[([a-z0-9]+)\s*]/i)
    if (cm) cat = cm[1].trim()

    const m = s.match(/^([a-z][a-z0-9_]+)=/i)
    if (!m) continue
    const name = m[1]

    if (cat === 'TriggerActions') TriggerActionsMap[name] = true
    if (cat === 'TriggerCalls') TriggerCallsMap[name] = true
}

const WorldEditStringsList = []
const TriggerCategories = []
/**
 * @param {string} id
 * @param {string} name
 * @param {string} data
 */
const category = (id, name, data) => {
    WorldEditStringsList.push(`WESTRING_TRIGCAT_${id}=${name}`)
    TriggerCategories.push(`TC_${id}=WESTRING_TRIGCAT_${id},ReplaceableTextures\\WorldEditUI\\Actions-${data}`)
}
category('UJAPI', 'UjAPI', 'AI')
category('UJAPI_UNIT', 'UjAPI - Unit', 'Unit')
category('UJAPI_ABILITY', 'UjAPI - Ability', 'Nothing')
category('UJAPI_MATH', 'UjAPI - Math', 'Nothing')

/**
 * @param {string} name
 * @return {string}
 */
const categoryGet = name => {
    if (name.indexOf('Unit') >= 0) return 'UJAPI_UNIT'
    if (name.indexOf('Ability') >= 0) return 'UJAPI_ABILITY'
    if (name.indexOf('Math') >= 0) return 'UJAPI_MATH'
    return 'UJAPI'
}

/**
 * @param {Native} native
 * @param {boolean} actions
 */
const native = (native, actions) => {
    if (actions && TriggerActionsMap[native.name]) return
    if (!actions && TriggerCallsMap[native.name]) return

    const pa = ['1']
    if (!actions) pa.push('1', native.returns.toString())

    const pb = []
    const pc = [`"${native.name}("`]

    if (native.params) {
        for (const p of native.params) {
            pa.push(p.type)
            pb.push('_')
            pc.push(`"${p.type} ",`, `~${p.name}`, '", "')
        }
        pc.splice(-1)
    } else {
        pa.push('nothing')
    }
    pc.push('")"')

    const d = `
${native.name}=${pa.join(',')}
_${native.name}_Defaults=${pb.join(',')}
_${native.name}_Category=TC_${categoryGet(native.name)}
`
    const s = `
${native.name}=${native.name}
${native.name}=${pc.join(',')}
${native.name}Hint=[UJAPI]
`
    if (actions) {
        TriggerActions.push(d)
        TriggerActionStrings.push(s)
    } else {
        TriggerCalls.push(d)
        TriggerCallStrings.push(s)
    }
}

/**
 *  @param {Native} native
 *  @return {number}
 */
const TriggerDataPart = native => {
    const n = native.name
    const r = (native.returns ?? '').toString()

    if (
        n.startsWith('Get') ||
        n.startsWith('Math') ||
        n.startsWith('Is') ||
        n.startsWith('Convert') ||
        n.indexOf('2') >= 0 ||
        n.indexOf('Id') >= 0 && r === 'integer'
    ) return 2

    if (!native.returns) return 1
    return 3
}

for (const node of parse(fs.readFileSync(path.join('..', 'src', 'common.j'), {encoding: 'utf8', flag: 'r'}))) {
    if (node instanceof Native) {
        if (node.name.startsWith('Blz')) continue
        const part = TriggerDataPart(node)
        if (part & 1) native(node, true)
        if (part & 2) native(node, false)
    }
}


TriggerActions.sort((a, b) => a.localeCompare(b))
TriggerCalls.sort((a, b) => a.localeCompare(b))

append(TriggerData, TriggerActions.join('\n'), 'TriggerActions')
append(TriggerData, TriggerCalls.join('\n'), 'TriggerCalls')
append(TriggerStrings, TriggerActionStrings.join('\n'), 'TriggerActionStrings')
append(TriggerStrings, TriggerCallStrings.join('\n'), 'TriggerCallStrings')

WorldEditStringsList.sort((a, b) => a.localeCompare(b))
append(path.join(UI, 'WorldEditStrings.txt'), WorldEditStringsList.join('\n'), 'WorldEditStrings')
append(TriggerData, TriggerCategories.join('\n'), 'TriggerCategories')
