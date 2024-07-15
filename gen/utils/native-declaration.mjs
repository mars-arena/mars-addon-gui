/**
 * @param {import('jass-to-ast').Native} native
 * @return {string}
 */
export default native => {
    let out = `native ${native.name} takes `

    if (native.params) {
        const param = []
        for (const p of native.params) {
            param.push(`${p.type} ${p.name}`)
        }
        out += `${param.join(', ')}`
    } else {
        out += 'nothing'
    }

    out += ` returns ${native.returns ?? 'nothing'}`

    return out
}
