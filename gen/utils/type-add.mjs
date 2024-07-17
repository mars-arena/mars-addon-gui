import {WorldEditStrings} from './edit-strings.mjs'

const TriggerTypes = []
const TriggerTypesMap = {}

/**
 * @param {string} name
 * @param {string} base
 */
export default (name, base = '') => {
    if (TriggerTypesMap[name]) return
    let t = `${name}=0,1,1,WESTRING_TRIGTYPE_${name}`
    if (base.length > 0) t += `,${base}`
    TriggerTypes.push(t)
    WorldEditStrings.push(`WESTRING_TRIGTYPE_${name}=${name}`)
}

export {TriggerTypes, TriggerTypesMap}
