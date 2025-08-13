import nativeHint from './native-hint.mjs'
import categoryGet from './category-get.mjs'
import prettyName from './pretty-name.mjs'

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
 * @param {import('jass-to-ast').Native} native
 * @param {import('jass-to-ast').Param} param
 * @return {[string]}
 */
const getParam = (native, param) => {
    switch (param.type) {
        case 'integer':
            if (param.name === 'eventId') {
                return [param.type, '_']
            }
            if (param.name === 'unitTypeId' || param.name.toLowerCase().includes('unit')) {
                return ['unitcode', 'hfoo']
            }
            if (['abilityTypeId'].includes(param.name)) {
                return ['abilcode', '_']
            }
            return [param.type, '0']
        case 'real':
            return [param.type, '0']
        case 'boolean':
            return [param.type, 'true']
        case 'player':
            return [param.type, 'Player00']
        default:
            return [param.type, '_']
    }
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
    const returnType = native.returns ?? 'nothing'

    const argTypes = ['1']
    if (section === 'TriggerCalls') argTypes.push('1', returnType)

    const argDefaults = []

    const params = []
    let first = true
    for (const param of (native.params ?? [])) {
        if (section === 'TriggerEvents' && first) {
            first = false
            continue
        }
        first = false
        params.push(param)
    }
    for (const param of params) {
        const [type, def] = getParam(native, param)
        argTypes.push(type)
        argDefaults.push(def)
    }

    if (params.length === 0) {
        argTypes.push('nothing')
    }

    const pretty = prettyName(name)

    const displayPieces = []
    if (params.length === 0) {
        displayPieces.push(`"${pretty}"`)
    } else {
        displayPieces.push(`"${pretty} ("`)
        for (let i = 0; i < params.length; i++) {
            displayPieces.push(`~${params[i].name}`)
            if (i < params.length - 1) displayPieces.push('", "')
        }
        displayPieces.push('")"')
    }

    const declarationList = [
        `${name}=${argTypes.join(',')}`,
        `_${name}_Defaults=${argDefaults.join(',')}`,
        `_${name}_Category=TC_${categoryGet(native)}`
    ]
    if (native.alias) declarationList.push(`_${name}_ScriptName=${native.name}`)
    const declarations = declarationList.join('\n') + '\n'

    const stringList = [
        `${name}=${prettyName(native.name)}`,
        `${name}=${displayPieces.join(',')}`,
        `${name}Hint="${hint}"`
    ]
    if (native.alias) stringList[0] += ` (${native.alias.join(', ')})`
    const strings = stringList.join('\n') + '\n'

    if (section === 'TriggerActions') {
        TriggerActionsMap[name] = true
        TriggerActions.push(declarations)
        TriggerActionStrings.push(strings)
    } else if (section === 'TriggerCalls') {
        TriggerCallsMap[name] = true
        TriggerCalls.push(declarations)
        TriggerCallStrings.push(strings)
    } else {
        TriggerEventsMap[name] = true
        TriggerEvents.push(declarations)
        TriggerEventStrings.push(strings)
    }
}

export {
    TriggerActionsMap, TriggerActions, TriggerActionStrings,
    TriggerCallsMap, TriggerCalls, TriggerCallStrings,
    TriggerEventsMap, TriggerEvents, TriggerEventStrings
}
