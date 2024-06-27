import {WorldEditStringsList} from './edit-strings.mjs'

const TriggerCategories = []

/**
 * @param {string} id
 * @param {string} name
 * @param {string} data
 */
const add = (id, name, data) => {
    WorldEditStringsList.push(`WESTRING_TRIGCAT_${id}=${name}`)
    TriggerCategories.push(`TC_${id}=WESTRING_TRIGCAT_${id},ReplaceableTextures\\WorldEditUI\\Actions-${data}`)
}
add('UJAPI', 'UjAPI', 'AI')
add('UJAPI_UNIT', 'UjAPI - Unit', 'Unit')
add('UJAPI_ABILITY', 'UjAPI - Ability', 'Nothing')
add('UJAPI_MATH', 'UjAPI - Math', 'Nothing')
add('UJAPI_CONVERT', 'UjAPI - Convert', 'Nothing')

/**
 * @param {import('jass-to-ast').Native} native
 * @return {string}
 */
export default native => {
    const name = native.name

    if (name.startsWith('Convert')) return 'UJAPI_CONVERT'
    if (name.indexOf('Unit') >= 0) return 'UJAPI_UNIT'
    if (name.indexOf('Ability') >= 0) return 'UJAPI_ABILITY'
    if (name.indexOf('Math') >= 0) return 'UJAPI_MATH'

    return 'UJAPI'
}

export {TriggerCategories}
