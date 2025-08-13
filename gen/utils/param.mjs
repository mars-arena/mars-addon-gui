import {WorldEditStrings} from './edit-strings.mjs'

const TriggerParams = []

/**
 * @param {string} id
 * @param {?string} name
 * @param {string} type
 * @param {string} value
 */
const paramAdd = (id, name, type, value) => {
    const s = `WESTRING_PARAM_${id}`
    WorldEditStrings.push(`${s}=${name ?? id}`)
    TriggerParams.push(`Param_${id}=1,${type},${value},${s}`)
}

export {paramAdd, TriggerParams}
