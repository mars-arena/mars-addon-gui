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
const WorldEditStrings = path.join(UI, 'WorldEditStrings.txt')

append(TriggerData, 'TC_UJAPI=WESTRING_TRIGCAT_UJAPI,ReplaceableTextures\\WorldEditUI\\Actions-AI', 'TriggerCategories')
append(WorldEditStrings, 'WESTRING_TRIGCAT_UJAPI=UjAPI', 'WorldEditStrings')

let TriggerActions = ''
let TriggerActionStrings = ''

const TriggerActionsMap = {}

let cat = ''
for (const s of fs.readFileSync(TriggerData, {encoding: 'utf8', flag: 'r'}).split(/\r\n|\n/)) {
    const cm = s.match(/^\[([a-z0-9]+)\s*]/i)
    if (cm) cat = cm[1].trim()

    if (cat === 'TriggerActions') {
        const m = s.match(/^([a-z][a-z0-9_]+)=/i)
        if (!m) continue
        TriggerActionsMap[m[1]] = true
    }
}

for (const node of parse(fs.readFileSync(path.join('..', 'src', 'common.j'), {encoding: 'utf8', flag: 'r'}))) {
    if (node instanceof Native) {
        if (TriggerActionsMap[node.name]) continue

        const pa = ['1']
        const pb = []
        const pc = [`"${node.name}("`]

        if (node.params) {
            for (const p of node.params) {
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
${node.name}=${pa.join(',')}
_${node.name}_Defaults=${pb.join(',')}
_${node.name}_Category=TC_UJAPI
`
        const s = `
${node.name}=${node.name}
${node.name}=${pc.join(',')}
${node.name}Hint=[UJAPI]
`
        TriggerActions += d
        TriggerActionStrings += s
    }
}

append(TriggerData, TriggerActions, 'TriggerActions')
append(TriggerStrings, TriggerActionStrings, 'TriggerActionStrings')

/*
GetTriggerEventId=0,1,eventid,nothing
constant native GetTriggerEventId takes nothing returns eventid

GetTriggeringTrackable=0,0,trackable,nothing
constant native GetTriggeringTrackable takes nothing returns trackable

https://xgm.guru/p/wc3/addingactionstotriggereditor

 */

