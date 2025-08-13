import nativeHint from './native-hint.mjs'
import categoryGet from './category-get.mjs'

const TriggerActionsMap = {}
const TriggerActions = []
const TriggerActionStrings = []

const TriggerCallsMap = {}
const TriggerCalls = []
const TriggerCallStrings = []

const TriggerEventsMap = {}
const TriggerEvents = []
const TriggerEventStrings = []

/**
 * @param {import('jass-to-ast').Native} n
 * @param {import('jass-to-ast').Param} p
 * @return {[string]}
 */
const param = (n, p) => {
    switch (p.type) {
        case 'integer':
            if (p.name === 'projectileTypeId') {
                return ['projectilecode', 'Missile']
            }

            if (p.name === 'unitTypeId' || p.name.toLowerCase().indexOf('unit') >= 0) {
                return ['unitcode', 'hfoo']
            }

            if (['abilityTypeId'].indexOf(p.name) >= 0) {
                return ['abilcode', '_']
            }
            return [p.type, '0']
        case 'real':
            return [p.type, '0']
        case 'boolean':
            return [p.type, 'true']
        case 'player':
            return [p.type, 'Player00']
    }
    return [p.type, '_']
}

/**
 * @param {import('jass-to-ast').Native & {alias?: string[]}} native
 * @param {'TriggerActions'|'TriggerCalls'|'TriggerEvents'} section
 */
export default (native, section) => {
    const name = `${native.name}${(native.alias ?? []).join('')}`

    if (name.startsWith('Blz')) return

    if (section === 'TriggerActions' && TriggerActionsMap[name]) return
    if (section === 'TriggerCalls' && TriggerCallsMap[name]) return
    if (section === 'TriggerEvents' && TriggerEventsMap[name]) return

    const hint = nativeHint(native)

    const r = native.returns ?? 'nothing'

    const pa = ['1']
    if (section === 'TriggerCalls') pa.push('1', r)

    const pb = []
    const pc = [`"${name}("`]

    if (native.params) {
        let first = true
        for (const p of native.params) {
            if (section === 'TriggerEvents' && first) {
                first = false
                continue
            }
            first = false

            const [type, def] = param(native, p)
            pa.push(type)
            pb.push(def)
            pc.push(`~${p.name}`, '", "')
        }
        if (pb.length > 0) pc.splice(-1)
    } else {
        pa.push('nothing')
    }
    pc.push('")"')

    const dlist = [
        `${name}=${pa.join(',')}`,
        `_${name}_Defaults=${pb.join(',')}`,
        `_${name}_Category=TC_${categoryGet(native)}`
    ]
    if (native.alias) dlist.push(`_${name}_ScriptName=${native.name}`)
    const d = dlist.join('\n') + '\n'

    const slist = [
        `${name}=${native.name}`,
        `${name}=${pc.join(',')}`,
        `${name}Hint="${hint}"`
    ]
    if (native.alias) slist[0] += ` (${native.alias.join(', ')})`
    const s = slist.join('\n') + '\n'

    if (section === 'TriggerActions') {
        TriggerActionsMap[name] = true
        TriggerActions.push(d)
        TriggerActionStrings.push(s)
    } else if (section === 'TriggerCalls') {
        TriggerCallsMap[name] = true
        TriggerCalls.push(d)
        TriggerCallStrings.push(s)
    } else {
        TriggerEventsMap[name] = true
        TriggerEvents.push(d)
        TriggerEventStrings.push(s)
    }
}

export {
    TriggerActionsMap, TriggerActions, TriggerActionStrings,
    TriggerCallsMap, TriggerCalls, TriggerCallStrings,
    TriggerEventsMap, TriggerEvents, TriggerEventStrings
}
