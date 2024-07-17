import {WorldEditStrings} from './edit-strings.mjs'
import typeAdd from './type-add.mjs'

const TriggerParams = []

/**
 * @param {string} name
 * @param {string} type
 * @param {string} value
 */
const paramAdd = (name, type, value) => {
    const s = `WESTRING_PARAM_${name}`
    WorldEditStrings.push(`${s}=${name}`)
    TriggerParams.push(`Param_${name}=1,${type},${value},${s}`)
}

// Projectile API
// For Projectile Type Ids, https,//github.com/UnryzeC/UjAPI/blob/main/TypeData/ in there check out these files, WC3BulletList.txt / WC3MissileList.txt / WC3ArtilleryList.txt

const projectile = [
    // WC3BulletList.txt
    ['+w3B', 'BulletBase'],
    ['+wbu', 'Bullet'],
    ['+wbp', 'BulletPath'],
    // WC3MissileList.txt
    ['MUds', 'MissileDarkSummoning'],
    ['Mabs', 'MissileAbsorb'],
    ['Mdvm', 'MissileDevourMagic'],
    ['MNdr', 'MissileDrain'],
    ['MNdh', 'MissileDrunkenHaze'],
    ['MNef', 'MissileElementalFury'],
    ['Mens', 'MissileEnsnare'],
    ['Mweb', 'MissileWeb'],
    ['MNic', 'MissileIncinerate'],
    ['MNlm', 'MissileLavaMonster'],
    ['MNfl', 'MissileForkedLightning'],
    ['MUdc', 'MissileDeathCoil'],
    ['MIdc', 'MissileItemDispelChain'],
    ['Mfir', 'MissileFire'],
    ['MIlp', 'MissileLightningPurge'],
    ['MIls', 'MissileLightningPurgeSplash'],
    ['MIpb', 'MissilePoisonDamage'],
    ['MIps', 'MissilePoisonDamageSplash'],
    ['MIcb', 'MissileCorruption'],
    ['MIcs', 'MissileCorruptionSplash'],
    ['MIsb', 'MissileSpellEffect'],
    ['MIss', 'MissileSpellEffectSplash'],
    ['Mlit', 'MissileLightningAttack'],
    ['MEmb', 'MissileManaBurn'],
    ['Mmfl', 'MissileManaFlare'],
    ['Mmir', 'MissileMirrorImage'],
    ['MNpa', 'MissileParasite'],
    ['Mpxf', 'MissilePhoenixFire'],
    ['Mpoi', 'MissilePoisonAttack'],
    ['Mpas', 'MissilePoisonAttackSplash'],
    ['Mspo', 'MissileSlowPoison'],
    ['Msss', 'MissileSlowPoisonSplash'],
    ['MHtb', 'MissileThunderBolt'],
    ['MHt2', 'MissileThunderBoltTwo'],
    ['MNsy', 'MissileSummonFactory'],
    ['Mfbk', 'MissileFeedback'],
    ['Mbof', 'MissileBallsOfFire'],
    ['Mcor', 'MissileCorrosiveBreath'],
    ['Mcbs', 'MissileCorrosiveBreathSplash'],
    ['Mfrz', 'MissileFreezingBreath'],
    ['Mfrs', 'MissileFreezingBreathSplash'],
    ['Mliq', 'MissileLiquidFire'],
    ['Mlis', 'MissileLiquidFireSplash'],
    ['Mfrb', 'MissileFrostBreath'],
    ['MNab', 'MissileAcidBomb'],
    ['MNtm', 'MissileTransmute'],
    ['MNba', 'MissileBlackArrow'],
    ['MNbf', 'MissileBreathOfFire'],
    ['MCbf', 'MissileBreathOfFrost'],
    ['MOcl', 'MissileChainLightning'],
    ['Mpos', 'MissilePossession'],
    ['Mfro', 'MissileFrost'],
    ['Mfss', 'MissileFrostSplash'],
    ['Mfre', 'MissileFreeze'],
    ['Mfzs', 'MissileFreezeSplash'],
    ['MHca', 'MissileColdArrow'],
    ['MHcs', 'MissileColdArrowSplash'],
    ['MOcr', 'MissileCriticalStrike'],
    ['MOcs', 'MissileCriticalStrikeSplash'],
    ['Muco', 'MissileUnstableConcoction'],
    ['Mesn', 'MissileSentinel'],
    ['MEsh', 'MissileShadowStrike'],
    ['MUcs', 'MissileCarrionSwarm'],
    ['MOsh', 'MissileShockwave'],
    ['Msps', 'MissileSpellSteal'],
    ['Mspa', 'MissileSpiderAttack'],
    ['Mspl', 'MissileSpiritLink'],
    ['MNst', 'MissileStampede'],
    ['B-Mi', 'Missile'],
    ['B-Mp', 'MissilePath'],
    ['B-Ms', 'MissileSplash'],
    ['B-Mb', 'MissileBounce'],
    ['B-Ml', 'MissileLine'],
    ['BfAi', 'BuffArtillery'],
    ['BfMi', 'BuffMissile'],
    ['BfMs', 'BuffMissileSplash'],
    // WC3ArtilleryList
    ['RNvc', 'ArtilleryVolcano'],
    ['Mpts', 'ArtilleryPlagueToss'],
    ['RNcs', 'ArtilleryClusterRockets'],
    ['Rfsh', 'ArtilleryFragShards'],
    ['Rbof', 'ArtilleryBallsOfFire'],
    ['Rfrb', 'ArtilleryFrostBreath'],
    ['B-Ar', 'Artillery'],
    ['B-Al', 'ArtilleryLine'],
]

const base = 'projectilecode'

typeAdd(base, 'integer')

for (const [id, name] of projectile) {
    paramAdd(name, base, `'${id}'`)
}


export {paramAdd, TriggerParams}
