import {WorldEditStrings} from './edit-strings.mjs'

const TriggerCategories = []


const prettyName = s => String(s)
	.replace(/[_\-]+/g, ' ')
	.replace(/([A-Z]+)([A-Z][a-z])/g, '$1 $2')	// HTMLParser -> HTML Parser
	.replace(/([a-z0-9])([A-Z])/g, '$1 $2')		// camelCase -> camel Case
	.replace(/([A-Za-z])([0-9])/g, '$1 $2')		// X9 -> X 9
	.replace(/([0-9])([A-Za-z])/g, '$1 $2')		// 9X -> 9 X
	.replace(/\s+/g, ' ')
	.trim()

/**
 * @param {string} name
 * @param {string} data
 * @return {string}
 */
const add = (name, data = 'Nothing') => {
	let id = `${name}_MARS`
	const display = `${prettyName(name)} [MARS]`

	WorldEditStrings.push(`WESTRING_TRIGCAT_${id}=${display}`)
	TriggerCategories.push(`TC_${id}=WESTRING_TRIGCAT_${id},ReplaceableTextures\\WorldEditUI\\Actions-${data}`)

	return id
}

const CatCache = Object.create(null)

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

    /**
     * @param {...string} names
     * @return {boolean}
     */
    const s = (...names) => {
        for (const n of names) {
            if (name.startsWith(n)) return true
        }
        return false
    }

    /**
     * @param {...string} names
     * @return {boolean}
     */
    const e = (...names) => {
        for (const n of names) {
            if (name === n) return true
        }
        return false
    }

    const catComment = categoryFromComment(native)
    if (catComment) return getCat(catComment)

    if (categoryIsMath(native)) return getCat('Math')
    if (categoryIsBoolean(native)) return getCat('Boolean')

    if (s('Convert')) return getCat('Convert')
    if (s('Save', 'Load', 'HaveSaved', 'RemoveSaved') || c('Hashtable')) return getCat('Hashtable')
    if (c('HandleList')) return getCat('HandleList')
    if (s('HandleTo')) return getCat('Handle')
    if (c('To')) return getCat('Convert')

    if (c('Order')) return getCat('Order')

    if (c('War3Image')) return getCat('War3Image')
    if (c('Image')) return getCat('Image')

    if (c('Dialog')) return getCat('Dialog')
    if (c('Message')) return getCat('Message')

    if (c('Cache') || s('Store', 'HaveStored')) return getCat('GameCache')
    if (c('Game')) return getCat('Game')

    if (c('Unit', 'Corpse', 'Illusion', 'Building', 'Goldmine', 'ResourceAmount', 'EventAttack', 'EventDamage')) return getCat('Unit', 'Unit')
    if (c('Ability', 'SpellEffect')) return getCat('Ability')
    if (c('Buff')) return getCat('Buff')
    if (c('Frame')) return getCat('Frame')
    if (c('Waygate')) return getCat('Waygate')
    if (c('Trigger')) return getCat('Trigger')
    if (c('Timer')) return getCat('Timer')
    if (c('Sync')) return getCat('Sync')
    if (c('Widget', 'Indicator')) return getCat('Widget')
    if (c('Trackable')) return getCat('Trackable')
    if (c('Item')) return getCat('Item')
    if (c('Projectile')) return getCat('Projectile')
    if (c('Camera')) return getCat('Camera')
    if (c('Destructable')) return getCat('Destructable')
    if (c('Doodad')) return getCat('Doodad')
    if (c('Force')) return getCat('Force')
    if (c('Leaderboard')) return getCat('Leaderboard')
    if (c('Multiboard')) return getCat('Multiboard')
    if (c('Quest')) return getCat('Quest')
    if (c('Sound')) return getCat('Sound')
    if (c('Jass', 'Execute')) return getCat('Jass')
    if (c('Lightning')) return getCat('Lightning')
    if (c('CineFilter', 'Cinematic')) return getCat('Cinematic')
    if (c('TextFile')) return getCat('TextFile')
    if (c('TextTag')) return getCat('TextTag')
    if (c('Blight')) return getCat('Blight')
    if (c('Player')) return getCat('Player')
    if (c('Mouse')) return getCat('Mouse')
    if (c('Hero')) return getCat('Hero')
    if (c('String')) return getCat('String')
    if (c('Sprite')) return getCat('Sprite')
    if (c('SpecialEffect') || e('DestroyEffect')) return getCat('SpecialEffect')
    if (c('AntiHack', 'Cheat')) return getCat('AntiHack')
    if (c('Automation', 'Benchmark', 'Console')) return getCat('Test')
    if (c('Group')) return getCat('Group')
    if (c('Terrain')) return getCat('Terrain')
    if (c('Preload')) return getCat('Preload')
    if (c('Region')) return getCat('Region')
    if (c('Rect')) return getCat('Rect')
    if (c('Fog')) return getCat('Fog')
    if (c('Location')) return getCat('Location')
    if (c('Weather')) return getCat('Weather')
    if (c('Minimap')) return getCat('Minimap')
    if (c('Version')) return getCat('Version')
    if (c('Music')) return getCat('Music')

    return getCat('Misc')
}

/**
 * @param {import('jass-to-ast').Native} native
 * @return {boolean}
 */
const categoryIsMath = native =>
    native.name.indexOf('Math') >= 0 ||
    native.name.indexOf('Bitwise') >= 0 ||
    ['SquareRoot', 'Sin', 'Asin', 'Cos', 'Acos', 'Tan', 'Atan', 'Pow'].indexOf(native.name) >= 0

/**
 * @param {import('jass-to-ast').Native} native
 * @return {boolean}
 */
const categoryIsBoolean = native =>
    ['And', 'Or', 'Condition', 'Filter', 'Not'].indexOf(native.name) >= 0

/**
 * @param {import('jass-to-ast').Native} native
 * @return {string|null}
 */
const categoryFromComment = native => {
	const c = native.comment
	if (c == null) return null

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

export {TriggerCategories, categoryIsMath, categoryIsBoolean}
