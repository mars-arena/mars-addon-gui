import nativeHint from './native-hint.mjs'
import categoryGet from './category-get.mjs'

const TriggerActionsMap = {}
const TriggerActions = []
const TriggerActionStrings = []

const TriggerCallsMap = {}
const TriggerCalls = []
const TriggerCallStrings = []

/**
 * @param {import('jass-to-ast').Native} n
 * @param {import('jass-to-ast').Param} p
 * @return {[string]}
 */
const param = (n, p) => {
    switch (p.type) {
        case 'integer':
            if (p.name === 'projectileTypeId') {
                return ['projectiletype', 'Param_PROJECTILE_TYPE_BULLET']
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
 * @param {import('jass-to-ast').Native & {alias?: string[]}}  native
 * @param {boolean} actions
 */
export default (native, actions) => {
    const name = `${native.name}${(native.alias ?? []).join('')}`

    if (name.startsWith('Blz')) return

    if (actions && TriggerActionsMap[name]) return
    if (!actions && TriggerCallsMap[name]) return

    const hint = nativeHint(native)

    const r = native.returns ?? 'nothing'

    const pa = ['1']
    if (!actions) pa.push('1', r)

    const pb = []
    const pc = [`"${name}("`]

    if (native.params) {
        for (const p of native.params) {
            const [type, def] = param(native, p)
            pa.push(type)
            pb.push(def)
            pc.push(`~${p.name}`, '", "')
        }
        pc.splice(-1)
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
    let d = dlist.join('\n') + '\n'

    const slist = [
        `${name}=${native.name}`,
        `${name}=${pc.join(',')}`,
        `${name}Hint="${hint}"`
    ]
    if (native.alias) slist[0] += ` (${native.alias.join(', ')})`
    const s = slist.join('\n') + '\n'

    if (actions) {
        TriggerActions.push(d)
        TriggerActionStrings.push(s)
    } else {
        TriggerCalls.push(d)
        TriggerCallStrings.push(s)
    }
}

export {TriggerActionsMap, TriggerActions, TriggerActionStrings, TriggerCallsMap, TriggerCalls, TriggerCallStrings}
