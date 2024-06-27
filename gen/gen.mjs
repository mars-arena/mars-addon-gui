import path from 'path'
import {rmdir} from './utils/rmdir.mjs'
import {cpdir} from './utils/cpdir.mjs'
import fs from 'fs'
import parse, {Native, Type} from 'jass-to-ast'
import nativeAdd, {
    TriggerActions,
    TriggerActionsMap,
    TriggerActionStrings,
    TriggerCalls,
    TriggerCallsMap, TriggerCallStrings
} from './utils/native-add.mjs'
import {TriggerCategories} from './utils/category-get.mjs'
import nativeSection from './utils/native-section.mjs'
import fileDataAppend from './utils/file-data-append.mjs'
import {WorldEditStringsList} from './utils/edit-strings.mjs'
import typeAdd, {TriggerTypes, TriggerTypesMap} from './utils/type-add.mjs'

const root = path.join('..')
const UI = path.join(root, 'src', 'UI')

rmdir(UI)
cpdir(path.join(root, 'src', 'umswe', 'UI'), UI)

const TriggerData = path.join(UI, 'TriggerData.txt')
const TriggerStrings = path.join(UI, 'TriggerStrings.txt')


let cat = ''
for (const s of fs.readFileSync(TriggerData, {encoding: 'utf8', flag: 'r'}).split(/\r\n|\n/)) {
    const cm = s.match(/^\[([a-z0-9]+)\s*]/i)
    if (cm) cat = cm[1].trim()

    const m = s.match(/^([a-z][a-z0-9_]+)=/i)
    if (!m) continue
    const name = m[1]

    if (cat === 'TriggerActions') TriggerActionsMap[name] = true
    if (cat === 'TriggerCalls') TriggerCallsMap[name] = true
    if (cat === 'TriggerTypes') TriggerTypesMap[name] = true
}

for (const node of parse(fs.readFileSync(path.join('..', 'src', 'common.j'), {encoding: 'utf8', flag: 'r'}))) {
    if (node instanceof Native) {
        /** @type {number} */ const part = nativeSection(node)
        if (part & 1) nativeAdd(node, true)
        if (part & 2) nativeAdd(node, false)
    }

    if (node instanceof Type) {
        typeAdd(node)
    }
}

TriggerActions.sort((a, b) => a.localeCompare(b))
fileDataAppend(TriggerData, TriggerActions.join('\n'), 'TriggerActions')

TriggerCalls.sort((a, b) => a.localeCompare(b))
fileDataAppend(TriggerData, TriggerCalls.join('\n'), 'TriggerCalls')

TriggerTypes.sort((a, b) => a.localeCompare(b))
fileDataAppend(TriggerData, TriggerTypes.join('\n'), 'TriggerTypes')

fileDataAppend(TriggerStrings, TriggerActionStrings.join('\n'), 'TriggerActionStrings')
fileDataAppend(TriggerStrings, TriggerCallStrings.join('\n'), 'TriggerCallStrings')

WorldEditStringsList.sort((a, b) => a.localeCompare(b))
fileDataAppend(path.join(UI, 'WorldEditStrings.txt'), WorldEditStringsList.join('\n'), 'WorldEditStrings')
fileDataAppend(TriggerData, TriggerCategories.join('\n'), 'TriggerCategories')
