import {WorldEditStrings} from './edit-strings.mjs'
import prettyName from './pretty-name.mjs'

const TriggerCategories = []
const CatCache = {}

/**
 * @param {string} name
 * @param {string} data
 * @return {string}
 */
const add = (name, data = 'Nothing') => {
    const id = `${name}_MARS`
    const display = `${prettyName(name)} [MARS]`

    WorldEditStrings.push(`WESTRING_TRIGCAT_${id}=${display}`)
    TriggerCategories.push(`TC_${id}=WESTRING_TRIGCAT_${id},ReplaceableTextures\\WorldEditUI\\Actions-${data}`)

    return id
}

/**
 * @param {string} name
 * @param {string} data
 * @return {string}
 */
const getCat = (name, data = 'Nothing') => {
    if (CatCache[name]) return CatCache[name]
    CatCache[name] = add(name, data)
    return CatCache[name]
}

/**
 * @param {import('jass-to-ast').Native} native
 * @return {boolean}
 */
const categoryIsMath = native =>
    native.name.includes('Math') ||
    native.name.includes('Bitwise') ||
    ['SquareRoot', 'Sin', 'Asin', 'Cos', 'Acos', 'Tan', 'Atan', 'Pow'].includes(native.name)

/**
 * @param {import('jass-to-ast').Native} native
 * @return {boolean}
 */
const categoryIsBoolean = native =>
    ['And', 'Or', 'Condition', 'Filter', 'Not'].includes(native.name)

/**
 * @param {import('jass-to-ast').Native} native
 * @return {string|null}
 */
const categoryFromComment = native => {
    const c = native.comment
    if (c === null) return null

    let text = typeof c === 'string'
        ? c
        : (c && c.value) ? c.value : String(c)

    const bang = text.indexOf('!')
    if (bang < 0) return null

    text = text.slice(bang).trim()
    if (!text.startsWith('!')) return null

    const m = text.match(/\[([^\]]+)\]/)
    return m ? m[1].trim() : null
}

/**
 * @param {import('jass-to-ast').Native} native
 * @return {string}
 */
export default native => {
    const name = native.name

    const has = (...names) => names.some(n => name.includes(n))
    const starts = (...names) => names.some(n => name.startsWith(n))
    const eq = (...names) => names.some(n => name === n)

    const catComment = categoryFromComment(native)
    if (catComment) return getCat(catComment)

    if (categoryIsMath(native)) return getCat('Math')
    if (categoryIsBoolean(native)) return getCat('Boolean')

    if (starts('Convert')) return getCat('Convert')
    if (starts('Save', 'Load', 'HaveSaved', 'RemoveSaved') || has('Hashtable')) return getCat('Hashtable')
    if (has('HandleList')) return getCat('HandleList')
    if (starts('HandleTo')) return getCat('Handle')
    if (has('To')) return getCat('Convert')

    if (has('Order')) return getCat('Order')

    if (has('War3Image')) return getCat('War3Image')
    if (has('Image')) return getCat('Image')

    if (has('Dialog')) return getCat('Dialog')
    if (has('Message')) return getCat('Message')

    if (has('Cache') || starts('Store', 'HaveStored')) return getCat('GameCache')
    if (has('Game')) return getCat('Game')

    if (has('Unit', 'Corpse', 'Illusion', 'Building', 'Goldmine', 'ResourceAmount', 'EventAttack', 'EventDamage')) return getCat('Unit', 'Unit')
    if (has('Ability', 'SpellEffect')) return getCat('Ability')
    if (has('Buff')) return getCat('Buff')
    if (has('Frame')) return getCat('Frame')
    if (has('Waygate')) return getCat('Waygate')
    if (has('Trigger')) return getCat('Trigger')
    if (has('Timer')) return getCat('Timer')
    if (has('Sync')) return getCat('Sync')
    if (has('Widget', 'Indicator')) return getCat('Widget')
    if (has('Trackable')) return getCat('Trackable')
    if (has('Item')) return getCat('Item')
    if (has('Projectile')) return getCat('Projectile')
    if (has('Camera')) return getCat('Camera')
    if (has('Destructable')) return getCat('Destructable')
    if (has('Doodad')) return getCat('Doodad')
    if (has('Force')) return getCat('Force')
    if (has('Leaderboard')) return getCat('Leaderboard')
    if (has('Multiboard')) return getCat('Multiboard')
    if (has('Quest')) return getCat('Quest')
    if (has('Sound')) return getCat('Sound')
    if (has('Jass', 'Execute')) return getCat('Jass')
    if (has('Lightning')) return getCat('Lightning')
    if (has('CineFilter', 'Cinematic')) return getCat('Cinematic')
    if (has('TextFile')) return getCat('TextFile')
    if (has('TextTag')) return getCat('TextTag')
    if (has('Blight')) return getCat('Blight')
    if (has('Player')) return getCat('Player')
    if (has('Mouse')) return getCat('Mouse')
    if (has('Hero')) return getCat('Hero')
    if (has('String')) return getCat('String')
    if (has('Sprite')) return getCat('Sprite')
    if (has('SpecialEffect') || eq('DestroyEffect')) return getCat('SpecialEffect')
    if (has('AntiHack', 'Cheat')) return getCat('AntiHack')
    if (has('Automation', 'Benchmark', 'Console')) return getCat('Test')
    if (has('Group')) return getCat('Group')
    if (has('Terrain')) return getCat('Terrain')
    if (has('Preload')) return getCat('Preload')
    if (has('Region')) return getCat('Region')
    if (has('Rect')) return getCat('Rect')
    if (has('Fog')) return getCat('Fog')
    if (has('Location')) return getCat('Location')
    if (has('Weather')) return getCat('Weather')
    if (has('Minimap')) return getCat('Minimap')
    if (has('Version')) return getCat('Version')
    if (has('Music')) return getCat('Music')

    return getCat('Misc')
}

export {TriggerCategories, categoryIsMath, categoryIsBoolean}
