import path from 'path'
import {rmdir} from './utils/rmdir.mjs'
import {cpdir} from './utils/cpdir.mjs'
import fs from 'fs'
import parse, {Globals, Native, Type, Variable} from 'jass-to-ast'
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

const UI = path.join('.', 'dist', 'UI')

rmdir(UI)
cpdir(path.join('.', 'data', 'umswe', 'UI'), UI)
const read = p => fs.readFileSync(p, {encoding: 'utf8', flag: 'r'}).replace(/\r\n/g, '\n')


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
    if (cat === 'TriggerEvents') TriggerEventsMap[name] = true
}

/**
 * @param {number} part
 * @param {Native} native
 */
/** @param {string[]} sections @param {import('jass-to-ast').Native} native */
const nativeAddWrapper = (sections, native) => {
	for (const sec of sections) nativeAdd(native, sec)
}

const i2a = i => {
    switch (i) {
        case 0 :
            return 'unit'
        case 1:
            return 'item'
        case 2:
            return 'destructable'
    }
}

for (const node of parse(read(path.join('.', 'data', 'common.j')))) {
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


TriggerActions.sort((a, b) => a.localeCompare(b))
fileDataAppend(TriggerData, TriggerActions.join('\n'), 'TriggerActions')

TriggerCalls.sort((a, b) => a.localeCompare(b))
fileDataAppend(TriggerData, TriggerCalls.join('\n'), 'TriggerCalls')

TriggerTypes.sort((a, b) => a.localeCompare(b))
fileDataAppend(TriggerData, TriggerTypes.join('\n'), 'TriggerTypes')

TriggerCategories.sort((a, b) => a.localeCompare(b))
fileDataAppend(TriggerData, TriggerCategories.join('\n'), 'TriggerCategories')

TriggerParams.sort((a, b) => a.localeCompare(b))
fileDataAppend(TriggerData, TriggerParams.join('\n'), 'TriggerParams')

TriggerEvents.sort((a, b) => a.localeCompare(b))
fileDataAppend(TriggerData, TriggerEvents.join('\n'), 'TriggerEvents')

fileDataAppend(TriggerStrings, TriggerActionStrings.join('\n'), 'TriggerActionStrings')
fileDataAppend(TriggerStrings, TriggerCallStrings.join('\n'), 'TriggerCallStrings')
fileDataAppend(TriggerStrings, TriggerEventStrings.join('\n'), 'TriggerEventStrings')

WorldEditStrings.sort((a, b) => a.localeCompare(b))
fileDataAppend(path.join(UI, 'WorldEditStrings.txt'), WorldEditStrings.join('\n'), 'WorldEditStrings')

