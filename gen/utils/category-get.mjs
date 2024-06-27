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
const Force = add('Force')
const Leaderboard = add('Leaderboard')
const Multiboard = add('Multiboard')
const Quest = add('Quest')
const Order = add('Order')
const Sound = add('Sound')
const Image = add('Image')
const Jass = add('Jass')
const Lightning = add('Lightning')
const Cinematic = add('Cinematic')
const TextFile = add('TextFile')
const TextTag = add('TextTag')
const Blight = add('Blight')
const Player = add('Player')
const Mouse = add('Mouse')
const Hero = add('Hero')
const String = add('String')
const Sprite = add('Sprite')
const SpecialEffect = add('SpecialEffect')
const AntiHack = add('AntiHack')
const Test = add('Test')
const Group = add('Group')
const Dialog = add('Dialog')
const Message = add('Message')
const Terrain = add('Terrain')
const Preload = add('Preload')
const Region = add('Region')
const Rect = add('Rect')
const FogModifier = add('FogModifier')

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


    if (categoryIsMath(native)) return Math
    if (s('Convert')) return Convert
    if (s('Save', 'Load', 'HaveSaved', 'RemoveSaved') || c('Hashtable')) return Hashtable
    if (c('HandleList')) return HandleList
    if (s('HandleTo')) return Handle
    if (c('To')) return Convert

    if (c('Order')) return Order

    if (c('War3Image')) return War3Image
    if (c('Image')) return Image

    if (c('Dialog')) return Dialog
    if (c('Message')) return Message

    if (c('Unit', 'Corpse', 'Illusion', 'Building', 'Goldmine', 'ResourceAmount', 'EventAttack', 'EventDamage')) return Unit
    if (c('Ability', 'SpellEffect')) return Ability
    if (c('Buff')) return Buff
    if (c('Frame')) return Frame
    if (c('Waygate')) return Waygate
    if (c('Trigger')) return Trigger
    if (c('Timer')) return Timer
    if (c('Sync')) return Sync
    if (c('Widget', 'Indicator')) return Widget
    if (c('Trackable')) return Trackable
    if (c('Item')) return Item
    if (c('Projectile')) return Projectile
    if (c('Camera')) return Camera
    if (c('Destructable')) return Destructable
    if (c('Doodad')) return Doodad
    if (c('Force')) return Force
    if (c('Leaderboard')) return Leaderboard
    if (c('Multiboard')) return Multiboard
    if (c('Quest')) return Quest
    if (c('Sound')) return Sound
    if (c('Jass', 'Execute')) return Jass
    if (c('Lightning')) return Lightning
    if (c('CineFilter', 'Cinematic')) return Cinematic
    if (c('TextFile')) return TextFile
    if (c('TextTag')) return TextTag
    if (c('Blight')) return Blight
    if (c('Player')) return Player
    if (c('Mouse')) return Mouse
    if (c('Hero')) return Hero
    if (c('String')) return String
    if (c('Sprite')) return Sprite
    if (c('SpecialEffect')) return SpecialEffect
    if (c('AntiHack', 'Cheat')) return AntiHack
    if (c('Automation', 'Benchmark', 'Console')) return Test
    if (c('Group')) return Group
    if (c('Terrain')) return Terrain
    if (c('Preload')) return Preload
    if (c('Region')) return Region
    if (c('Rect')) return Rect
    if (c('FogModifier')) return FogModifier

    return Misc
}

/**
 * @param {import('jass-to-ast').Native} native
 * @return {boolean}
 */
const categoryIsMath = native =>
    native.name.indexOf('Math') >= 0 ||
    native.name.indexOf('Bitwise') >= 0 ||
    ['SquareRoot', 'Sin', 'Asin', 'Cos', 'Acos', 'Tan', 'Atan', 'Pow'].indexOf(native.name) >= 0

export {TriggerCategories, categoryIsMath}
