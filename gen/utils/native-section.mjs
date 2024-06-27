import {categoryIsMath} from './category-get.mjs'

/**
 *  @param {import('jass-to-ast').Native} native
 *  @return {number}
 */
export default native => {
    const name = native.name
    const r = (native.returns ?? '').toString()

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

    if (
        s('Get', 'Is', 'Convert', 'HandleTo') ||
        c('2', 'To', 'String') ||
        c('Id') && r === 'integer' ||
        categoryIsMath(native)
    ) return 2

    if (!native.returns) return 1
    return 3
}
