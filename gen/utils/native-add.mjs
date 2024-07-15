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
            if (p.name.toLowerCase().indexOf('unit') >= 0) {
                return ['unitcode', 'hfoo']
            }
            if (n.name.toLowerCase().indexOf('ability') >= 0) {
                if (['aid', 'abilid', 'abilcode'].indexOf(p.name.toLowerCase()) >= 0) {
                    return ['abilcode', '_']
                }
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
 * @param {import('jass-to-ast').Native} native
 * @param {boolean} actions
 */
export default (native, actions) => {
    if (native.name.startsWith('Blz')) return

    if (actions && TriggerActionsMap[native.name]) return
    if (!actions && TriggerCallsMap[native.name]) return

    const hint = nativeHint(native)

    const r = native.returns ?? 'nothing'

    const pa = ['1']
    if (!actions) pa.push('1', r)

    const pb = []
    const pc = [`"${native.name}("`]

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

    const d = `
${native.name}=${pa.join(',')}
_${native.name}_Defaults=${pb.join(',')}
_${native.name}_Category=TC_${categoryGet(native)}
`
    const s = `
${native.name}=${native.name}
${native.name}=${pc.join(',')}
${native.name}Hint="${hint}"
`
    if (actions) {
        TriggerActions.push(d)
        TriggerActionStrings.push(s)
    } else {
        TriggerCalls.push(d)
        TriggerCallStrings.push(s)
    }
}

export {TriggerActionsMap, TriggerActions, TriggerActionStrings, TriggerCallsMap, TriggerCalls, TriggerCallStrings}
