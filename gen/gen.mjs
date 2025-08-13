import path from 'path'
import fs from 'fs'
import parse, {Globals, Native, Type, Variable} from 'jass-to-ast'

import {rmdir} from './utils/rmdir.mjs'
import {cpdir} from './utils/cpdir.mjs'
import nativeAdd, {
    TriggerActions, TriggerActionsMap, TriggerActionStrings,
    TriggerCalls, TriggerCallsMap, TriggerCallStrings,
    TriggerEvents, TriggerEventsMap, TriggerEventStrings
} from './utils/native-add.mjs'
import {TriggerCategories} from './utils/category-get.mjs'
import nativeSection from './utils/native-section.mjs'
import fileDataAppend from './utils/file-data-append.mjs'
import {WorldEditStrings} from './utils/edit-strings.mjs'
import typeAdd, {TriggerTypes, TriggerTypesMap} from './utils/type-add.mjs'
import capitalize from './utils/capitalize.mjs'
import {paramAdd, TriggerParams} from './utils/param.mjs'

let commonApi = process.argv[2]
if (!commonApi) {
    console.error('Usage: npm run generate ./data/common.vj')
    process.exit(1)
}
commonApi = path.resolve(commonApi)
if (!fs.existsSync(commonApi)) {
    console.error(`File is not found: ${commonApi}`)
    process.exit(1)
}

const UI = path.join('.', 'dist', 'UI')
const TriggerData = path.join(UI, 'TriggerData.txt')
const TriggerStrings = path.join(UI, 'TriggerStrings.txt')

rmdir(UI)
cpdir(path.join('.', 'data', 'umswe', 'UI'), UI)

const read = p => fs.readFileSync(p, {encoding: 'utf8', flag: 'r'}).replace(/\r\n/g, '\n')

/**
 * @param {string} file
 * @param {string[]} list
 * @param {string} section
 */
const sortAppend = (file, list, section) => {
    list.sort((a, b) => a.localeCompare(b))
    fileDataAppend(file, list.join('\n'), section)
}

/**
 * @param {string[]} sections
 * @param {import('jass-to-ast').Native} native
 */
const nativeAddWrapper = (sections, native) => {
    for (const section of sections) nativeAdd(native, section)
}

const WIDGET_TYPES = ['unit', 'item', 'destructable']
const i2a = i => WIDGET_TYPES[i]

{
    let cat = ''
    for (const s of read(TriggerData).split('\n')) {
        const cm = s.match(/^\[([a-z0-9]+)\s*]/i)
        if (cm) cat = cm[1].trim()

        const m = s.match(/^([a-z][a-z0-9_]+)=/i)
        if (!m) continue
        const name = m[1]

        if (cat === 'TriggerActions') TriggerActionsMap[name] = true
        if (cat === 'TriggerCalls') TriggerCallsMap[name] = true
        if (cat === 'TriggerTypes') TriggerTypesMap[name] = true
        if (cat === 'TriggerEvents') TriggerEventsMap[name] = true
    }
}

for (const node of parse(read(commonApi))) {
    if (node instanceof Native) {
        const sections = nativeSection(node)

        if (node.params) {
            const list = []
            for (const p of node.params) {
                if (p.type === 'widget') list.push(0)
            }

            if (list.length > 0) {
                for (let j = 0; j < Math.pow(3, list.length); j++) {
                    const native = structuredClone(node)

                    let w = -1
                    native.alias = []
                    for (const p of native.params) {
                        if (p.type === 'widget') {
                            p.type = i2a(list[++w])
                            native.alias.push(capitalize(p.type))
                        }
                    }

                    nativeAddWrapper(sections, native)

                    for (let i = 0; i < list.length; i++) {
                        if (list[i] < 2) {
                            list[i] += 1
                            break
                        }
                        list[i] = 0
                    }
                }
                continue
            }
        }

        nativeAddWrapper(sections, node)
    }

    if (node instanceof Type) {
        typeAdd(node.base)
    }

    if (node instanceof Globals) {
        for (const v of node.globals) {
            if (v instanceof Variable) {
                paramAdd(v.name, null, v.type, v.name)
            }
        }
    }
}

sortAppend(TriggerData, TriggerActions, 'TriggerActions')
sortAppend(TriggerData, TriggerCalls, 'TriggerCalls')
sortAppend(TriggerData, TriggerTypes, 'TriggerTypes')
sortAppend(TriggerData, TriggerCategories, 'TriggerCategories')
sortAppend(TriggerData, TriggerParams, 'TriggerParams')
sortAppend(TriggerData, TriggerEvents, 'TriggerEvents')

fileDataAppend(TriggerStrings, TriggerActionStrings.join('\n'), 'TriggerActionStrings')
fileDataAppend(TriggerStrings, TriggerCallStrings.join('\n'), 'TriggerCallStrings')
fileDataAppend(TriggerStrings, TriggerEventStrings.join('\n'), 'TriggerEventStrings')

WorldEditStrings.sort((a, b) => a.localeCompare(b))
fileDataAppend(path.join(UI, 'WorldEditStrings.txt'), WorldEditStrings.join('\n'), 'WorldEditStrings')

