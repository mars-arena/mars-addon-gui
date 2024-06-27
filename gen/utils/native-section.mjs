import {categoryIsMath} from './category-get.mjs'

/**
 *  @param {import('jass-to-ast').Native} native
 *  @return {number}
 */
export default native => {
    const n = native.name
    const r = (native.returns ?? '').toString()

    if (
        n.startsWith('Get') ||
        n.startsWith('Is') ||
        n.startsWith('Convert') ||
        n.indexOf('2') >= 0 ||
        n.startsWith('HandleTo') ||
        n.indexOf('Id') >= 0 && r === 'integer' ||
        categoryIsMath(native)
    ) return 2

    if (!native.returns) return 1
    return 3
}
