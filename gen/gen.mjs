import path from 'path'
import {rmdir} from './rmdir.mjs'
import {cpdir} from './cpdir.mjs'
import fs from 'fs'

const root = path.join('..')

const UI = path.join(root, 'src', 'UI')

rmdir(UI)
cpdir(path.join(root, 'src', 'umswe', 'UI'), UI)

//const MiscData = path.join(UI, 'MiscData.txt')

//const commonj = path.join('..', 'src', 'common.j')

/**
 * @param {string} filePath
 * @param {string} s
 * @param {string} part
 */
const append = (filePath, s, part) => {
    const data = fs.readFileSync(filePath)
    const h = `[${part}]`
    const pos = data.indexOf(h) + h.length
    fs.writeFileSync(filePath, Buffer.concat([data.subarray(0, pos), Buffer.from('\n' + s), data.subarray(pos)]))
}

const TriggerData = path.join(UI, 'TriggerData.txt')
const TriggerStrings = path.join(UI, 'TriggerStrings.txt')
const WorldEditStrings = path.join(UI, 'WorldEditStrings.txt')

append(TriggerData, 'TC_UJAPI=WESTRING_TRIGCAT_UJAPI,ReplaceableTextures\\WorldEditUI\\Actions-UnitSelection', 'TriggerCategories')
append(WorldEditStrings, 'WESTRING_TRIGCAT_UJAPI=UjAPI', 'WorldEditStrings')

append(TriggerData, `
AnalCunt=0,unit,integer,permanentoption
_AnalCunt_Defaults=GetTriggerUnit,0,PermanentPerm
_AnalCunt_Category=TC_UJAPI
`, 'TriggerActions')

append(TriggerStrings, `
AnalCunt=Anal Cunt
AnalCunt="Set Anal of ",~Hero," to ",~Integer,", the effect will be ",~Permanent
AnalCuntHint=Changes the hero's agility [UMSWE]
`, 'TriggerActionStrings')

