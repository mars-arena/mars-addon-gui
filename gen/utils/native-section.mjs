import {categoryIsBoolean, categoryIsMath} from './category-get.mjs'

const normSection = s => {
    const t = String(s).replace(/\s+/g, '').toLowerCase()
    if (t === 'triggerevents' || t === 'events' || t === 'event') return 'TriggerEvents'
    if (t === 'triggeractions' || t === 'actions' || t === 'action') return 'TriggerActions'
    if (t === 'triggercalls' || t === 'calls' || t === 'call') return 'TriggerCalls'
    return null
}

const getCommentText = native => {
    const c = native.comment
    if (c == null) return null
    const s = typeof c === 'string' ? c : (c && c.value) ? c.value : String(c)
    const bang = s.indexOf('!')
    if (bang < 0) return null
    return s.slice(bang).trim()
}

const sectionsFromComment = native => {
    const text = getCommentText(native)
    if (!text || !text.startsWith('!')) return []
    const out = new Set()
    for (const raw of text.split(',')) {
        const tok = raw.trim()
        if (!tok || tok.startsWith('[')) continue
        const canon = normSection(tok)
        if (canon) out.add(canon)
    }
    return Array.from(out)
}

/**
 *  @param {import('jass-to-ast').Native} native
 *  @return {string[]} 'TriggerEvents' | 'TriggerActions' | 'TriggerCalls'
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

    const fromComment = sectionsFromComment(native)
    if (fromComment.length) return fromComment

    if (s('Create', 'Destroy') && r === '') return ['TriggerActions']

    if (
        s('Get', 'Is', 'Convert', 'HandleTo') ||
        c('2', 'To', 'String', 'Version') ||
        (c('Id') && r === 'integer') ||
        categoryIsMath(native) ||
        categoryIsBoolean(native)
    ) return ['TriggerCalls']

    if (!native.returns) return ['TriggerActions']

    return ['TriggerActions', 'TriggerCalls']
}
