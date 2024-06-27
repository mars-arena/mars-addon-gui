import {WorldEditStringsList} from './edit-strings.mjs'

const TriggerTypes = []
const TriggerTypesMap = {}

/**
 * @param {import('jass-to-ast').Type} type
 * @param type
 */
export default type => {
    if (TriggerTypesMap[type.base]) return
    TriggerTypes.push(`${type.base}=1,1,1,WESTRING_TRIGTYPE_${type.base}`)
    WorldEditStringsList.push(`WESTRING_TRIGTYPE_${type.base}=${type.base}`)
}

export {TriggerTypes, TriggerTypesMap}
