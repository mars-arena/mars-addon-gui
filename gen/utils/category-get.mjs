import {WorldEditStringsList} from './edit-strings.mjs'

const TriggerCategories = []

/**
 * @param {string} name
 * @param {string} data
 * @return {string}
 */
const add = (name, data = 'Nothing') => {
    let id = `UjAPI_${name}`
    name = `UjAPI - ${name}`

    WorldEditStringsList.push(`WESTRING_TRIGCAT_${id}=${name}`)
    TriggerCategories.push(`TC_${id}=WESTRING_TRIGCAT_${id},ReplaceableTextures\\WorldEditUI\\Actions-${data}`)

    return id
}
const Misc = add('Misc')
const Unit = add('Unit', 'Unit')
const Ability = add('Ability')
const Math = add('Math')
const Convert = add('Convert')
const Buff = add('Buff')
const Frame = add('Frame')
const Waygate = add('Waygate')
const Trigger = add('Trigger')
const Timer = add('Timer')
const Sync = add('Sync')
const Widget = add('Widget')
const Trackable = add('Trackable')
const Item = add('Item')
const Projectile = add('Projectile')
const Camera = add('Camera')
const War3Image = add('War3Image')
const Hashtable = add('Hashtable')
const Destructable = add('Destructable')
const Doodad = add('Doodad')
const HandleList = add('HandleList')
const Handle = add('Handle')

/**
 * @param {import('jass-to-ast').Native} native
 * @return {string}
 */
export default native => {
    const name = native.name

    /**
     * @param {...string} names
     * @return {boolean}
     */
    const c = (...names) => {
        for (const n of names) {
            if (name.indexOf(n) >= 0) return true
        }
        return false
    }

    if (categoryIsMath(native)) return Math
    if (name.startsWith('Convert')) return Convert
    if (name.startsWith('Save') || name.startsWith('Load')) return Hashtable
    if (c('HandleList')) return HandleList
    if (name.startsWith('HandleTo')) return Handle

    if (c('Unit', 'Corpse', 'Illusion', 'Building')) return Unit
    if (c('Ability')) return Ability
    if (c('Buff')) return Buff
    if (c('Frame')) return Frame
    if (c('Waygate')) return Waygate
    if (c('Trigger')) return Trigger
    if (c('Timer')) return Timer
    if (c('Sync')) return Sync
    if (c('Widget')) return Widget
    if (c('Trackable')) return Trackable
    if (c('Item')) return Item
    if (c('Projectile')) return Projectile
    if (c('Camera')) return Camera
    if (c('War3Image')) return War3Image
    if (c('Destructable')) return Destructable
    if (c('Doodad')) return Doodad

    return Misc
}

/**
 * @param {import('jass-to-ast').Native} native
 * @return {boolean}
 */
const categoryIsMath = native =>
    native.name.indexOf('Math') >= 0 ||
    native.name.indexOf('Bitwise') >= 0 ||
    ['SquareRoot', 'Sin', 'Asin', 'Cos', 'Acos', 'Tan', 'Atan'].indexOf(native.name) >= 0

export {TriggerCategories, categoryIsMath}
